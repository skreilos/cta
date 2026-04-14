# ServiceNow CTA - Learning Manager Skill v2.0

## 🏗️ Ein Haus bauen - Der neue Workflow

Das Skill wurde komplett neu aufgebaut! Hier ist wie es funktioniert:

---

## 📖 Der Workflow

### **1. Notizen schreiben**

```bash
cta note "02-Architektur"
```

Das System fragt dich nach dem Modul (oder du gibst es direkt an).
Dann schreibst du einfach deine Notizen ein, jede mit **ENTER** bestätigt:

```
📝 Notizen für 02-Architektur (beende mit leerem ENTER):
   Tipp: Nutze 'Wichtig:' oder '!!' um wichtige Punkte zu markieren

→ Ein Haus hat vier wände
→ das haus wird meist mit Fenster und Türen gebaut
→ Wichtig: Wenn das Dach nicht die optimale Schräge aufweist kann es hinein regnen
→ der Rasen um das Haus ist meist grün
→ Die Garage wird meist vergessen!!
→ [ENTER]
```

### **2. System speichert strukturiert**

Deine Notizen werden in Markdown mit intelligenter Formatierung gespeichert:

```markdown
# 02-Architektur

Ein Haus hat vier wände

das haus wird meist mit Fenster und Türen gebaut

---
**Wenn das Dach nicht die optimale Schräge aufweist kann es hinein regnen**
---

der Rasen um das Haus ist meist grün

---
**Die Garage wird meist vergessen**
---
```

**Automatische Formatierung:**
- Normale Notizen: einfacher Text
- `Wichtig: XXX` → wird zu `---\n**XXX**\n---`
- `XXX!!` → wird zu `---\n**XXX**\n---`
- **In MD-Preview:** Wichtige Stellen sind mit `---` umrahmt und fett ✨

### **3. Quiz-Fragen generieren**

```bash
cta extract-quiz "02-Architektur"
```

Das System:
- 🔍 Sucht alle Blöcke mit `---` in deinen Notizen
- ❓ Konvertiert sie zu Quiz-Fragen
- 💾 Speichert alles in `.data/exams.json`

Output:
```
🔍 Suche wichtige Punkte in 02-Architektur...

❓ Frage 1: Wenn das Dach nicht die optimale Schräge aufweist kann es hinein regnen
❓ Frage 2: Die Garage wird meist vergessen

✅ 2 Quiz-Fragen aus 02-Architektur generiert
```

### **4. Quiz spielen**

```bash
cta quiz "02-Architektur"
```

Beantworte dein Wissen:
```
╔═══════════════════════════════════════════════════════════════╗
║           🧠 SERVICENOW CTA - WISSENS-QUIZ 🧠                ║
╚═══════════════════════════════════════════════════════════════╝

📚 Modul: 02-Architektur

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Frage 1:
Wenn das Dach nicht die optimale Schräge aufweist kann es hinein regnen

→ Deine Antwort (oder [ENTER] für weiter):
```

---

## 🎯 Alle Befehle

| Befehl | Funktion |
|--------|----------|
| `cta note [modul]` | Notizen interaktiv schreiben |
| `cta list <modul>` | Alle Notizen zu Modul anzeigen |
| `cta extract-quiz <modul>` | Quiz-Fragen aus Notizen generieren |
| `cta quiz [modul]` | Quiz spielen |
| `cta quiz-stats [modul]` | Quiz-Ergebnisse anzeigen |
| `cta progress <modul> <0-100>` | Fortschritt tracken |
| `cta resource <modul> <url> --title "titel"` | Ressource hinzufügen |
| `cta status` | Alle Module anzeigen |
| `cta help` | Diese Hilfe |

---

## 💡 Best Practices

### **Notizen schreiben:**
✅ Schreib deine Gedanken auf, währenddessen du lernst
✅ Markiere mit `Wichtig:` oder `!!` was du nicht vergessen darfst
✅ Mehrere Zeilen möglich - jede mit ENTER

### **Fortschritt:**
✅ Nach jeder Lerneinheit: `cta progress "02-Architektur" 50`
✅ Am Ende: `cta list "02-Architektur"` um alles zu sehen

### **Quiz-Generierung:**
✅ Erst Notizen schreiben
✅ Regelmäßig `cta extract-quiz` aufrufen (generiert neue Fragen)
✅ Die Fragen werden zu den bisherigen hinzugefügt

### **Quiz-Training:**
✅ Täglich: `cta quiz "02-Architektur"` (5-10 Min)
✅ Wöchentlich: `cta quiz` (alle Module)
✅ Statistik checken: `cta quiz-stats`

---

## 📁 Dateistruktur

```
ServiceNow-CTA/
├── .data/
│   ├── notes/                    # Deine Notizen (MD)
│   │   ├── 01-Grundlagen.md
│   │   ├── 02-Architektur.md
│   │   └── ...
│   ├── exams.json               # Generierte Quiz-Fragen
│   ├── quiz-stats.json          # Quiz-Ergebnisse
│   ├── progress.json            # Fortschritt
│   └── resources.md             # Links
├── .bin/
│   └── cta-manager.sh           # Das Skill
└── [01-09] Ordner/              # Deine Inhalte
```

---

## ❓ FAQ

**Q: Ich habe eine Notiz falsch geschrieben, wie ändere ich sie?**
A: Öffne die `.data/notes/XX-Modul.md` Datei und edit sie direkt!

**Q: Wie füge ich neue Notizen hinzu?**
A: `cta note "02-Architektur"` - System fragt, falls nicht angegeben

**Q: Können Quiz-Fragen mehrere Zeilen haben?**
A: Ja! Alles zwischen `---` wird zu einer Frage

**Q: Wann sollte ich `extract-quiz` aufrufen?**
A: Nachdem du neue Notizen mit Markern geschrieben hast

**Q: Löschen Marker meine Notizen?**
A: Nein! Sie werden zu `---**Text**---` konvertiert (noch lesbar)

---

## 🚀 Beispiel-Session

```bash
# Modul 02 starten
cta note "02-Architektur"
→ Enterprise Architecture ist zentral
→ Wichtig: Scalability Patterns: Horizontal, Vertical, Caching
→ Load Balancing verteilt Anfragen
→ [ENTER]

# Notizen anschauen
cta list "02-Architektur"

# Fortschritt
cta progress "02-Architektur" 30

# Fragen generieren
cta extract-quiz "02-Architektur"

# Quiz machen
cta quiz "02-Architektur"

# Ergebnisse sehen
cta quiz-stats
```

---

Viel Erfolg beim "Hausbau"! 🏗️🎓
