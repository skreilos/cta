#!/bin/bash

# ServiceNow CTA Learning Manager Skill - Version 3.0
# Intelligente Notizen → Zusammenfassungen → Quiz-Fragen
# Mit Claude API Integration für intelligente Generierung

CTA_BASE="$HOME/ServiceNow-CTA"
DATA_DIR="$CTA_BASE/.data"
EXAMS_FILE="$DATA_DIR/exams.json"
QUIZ_STATS_FILE="$DATA_DIR/quiz-stats.json"

# Initialisierung
init_data() {
    mkdir -p "$DATA_DIR"
    [ -f "$EXAMS_FILE" ] || echo '[]' > "$EXAMS_FILE"
    [ -f "$QUIZ_STATS_FILE" ] || echo '[]' > "$QUIZ_STATS_FILE"
}

# HELP
show_help() {
    cat << 'EOF'
╔═══════════════════════════════════════════════════════════════════╗
║        ServiceNow CTA - Learning Manager Skill v3.0               ║
║         Notizen → Zusammenfassung → Quiz-Fragen                   ║
╚═══════════════════════════════════════════════════════════════════╝

BEFEHLE:

  1️⃣  NOTE - Notizen im Modul-Ordner schreiben
      $ cta note "02-Architektur"
      → Speichert in: 02-Architektur/Notizen.md

  2️⃣  SUMMARIZE - Zusammenfassung aus Notizen generieren (mit Claude API)
      $ cta summarize "02-Architektur"
      → Erstellt: 02-Architektur/Zusammenfassung.md

  3️⃣  EXTRACT-QUIZ - Quiz-Fragen aus Datei generieren (mit Claude API)
      $ cta extract-quiz "02-Architektur" "Zusammenfassung.md"
      $ cta extract-quiz "02-Architektur" "Notizen.md"

  4️⃣  QUIZ - Wissens-Quiz spielen
      $ cta quiz [modul]

  5️⃣  QUIZ-STATS - Quiz-Ergebnisse anzeigen
      $ cta quiz-stats [modul]

  6️⃣  LIST - Alle Dateien eines Moduls anzeigen
      $ cta list "02-Architektur"

  7️⃣  STATUS - Alle Module anzeigen
      $ cta status

  8️⃣  PROGRESS - Fortschritt tracken
      $ cta progress <modul> <0-100>

  9️⃣  HELP - Diese Hilfe anzeigen
      $ cta help

═══════════════════════════════════════════════════════════════════

WORKFLOW:

  1. Notizen schreiben:
     $ cta note "02-Architektur"
     → Input mit Wichtig: oder !!
     → Speichert in: 02-Architektur/Notizen.md

  2. Zusammenfassung generieren:
     $ cta summarize "02-Architektur"
     → Erstellt: 02-Architektur/Zusammenfassung.md

  3. Quiz-Fragen generieren:
     $ cta extract-quiz "02-Architektur" "Zusammenfassung.md"

  4. Quiz spielen:
     $ cta quiz "02-Architektur"

WICHTIG: Für summarize + extract-quiz brauchst du einen Claude API Key:
  export ANTHROPIC_API_KEY="sk-ant-..."

═══════════════════════════════════════════════════════════════════
EOF
}

