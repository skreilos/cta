# Week 3 - Zusammenfassung

## Was ist Governance?

- Entscheidungsframework: definiert wie ServiceNow-Strategie-, Portfolio- und technische Entscheidungen getroffen werden, und wer die Autorität dazu hat
- **Nicht** das Operating Model (Operating Model = wie Produkte/Services zu Konsumenten gelangen)
- Governance ist fundamental für das Wachstum und die Skalierung einer Enterprise-Platform

**Warum in Governance investieren?**
- Treibt die Transformationsvision: richtet Investments an strategischen Zielen aus
- Liefert die richtige Arbeit zur richtigen Zeit: klare Rollen, weniger Blockaden
- Erhält die Integrität der Implementierung: Leitlinien, Standards, Best Practices

---

## Governance Key Players

| Rolle | Hauptverantwortung |
|-------|-------------------|
| **Executive Sponsor** | Vorsitz Executive Steering Committee; setzt Vision, sichert Funding |
| **Platform Owner** | Strategische Roadmap; Governance Policies; Co-Chair TGB möglich |
| **Platform Architect** | Best Practices für Data Modelling, Integrations, Configs; Co-Chair TGB |
| **Demand Manager** | Vorsitz Demand Board; Demand-Priorisierung nach Value/Urgency/Resources |
| **Process Owner** | Best Practices für eigenen Prozess; genehmigt Prozessänderungen |
| **Developer / Admin** | Impact Assessment; Dokumentation; Change Control |

---

## Governance Boards

**3 Boards, 3 Fokusebenen:**

| Board | Fokus | Zusammensetzung |
|-------|-------|-----------------|
| **Executive Steering Board** | Strategie | Senior IT + Business Leaders |
| **Demand Board** | Portfolio | Platform & Process Owners |
| **Technical Governance Board** | Technisch | IT Leaders + Architects |

Flow: ESB → strategische Prinzipien → Demand Board → Demand für Assessment → TGB → Lösung/Design/Impact/Effort → Operations CAB → Implementierung

> **Schlüssel: Separate Expertise pro Ebene, aber offene Kommunikation zwischen Boards verhindert Silo-Denken**

---

## Technical Governance Domains (DEAP)

Das TGB überwacht 4 Domänen:

### Data Management
- **Data Owners**: verantwortlich für Genauigkeit, müssen Policies durchsetzen können
- **Data Stewards**: verbessern Compliance mit Policies und Standards
- Tools: Discovery, Service Mapping, Identification & Reconciliation Engine
- Production = Single Source of Truth; IDR oder Cloning für Konsistenz über Instanzen

### Environment Management
- Instance Structure = Fundament des Environment Governance
- Früh definieren — idealerweise im Pre-Sales Engagement mit ServiceNow

### App Development Management
> **Custom Development nur wenn Configuration die Business Needs nicht erfüllt**
> **Konsistente Naming Conventions über alle Artifacts (Update Sets, Script Includes, Business Rules, Workflows, Tables)**
> **Entscheidungsfrage: Überwiegt der Business-Value die Risiken (Technical Debt, Upgradeability)?**

### Platform Management
**Access Policies definieren:**
- Wer hat Zugang? Welches Level? Prozess für Zugangsanfragen? Training/Zertifizierung? Wer genehmigt?
- Typen: Access Levels, Now Support Access, Temporary Access

**Upgrade Management** (SN Leading Practice: mindestens 1x pro Jahr upgraden):
- Policy-Bereiche: Process, Approvals, Testing, Scheduling, Communications, Support

**Performance Monitoring**: tägliche, wöchentliche, monatliche, quartalsweise Hygiene-Aktivitäten

---

## Governance Golden Rules

- **Out-of-the-box first**: Passe das Business an bevor du die Platform anpasst
- **Single System of Record**: Nur CIs/Attribute/Relationships mit tatsächlichem Verwendungszweck im CMDB
- **Outcomes over Features**: Fokus auf Business Outcomes, nicht Legacy-Features
- **Automation**: Prozesse zur Datenpflege automatisieren
- **80/20 Rule**: 80% des unmittelbaren Business Needs abdecken, nicht für Edge Cases konfigurieren
- **Upgrades**: Auf dem aktuellen Release bleiben (X Monate nach Release) via Rapid Deployment + Automated Testing
- **Integrations**: Nur notwendige Integrationen; Bespoke Builds als letzter Ausweg

---

## Governance & Continuous Improvement

**2 Dimensionen:**
1. Governance Boards priorisieren Platform-Verbesserungen
2. Der Governance-Prozess selbst wird kontinuierlich verbessert

**Key Areas für Continuous Improvement:**
- Feedback Collection, Performance Optimization, Defect Identification & Resolution
- Technology Upgrades, Change Management, Monitoring & Analytics, Stakeholder Engagement, Best Practices

**Tools für Platform Health:**
- **ITOM Health**: AI-basiertes Monitoring, Event Correlation, Log Analytics — Health Log Analytics predicts issues before impact
- **Instance Scan**: Konfigurationsprüfung auf Health Issues und Best Practice Verstösse — nutzbar in Dev Ops, Release Management, Pre/Post Upgrades

---

## Governance Optimization

- Ziel: **richtiges Mass an Governance** — nicht zu wenig, nicht zu viel
- Zu wenig → Unentschlossenheit & Risiken
- Zu viel → "Red Tape", blockiert Innovation

**3 Hebel:**
1. **Metrics definieren**: Was zeigt wann Governance funktioniert?
2. **Bottlenecks entfernen**: Systematisch hinterfragen und beseitigen
3. **Decisions triagen**: Nur die wichtigsten Entscheidungen zu den Boards, Rest an die Front Lines

**Metriken (Lagging vs. Leading):**
- Lagging: Erfolg gegen Top-Level KPIs (schwer direkt auf Governance zurückzuführen)
- Leading: Anzahl Board-Entscheidungen pro Quartal, Participation Rate, % Eskalations-Reduktion, % Policies aktuell

> **Governance-Metriken müssen nicht exakt sein — anekdotische Richtwerte reichen aus**

---

## Key Takeaways

- **Gute Governance beschleunigt Entscheidungen**: Klärt wer entscheidet, wie, und welche Outcomes erwartet werden
- **Strategie treibt Governance**: Erst strategische Entscheidungsprozesse definieren, dann technische Standards daraus ableiten
- **Governance treibt Continuous Improvement**: Integration von Governance und CI ermöglicht Risikomanagement und Wachstum
