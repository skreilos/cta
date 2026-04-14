# Week 1 - Zusammenfassung

## Role of the Technical Architect

- Übersetzt Kundenanforderungen in architektonische Blueprints
- Technisches Gateway zwischen Sales-Designs und Delivery-Teams (PMs, BAs, Architects, Developers)
- Begleitet technische Governance-Prozesse und das Operating Model Design
- Reduziert Risiko und minimiert Technical Debt durch Platform-Erfahrung

> **CTAs brauchen mehr als technische Skills — Service Management, Operational Skills und Soft Skills (Kommunikation, Verhandlung, Einfluss) sind gleichwertig**

---

## Articulate the Value of the Platform

### Value Proposition

- Organisationen erreichen Business Outcomes durch **People, Processes, Technology**
- Key Outcomes: Single System of Truth for IT, optimized service delivery, cybersecurity risks mitigated, application inventory managed, customer engagement reimagined
- Value Propositions müssen durch **klare, messbare Evidenz** belegt werden: Daten, ROI, Customer Success Stories, KPIs

### 3 Schritte für eine Value Proposition

1. Gewünschte Outcomes des Kunden verstehen
2. Relevante Lösungen und Capabilities identifizieren
3. Werthaltige Metriken kommunizieren, die dem Kunden wichtig sind

### 2 Schlüsselressourcen

| Resource | Zweck |
|----------|-------|
| **Now Create** | Prescriptive Methodology — Success Packs mit Blueprints, Leading Practices, Projektempfehlungen |
| **Resource Center** | Repository: Analyst Reports, Solution Briefs, Customer Case Studies, eBooks, Whitepapers |

> **Success Packs sind das Herzstück von Now Create — nicht Teil des Resource Centers**

### Know Your Audience

| Persona | Fokus |
|---------|-------|
| **Executives (CIO, CFO)** | ROI, strategischer Impact, Kosteneinsparung, Security & Compliance (high-level) |
| **IT Leaders** | System Performance, Governance, Skalierbarkeit, Alignment mit IT-Strategie |
| **Developers** | APIs, Integration Patterns, Technical Specs, Error Handling |
| **Process Users** | UX-Verbesserungen, weniger manueller Aufwand, Self-Service, benötigtes Training |

---

## Current and To-Be Architecture

### DEAP — 4 Technical Architecture Domains

| Domain | Fokus |
|--------|-------|
| **D — Data Management** | Datenqualität, Sicherheit, Zuverlässigkeit; Ownership, Verfügbarkeit, Integrationsstandards |
| **E — Environment Management** | Dev/Test/Release Workflows; Security Controls und User Access pro Instanz |
| **A — App Development Management** | Entwicklungsstandards, Leading Practices, Reduzierung Technical Debt |
| **P — Platform Management** | Upgrades, Patches, Access, Maintenance; langfristig weniger Wartungsaufwand |

### 3-Schritt Vorgehen für Architecture Assessment

1. **Stakeholder identifizieren** — strukturierte Interviews, Dokumentation sammeln
2. **Dokumentieren, Analysieren, Interpretieren** — Redundanzen, Gaps, Misalignment erkennen
3. **Findings präsentieren** — strukturierte Diagramme, Heatmaps; mit Stakeholdern validieren

### Interview Leading Practices

- Unter **einer Stunde** halten
- Max. **zwei Teilnehmer** pro Session
- **Offene Fragen** stellen
- Dokumente anfragen
- Fokus auf die vier DEAP-Domänen

### Heatmap

- **CUS** = Customer Effort / **ENG** = Engagement Effort
- Grün = kein Gap / Baseline-Funktionalität
- Gelb = kleiner Gap / Konfiguration nötig
- Pink/Rot = signifikanter Gap / muss gebaut werden oder unbekannt

> **Immer Aufwandsschätzungen präsentieren — auch wenn approximativ. Fehlende Schätzungen untergraben die Glaubwürdigkeit.**

### Dokumentationskategorien

- Applications & Software
- Infrastructure (Cloud, On-Premises, Netzwerke)
- Data Flows
- Security & Compliance

### Bestehende ServiceNow Kunden

- **ServiceNow Capability Map**: dokumentiert lizenzierte, aktivierte und aktiv genutzte Produkte
- **Hot Spots** identifizieren (Bereiche die Verbesserung brauchen)
- Pink = Verbesserungsbereich / Light Blue = lizenziert

> **Stakeholder Buy-in ist der wichtigste Aspekt jeder Assessment — Playback Session = Validierung, keine Konfrontation**

### To-Be Architecture Diagram

Enthält: ServiceNow Instanzen, verteilte Systeme, Integrationen, Authentifizierungssysteme, Portale, Data Lakes, externe Serviceprovider

### Transition Architecture

- Bridge zwischen Current State und To-Be State via **inkrementelle Phasen**
- Verwaltet Komplexität und Risiko bei Business Continuity
- Zweck jeder Phase muss den Stakeholdern klar erklärt werden

### Häufige Herausforderungen

- Kein Executive Sponsorship → schwierig Beteiligung und strategische Ausrichtung zu sichern
- Nur IT-Teams einbeziehen → fehlendes Verständnis wie Technologie tatsächlich genutzt wird
- Zu viele Personen in Interviews → unkonzentrierte Sessions, keine Tiefe

---

## Communication Essentials

### Pyramid Model of Communication (Bottom to Top)

1. **Credibility Foundation** — Vertrauen durch Zuverlässigkeit und Professionalität
2. **Information Governance** — Richtige Infos mit den richtigen Personen teilen
3. **Message Architecture** — Inhalt, Zielgruppe und Timing strukturieren
4. **Expression Strategy** — Ton, Lieferstil und Klarheit
5. **Contextual Personalization** — Kommunikation auf individuelle Bedürfnisse anpassen

### 5 Schritte zur Kommunikation von Value

1. **Discover** — Gespräche fördern um Pain Points zu identifizieren
2. **Listen & Empathize** — Bedenken reflektieren, Verständnis zeigen
3. **Tailor Message** — Capabilities auf Bedürfnisse mappen
4. **Align to Objectives** — Mit Business Outcomes verknüpfen
5. **Quantify** — Messbare Benefits teilen

### Feedback Modelle

| Modell | Struktur | Wann |
|--------|----------|------|
| **SBI** | Situation → Behavior → Impact | Konzises, ereignisfokussiertes Feedback |
| **CEDAR** | Context → Example → Diagnosis → Action → Review | Tieferes, entwicklungsorientiertes Feedback |

> **Architekten müssen komplexe Infos in klare Botschaften übersetzen — unklare Kommunikation führt zu falschen Entscheidungen und verlorenem Stakeholder-Vertrauen**
