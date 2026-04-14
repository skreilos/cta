# ServiceNow CTA - Quiz & Repetitions-System

## 🧠 Dein persönliches Wissens-Training

Das **Quiz-System** nutzt deine bereits gesammelten **Exam-Fragen** und fragt dein Wissen regelmäßig ab. Perfekt für Repetition und zur Prüfungsvorbereitung!

---

## 📋 Befehle

### 1. **Quiz starten** - Alle Fragen
```bash
cta quiz
```
→ Fragt dich alle Fragen auf, die du mit `cta exam-question` gesammelt hast

### 2. **Quiz für Modul** - Modul-spezifische Fragen
```bash
cta quiz "02-Architektur"
```
→ Nur Fragen aus einem bestimmten Modul

### 3. **Quiz-Statistik anzeigen**
```bash
cta quiz-stats
```
→ Zeigt deine bisherigen Quiz-Ergebnisse und Durchschnitte

### 4. **Modul-Statistik**
```bash
cta quiz-stats "02-Architektur"
```
→ Deine Ergebnisse nur für ein Modul

---

## 🎯 Quiz-Ablauf

Wenn du `cta quiz` startest:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Frage 1:
Was ist Enterprise Architecture?

→ Deine Antwort (oder [ENTER] für Lösung):
```

**3 Modi:**

1. **Du tippst eine Antwort:** Das System vergleicht mit der Lösung (intelligentes Matching)
   ```
   → Deine Antwort: EA ist Strategieausrichtung
   ✅ Richtig!
   ```

2. **Du drückst ENTER:** Das System zeigt die Lösung, du bewertest selbst
   ```
   → Deine Antwort (oder [ENTER] für Lösung): [ENTER]

   ✅ Lösung:
      Ein strategisches Konzept für IT-Ausrichtung und Geschäftsziele

   War deine Antwort korrekt? (j/n): j
   ```

3. **Quiz-Ergebnis:** Nach allen Fragen siehst du deine Statistik
   ```
   ╔═══════════════════════════════════════════════════════════════╗
   ║                    📊 QUIZ-ERGEBNIS 📊                        ║
   ╚═══════════════════════════════════════════════════════════════╝

   Fragen beantwortet: 10
   ✅ Richtig: 8
   ❌ Falsch: 2
   📈 Erfolgsquote: 80%

   💾 Quiz-Ergebnis gespeichert
   ```

---

## 💡 Praktischer Lernplan

### **Woche 1-2: Grundlagen lernen**
```bash
# Notizen und Ressourcen sammeln
cta note "01-Grundlagen" "ServiceNow Architektur verstehen"
cta resource "01-Grundlagen" "https://..." --title "Intro Guide"

# Erste Fragen sammeln
cta exam-question "Was ist ServiceNow?" --answer "Cloud-basierte Plattform für Enterprise Services" --modul "01-Grundlagen"
```

### **Woche 3-4: Vertiefung + erste Quiz**
```bash
# Mehr Fragen hinzufügen während du lernst
cta exam-question "Erkläre die Service Architecture" --answer "..." --modul "02-Architektur"

# Erstes Quiz machen
cta quiz "01-Grundlagen"

# Fortschritt tracken
cta progress "01-Grundlagen" 60
```

### **Woche 5-8: Intensive Vorbereitung**
```bash
# Tägliches Quiz
cta quiz "02-Architektur"

# Statistik überprüfen
cta quiz-stats

# Bei schwachen Bereichen: Mehr notizen und Ressourcen
cta note "02-Architektur" "Scalability Patterns - nochmal wiederholen!"
cta resource "02-Architektur" "https://patterns-guide" --title "Best Patterns"
```

### **Woche 9-10: Finale Prüfungsvorbereitung**
```bash
# Vollständiges Quiz durcharbeiten
cta quiz

# Schwache Punkte identifizieren
cta quiz-stats

# Nochmal gezielt diese Module üben
cta quiz "02-Architektur"
cta quiz "03-Platform-Admin"
```

---

## 📊 Statistik & Fortschritt

### **Einzelne Quiz-Ergebnisse sehen:**
```bash
cta quiz-stats
```
→ Zeigt deine letzten 5 Quiz-Durchläufe mit Zeitstempel

### **Durchschnitts-Erfolgsquote:**
```bash
# Wird automatisch am Ende von quiz-stats angezeigt:
📊 Gesamtstatistik (alle Quiz):
   Fragen gesamt: 50
   ✅ Richtig: 42
   ❌ Falsch: 8
   📈 Durchschnitt: 84%
```

---

## 🔄 Repetitions-Strategien

### **Täglich (5-10 Min)**
```bash
# Jeden Morgen ein kurzes Modul-Quiz
cta quiz "02-Architektur"  # ~5 Fragen
```

### **Wöchentlich (30-45 Min)**
```bash
# Vollständiges Quiz durcharbeiten
cta quiz

# Statistik überprüfen
cta quiz-stats
```

### **Schwache Bereiche gezielt üben**
```bash
# Wenn du siehst, dass ein Modul schlecht läuft:
cta quiz "03-Platform-Admin"
cta note "03-Platform-Admin" "Schwache Punkte: XYZ"
cta resource "03-Platform-Admin" "https://video-link" --title "Video dazu"
cta quiz "03-Platform-Admin"  # Direkt nochmal üben
```

---

## 🎓 Best Practices

1. **Konsistenz**: Tägliche kurze Quizze sind besser als wöchentliche lange Sessions
2. **Notizen machen**: Wenn du eine Frage falsch beantwortest → direkt eine Notiz mit `cta note`
3. **Ressourcen hinzufügen**: Schwache Bereiche = mehr Ressourcen sammeln
4. **Statistik nutzen**: Regelmäßig `cta quiz-stats` checken, um Trends zu sehen
5. **Spaced Repetition**: Später auch ältere Quizze wiederholen für besseres Gedächtnis

---

## 📁 Wo werden die Daten gespeichert?

```
.data/
├── exam-questions.json    # Deine Fragen (von cta exam-question)
└── quiz-stats.json        # Deine Quiz-Ergebnisse (automatisch)
```

Alles lokal, offline-ready, jederzeit einsehbar!

---

## ❓ Tipps & Tricks

- **ENTER drücken für Lösung**: Gut um zu peeken, wenn du wirklich nicht weiterkommst
- **Selbst bewerten**: Manchmal ist deine Antwort auch "richtig genug" - selbst entscheiden!
- **Quiz wiederholen**: Jeden Quiz 2-3x machen, die Erfolgsquote sollte steigen
- **Modul-Fokus**: Immer die schwächsten Module zuerst trainieren

---

Viel Erfolg beim Trainieren! 💪🎓