# NOTE - Notizen in Modul-Ordner speichern
add_note() {
    local modul="$1"

    if [ -z "$modul" ]; then
        echo ""
        echo "📚 Für welches Modul möchtest du eine Notiz schreiben?"
        echo ""
        local i=1
        for dir in $CTA_BASE/[0-9][0-9]-*/; do
            if [ -d "$dir" ]; then
                echo "$i) $(basename "$dir")"
                ((i++))
            fi
        done
        echo ""
        read -p "→ Auswahl (Nummer): " selection

        i=1
        for dir in $CTA_BASE/[0-9][0-9]-*/; do
            if [ -d "$dir" ]; then
                if [ "$selection" = "$i" ]; then
                    modul=$(basename "$dir")
                    break
                fi
                ((i++))
            fi
        done

        if [ -z "$modul" ]; then
            echo "❌ Ungültige Auswahl"
            return 1
        fi
    fi

    local note_file="$CTA_BASE/$modul/Notizen.md"

    # Datei initialisieren
    if [ ! -f "$note_file" ]; then
        echo "# $modul - Notizen" > "$note_file"
        echo "" >> "$note_file"
    fi

    echo ""
    echo "📝 Notizen für $modul (beende mit leerem ENTER):"
    echo "   Tipp: Nutze 'Wichtig:' oder '!!' um wichtige Punkte zu markieren"
    echo ""

    while true; do
        read -p "→ " input
        [ -z "$input" ] && break

        local text=$(echo "$input" | sed 's/^ *//;s/ *$//')

        if [[ "$text" =~ ^Wichtig: ]]; then
            local content=$(echo "$text" | sed 's/^Wichtig: //')
            echo "" >> "$note_file"
            echo "---" >> "$note_file"
            echo "**$content**" >> "$note_file"
            echo "---" >> "$note_file"
        elif [[ "$text" =~ !!$ ]]; then
            local content=$(echo "$text" | sed 's/!!$//')
            echo "" >> "$note_file"
            echo "---" >> "$note_file"
            echo "**$content**" >> "$note_file"
            echo "---" >> "$note_file"
        else
            echo "$text" >> "$note_file"
        fi
    done

    echo "✅ Notizen zu $modul in $modul/Notizen.md gespeichert"
}

# SUMMARIZE - Zusammenfassung mit Claude API generieren
summarize() {
    local modul="$1"

    if [ -z "$modul" ]; then
        echo "❌ Fehler: cta summarize <modul>"
        return 1
    fi

    local note_file="$CTA_BASE/$modul/Notizen.md"
    local summary_file="$CTA_BASE/$modul/Zusammenfassung.md"

    if [ ! -f "$note_file" ]; then
        echo "❌ Keine Notizen für $modul vorhanden"
        return 1
    fi

    # API Key prüfen
    if [ -z "$ANTHROPIC_API_KEY" ]; then
        echo "❌ ANTHROPIC_API_KEY nicht gesetzt"
        echo "   Setze: export ANTHROPIC_API_KEY='sk-ant-...'"
        return 1
    fi

    echo ""
    echo "🤖 Generiere Zusammenfassung für $modul mit Claude API..."
    echo ""

    local note_content=$(cat "$note_file")

    # Claude API Call
    local response=$(curl -s "https://api.anthropic.com/v1/messages" \
        -H "content-type: application/json" \
        -H "x-api-key: $ANTHROPIC_API_KEY" \
        -H "anthropic-version: 2023-06-01" \
        -d "{
            \"model\": \"claude-opus-4-6\",
            \"max_tokens\": 2048,
            \"messages\": [
                {
                    \"role\": \"user\",
                    \"content\": \"Erstelle eine strukturierte Zusammenfassung der folgenden Notizen. Verwende Markdown-Format mit Headings und Bullet Points. Markiere die wichtigsten Punkte mit **Fettdruck**:\\n\\n$note_content\"
                }
            ]
        }")

    # Antwort extrahieren
    local summary=$(echo "$response" | grep -o '"text":"[^"]*"' | head -1 | sed 's/"text":"//' | sed 's/"$//')

    if [ -z "$summary" ]; then
        echo "❌ Fehler bei Claude API Call"
        echo "Response: $response"
        return 1
    fi

    # Zusammenfassung speichern
    echo "# $modul - Zusammenfassung" > "$summary_file"
    echo "" >> "$summary_file"
    echo "$summary" >> "$summary_file"

    echo "✅ Zusammenfassung erstellt in $modul/Zusammenfassung.md"
    echo ""
}

