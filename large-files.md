# Large Files — Google Drive Index

Diese Dateien sind nicht im Git-Repo (zu gross / Binary). Sie liegen auf Google Drive unter:
**`CTA large Files/`** (Ordnerstruktur entspricht dem Projekt)

Google Drive: https://drive.google.com/drive/u/0/ (stephan.bithawk@gmail.com)

---

## Week 1 — Articulate the Value / Current and To-Be Architecture

| Datei | Beschreibung |
|-------|-------------|
| `Weeks/Week-1/ServiceNow Capability Map Template.pptx` | Capability Map Template für Task-Abgabe |
| `Weeks/Week-1/Tasks/Group uploaded files/GlobalPort_ServiceNow_To Be Architecture.docx` | Gruppenabgabe: To-Be Architecture Dokument |
| `Weeks/Week-1/Tasks/Group uploaded files/GlobalPort_ServiceNow_v2.pptx` | Gruppenabgabe: Präsentation v2 |
| `Weeks/Week-1/Tasks/Group uploaded files/GlobalPort_To-Be_Architecture.pptx` | Gruppenabgabe: To-Be Architecture PPT |
| `Weeks/Week-1/Tasks/Group uploaded files/Group ASS0002510 - Solution Overview Template.docx` | Gruppenabgabe: Solution Overview |
| `Weeks/Week-1/Tasks/Group uploaded files/Group Articulate the Value_Business Mapping.xlsx` | Gruppenabgabe: Business Mapping |
| `Weeks/Week-1/Tasks/Group uploaded files/Group Articulate the Value_Value Proposition.xlsx` | Gruppenabgabe: Value Proposition |
| `Weeks/Week-1/Tasks/Group uploaded files/ServiceNow Capability Map (fixed).pptx` | Gruppenabgabe: Capability Map (korrigiert) |
| `Weeks/Week-1/Tasks/Group uploaded files/Solution Overview.drawio` | Gruppenabgabe: Solution Overview Diagramm |
| `Weeks/Week-1/Tasks/Group uploaded files/Week 1 activities.zip` | Alle Week-1 Aktivitäten als ZIP |

---

## Week 2 — Instance and Release Strategy

| Datei | Beschreibung |
|-------|-------------|
| `Weeks/Week-2/Tasks/Acme_Instance_Strategy.pptx` | Task-Template: Instance Strategy Präsentation |
| `Weeks/Week-2/Tasks/Acme_Instance_Strategy_Task1.docx` | Task-Template: Instance Strategy Dokument |
| `Weeks/Week-2/Tasks/Group uploaded files/Acme_Instance_Strategy V3.pptx` | Gruppenabgabe: Instance Strategy v3 |
| `Weeks/Week-2/Tasks/Group uploaded files/Acme_Instance_Strategy_Task1.docx` | Gruppenabgabe: Instance Strategy Task 1 |

---

## Week 3 — Technical Governance

| Datei | Beschreibung |
|-------|-------------|
| `Weeks/Week-3/Tasks/Week-3-Template.pptx` | Task-Template: Technical Governance Präsentation |

---

## Neue Files hinzufügen

Wenn neue binäre Files ins Projekt kommen (pptx, docx, xlsx, zip, drawio):

```bash
cd ~/ServiceNow-CTA
git ls-files --others --ignored --exclude-standard | grep -v "^\.claude/" | while read f; do
  mkdir -p "gdrive/CTA large Files/$(dirname "$f")"
  cp "$f" "gdrive/CTA large Files/$f" && echo "OK: $f"
done
```

Danach diese Datei (`large-files.md`) mit den neuen Files ergänzen und committen.
