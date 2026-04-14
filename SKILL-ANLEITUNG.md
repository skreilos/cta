# ServiceNow CTA - Learning Manager Skill

## 🚀 Quick Start

Der **CTA Learning Manager Skill** ist ein Bash-basiertes Tool zur strukturierten Verwaltung deiner Lernmaterialien.

### Installation
Das Skill ist bereits installiert! Nutze einfach:
```bash
cta help
```

## 📖 Befehle (Übersicht)

### 1. **Notizen erfassen**
```bash
cta note "02-Architektur" "Enterprise Architecture Patterns sind zentral für scalable Systeme"
```
→ Speichert deine Notizen mit Timestamp in `.data/notes/02-Architektur.md`

### 2. **Ressourcen & Links**
```bash
cta resource "03-Platform-Admin" "https://docs.servicenow.com" --title "Admin Documentation"
```
→ Alle Links zentral in `.data/resources.md`

### 3. **Fortschritt tracken**
```bash
cta progress "02-Architektur" 60
```
→ Speichert deinen Lernfortschritt (0-100%) pro Modul

### 4. **Prüfungsfragen sammeln**
```bash
cta exam-question "Was ist ein Service Mesh?" --answer "Eine Infrastruktur-Schicht für Service-Kommunikation" --modul "02-Architektur"
```
→ Sammelt Fragen für die CTA-Zertifizierung

### 5. **Alle Infos zu einem Modul**
```bash
cta list "02-Architektur"
```
→ Zeigt Notizen + Fortschritt zusammengefasst

### 6. **Gesamtstatus**
```bash
cta status
```
→ Überblick über alle Module und Fortschritt

### 7. **Exam-Fragen zu Modul**
```bash
cta show-exam "02-Architektur"
```
→ Alle Prüfungsfragen für ein bestimmtes Modul

### 8. **Hilfe**
```bash
cta help
```
→ Zeigt die komplette Anleitung

---

## 📁 Dateistruktur

```
ServiceNow-CTA/
├── .data/                          (automatisch erstellt)
│   ├── notes/                      (deine Notizen pro Modul)
│   │   ├── 01-Grundlagen.md
│   │   ├── 02-Architektur.md
│   │   └── ...
│   ├── resources.md                (alle Links zentral)
│   ├── progress.json               (Fortschritts-Tracking)
│   └── exam-questions.json         (Prüfungsfragen)
├── .bin/
│   └── cta-manager.sh              (das Skill-Skript)
└── [01-09] Ordner/                 (deine Inhalte)
```

---

## 💡 Praktische Beispiele

### Montag - Neues Modul starten
```bash
cta note "02-Architektur" "Woche 1: Enterprise Architecture Patterns"
cta progress "02-Architektur" 10
cta resource "02-Architektur" "https://servicenow.com/arch-guide" --title "Architecture Guide"
```

### Mittwoch - Fortschritt aktualisieren
```bash
cta note "02-Architektur" "WICHTIG: Scalability Patterns verstanden - horizontal vs vertical scaling"
cta progress "02-Architektur" 40
```

### Freitag - Prüfungsfragen sammeln
```bash
cta exam-question "Erkläre 3 Skalierungsmuster" --answer "1) Horizontal: mehr Server, 2) Vertical: stärkere Hardware, 3) Caching: Datencache" --modul "02-Architektur"
cta exam-question "Was ist Load Balancing?" --answer "Verteilung von Anfragen auf mehrere Server" --modul "02-Architektur"
```

### Übersicht anzeigen
```bash
cta list "02-Architektur"
cta show-exam "02-Architektur"
cta status
```

---

## 🎯 Best Practices

1. **Tägliche Notizen** - Nutze `cta note` um dein Verständnis zu dokumentieren
2. **Wöchentlicher Fortschritt** - Update `cta progress` am Ende jeder Woche
3. **Links sammeln** - Jede nützliche Ressource mit `cta resource` hinzufügen
4. **Fragen während des Lernens** - Nicht bis zur Prüfung warten, sondern mit `cta exam-question` sammeln
5. **Regelmäßig überprüfen** - `cta list` und `cta show-exam` nutzen zum Wiederholen

---

## 🔧 Technische Details

- **Format**: Bash-Skript, agnostisch gegenüber dem Shell
- **Speicherung**: Markdown (Notizen) + JSON (Struktur) für einfache Verwaltung
- **Keine Abhängigkeiten**: Arbeitet mit Standard-Unix-Tools (bash, grep, sed, etc.)
- **Offline-Ready**: Alles lokal in `~/ServiceNow-CTA/.data/`

---

## ❓ Fragen?

Alle Daten werden lokal gespeichert. Du kannst jederzeit in die `.data/` Dateien schauen oder direkt mit `cta` arbeiten!

Viel Erfolg mit der CTA-Ausbildung! 🎓