# EXTRACT-QUIZ - Fragen mit Claude API generieren
extract_quiz() {
    local modul="$1"
    local filename="${2:-Zusammenfassung.md}"

    if [ -z "$modul" ]; then
        echo "❌ Fehler: cta extract-quiz <modul> [datei.md]"
        return 1
    fi

    local source_file="$CTA_BASE/$modul/$filename"

    if [ ! -f "$source_file" ]; then
        echo "❌ Datei nicht gefunden: $modul/$filename"
        return 1
    fi

    # API Key prüfen
    if [ -z "$ANTHROPIC_API_KEY" ]; then
        echo "❌ ANTHROPIC_API_KEY nicht gesetzt"
        echo "   Setze: export ANTHROPIC_API_KEY='sk-ant-...'"
        return 1
    fi

    echo ""
    echo "🤖 Generiere Quiz-Fragen aus $modul/$filename mit Claude API..."
    echo ""

    local content=$(cat "$source_file")

    # Claude API Call für Fragen-Generierung
    local response=$(curl -s "https://api.anthropic.com/v1/messages" \
        -H "content-type: application/json" \
        -H "x-api-key: $ANTHROPIC_API_KEY" \
        -H "anthropic-version: 2023-06-01" \
        -d "{
            \"model\": \"claude-opus-4-6\",
            \"max_tokens\": 2048,
            \"messages\": [
                {
                    \"role\": \"user\",
                    \"content\": \"Erstelle 5-10 Quiz-Fragen basierend auf dem folgenden Text. Format: Jede Frage auf einer neuen Zeile mit 'Q: ' prefix, Antwort mit 'A: ' prefix.\\n\\n$content\"
                }
            ]
        }")

    local questions=$(echo "$response" | grep -o '"text":"[^"]*"' | head -1 | sed 's/"text":"//' | sed 's/"$//')

    if [ -z "$questions" ]; then
        echo "❌ Fehler bei Claude API Call"
        return 1
    fi

    # Fragen in JSON konvertieren und speichern
    local question_count=0
    while IFS= read -r line; do
        if [[ "$line" =~ ^Q: ]]; then
            local question=$(echo "$line" | sed 's/^Q: //')
            read -r answer_line
            local answer=$(echo "$answer_line" | sed 's/^A: //')

            ((question_count++))

            local timestamp=$(date '+%Y-%m-%d')
            local json_entry="{\"modul\": \"$modul\", \"source\": \"$filename\", \"question\": \"$question\", \"answer\": \"$answer\", \"date\": \"$timestamp\", \"status\": \"open\"}"

            if [ -s "$EXAMS_FILE" ] && [ "$(cat $EXAMS_FILE)" != "[]" ]; then
                sed -i "\$s/\]/,\n    $json_entry\n]/" "$EXAMS_FILE"
            else
                echo "[$json_entry]" > "$EXAMS_FILE"
            fi
        fi
    done <<< "$questions"

    echo "✅ $question_count Quiz-Fragen generiert und gespeichert"
    echo ""
}

# QUIZ - Quiz spielen
run_quiz() {
    local modul="$1"
    local correct=0
    local wrong=0
    local question_count=0

    if [ ! -s "$EXAMS_FILE" ] || [ "$(cat $EXAMS_FILE)" = "[]" ]; then
        echo "❌ Keine Quiz-Fragen vorhanden"
        return 1
    fi

    echo ""
    echo "╔═══════════════════════════════════════════════════════════════╗"
    echo "║           🧠 SERVICENOW CTA - WISSENS-QUIZ 🧠                ║"
    echo "╚═══════════════════════════════════════════════════════════════╝"
    echo ""

    [ -n "$modul" ] && echo "📚 Modul: $modul" || echo "📚 Alle Module"
    echo ""

    while IFS= read -r line; do
        if [[ $line == *"\"question\""* ]]; then
            if [ -n "$modul" ] && ! echo "$line" | grep -q "\"modul\": \"$modul\""; then
                continue
            fi

            ((question_count++))

            local question=$(echo "$line" | sed 's/.*"question": "\(.*\)".*/\1/')

            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo "Frage $question_count:"
            echo "$question"
            echo ""
            read -p "→ Deine Antwort (oder [ENTER] für weiter): " user_answer

            if [ -z "$user_answer" ]; then
                read -p "War deine Antwort korrekt? (j/n): " correct_check
                [[ "$correct_check" == "j" ]] || [[ "$correct_check" == "ja" ]] && ((correct++)) || ((wrong++))
            else
                ((correct++))
            fi
            echo ""
        fi
    done < "$EXAMS_FILE"

    if [ $question_count -gt 0 ]; then
        local percent=$((correct * 100 / question_count))

        echo "╔═══════════════════════════════════════════════════════════════╗"
        echo "║                    📊 QUIZ-ERGEBNIS 📊                        ║"
        echo "╚═══════════════════════════════════════════════════════════════╝"
        echo ""
        echo "Fragen: $question_count | ✅ Richtig: $correct | ❌ Falsch: $wrong | 📈 Quote: $percent%"
        echo ""

        local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
        local quiz_entry="{\"timestamp\": \"$timestamp\", \"modul\": \"${modul:-alle}\", \"questions\": $question_count, \"correct\": $correct, \"wrong\": $wrong, \"percent\": $percent}"

        if [ -s "$QUIZ_STATS_FILE" ] && [ "$(cat $QUIZ_STATS_FILE)" != "[]" ]; then
            sed -i "\$s/\]/,\n    $quiz_entry\n]/" "$QUIZ_STATS_FILE"
        else
            echo "[$quiz_entry]" > "$QUIZ_STATS_FILE"
        fi

        echo "💾 Ergebnis gespeichert"
        echo ""
    fi
}

# QUIZ-STATS
show_quiz_stats() {
    echo ""
    echo "📈 QUIZ-STATISTIK"
    echo "════════════════════════════════════════════════════"
    echo ""

    [ ! -f "$QUIZ_STATS_FILE" ] || [ ! -s "$QUIZ_STATS_FILE" ] && echo "Noch keine Ergebnisse" && return

    [ -n "$1" ] && grep "$1" "$QUIZ_STATS_FILE" || tail -5 "$QUIZ_STATS_FILE"
    echo ""
}

# LIST - Dateien im Modul anzeigen
list_modul() {
    local modul="$1"

    if [ -z "$modul" ]; then
        echo "❌ Fehler: cta list <modul>"
        return 1
    fi

    echo ""
    echo "📂 Modul: $modul"
    echo "════════════════════════════════════════════════════"
    echo ""

    if [ -d "$CTA_BASE/$modul" ]; then
        ls -lh "$CTA_BASE/$modul/" | grep -E "\.md$" | awk '{print "  " $9 " (" $5 ")"}'
    else
        echo "  Ordner nicht vorhanden"
    fi
    echo ""
}

# STATUS
show_status() {
    echo ""
    echo "🎯 CTA Module & Status"
    echo "════════════════════════════════════════════════════"
    echo ""

    for dir in $CTA_BASE/[0-9][0-9]-*/; do
        [ -d "$dir" ] || continue
        local name=$(basename "$dir")
        local note_file="$dir/Notizen.md"
        if [ -f "$note_file" ]; then
            echo "✓ $name ($(wc -l < $note_file) Zeilen)"
        else
            echo "○ $name (leer)"
        fi
    done
    echo ""
}

# PROGRESS
update_progress() {
    local modul="$1"
    local percent="$2"

    [ -z "$modul" ] || [ -z "$percent" ] && echo "❌ Fehler: cta progress <modul> <0-100>" && return 1

    local progress_file="$CTA_BASE/$modul/.progress"
    echo "$percent" > "$progress_file"
    echo "✅ Fortschritt: $modul = $percent%"
}

# MAIN
init_data

case "$1" in
    help|--help|-h) show_help ;;
    note) add_note "$2" ;;
    summarize) summarize "$2" ;;
    extract-quiz) extract_quiz "$2" "$3" ;;
    quiz) run_quiz "$2" ;;
    quiz-stats) show_quiz_stats "$2" ;;
    list) list_modul "$2" ;;
    status) show_status ;;
    progress) update_progress "$2" "$3" ;;
    *) show_help ;;
esac
