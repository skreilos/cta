# Week 2 - Zusammenfassung

## Governance für Instance & Release Strategy

**3 Kernüberlegungen:**
- Balance: Risikominimierung (Kontrolle) vs. Wertrealisierung (Geschwindigkeit)
- Klare Policies für Code-/Datentransfer zwischen Environments
- Abstimmung mit: Operating Model, Platform Scope, Instance Structure, Deployment Methodology

**4 Governance-Bereiche:**
- **Operating Model**: Delegated Dev, SI Partners, DevOps/Separation of Duties
- **Platform Scope**: Apps/Products, Foundation Data, Regression Testing, Integrations, User Communities
- **Instance Structure**: Anzahl/Zweck Environments, Capabilities, Multi-Dev Merge, Multi-Prod Deployment, Cloning
- **Deployment Methodology**: Waterfall/Agile/SAFe, Release Cadence, Testing Strategy, Tooling

---

## Instance Stacks

| Stack | Struktur | Wann |
|-------|----------|------|
| **3-Instance** | Dev → Test → Prod | Klein, schnell, wenig Komplexität |
| **4-Instance** | Dev → QA → UAT → Prod | **~70% aller Implementierungen** — Standard für mittelgrosse bis grosse Orgs |
| **5-Instance** | Dev → QA → UAT → Staging → Prod | Mehrere Teams, komplexe Integrationen, Staging für Pre-Prod Testing |

**Optional**: Training, Sandbox, Innovation

---

## Instance Management Policies

Upfront definieren für:
- **Risikoreduktion**: Änderungen via definierten Prozess & Maintenance Windows
- **MTTR-Reduktion**: Klare Support-Prozeduren und Teams
- **Incident-Prävention**: besonders System Properties & Plugins!

**Policy-Bereiche**: Instance Overview, Support Procedures, Critical Availability, Maintenance, Change Management, Advanced Permissions, System Properties, Plugins

> **In grossen Instances mit mehreren Dev-Teams: System Property Policies kritisch — ein Team kann sonst das andere beeinflussen**

---

## Multi-Dev Environments

Separate Dev-Instances verhindern Konflikte bei paralleler Entwicklung:
- **Split by Product**: Teams arbeiten unabhängig pro Solution
- **Split by Release**: Jeder Release baut auf dem vorherigen auf

Master Data Sync via: Update Sets, App Repository oder Git SCM

---

## Multi-Production Instances

Mit Vorsicht — nur mit fundiertem Business-Grund:
- **Data Residency**: Länderdaten müssen im Land bleiben
- **Trennung internal/external**: z.B. HR-Instanz nicht aus Fremdnetz erreichbar

**Anti-Patterns:**
- Gleicher Prozess, gleiche Daten auf mehreren Instanzen → Single Instance bevorzugen
- Schwere Integrationen (CMDB-Sync, Ticket-Sync) = Signal für fehlenden echten Grund

---

## Domain Separation

- Logische Trennung von Daten, Prozessen und UI auf einer Instanz
- Provider = Instanz-Owner; Tenants = nutzende Orgs
- 3 Bereiche: **Data** (domain-scoped visibility) | **Process** (Business Logic overrideable) | **UI** (Menus, Forms, Dashboards)

> **MUSS vor jeglicher Entwicklungsarbeit aktiviert werden — nicht rückgängig zu machen!**

**Für ✅**: Mehrere Entities auf einer Instanz, Compliance-Anforderungen, Global Reporting

**Gegen ❌**: Physische DB-Trennung nötig, nur interne Kollaborationsprobleme, Tenants wollen volle Admin-Kontrolle

**Alternativen**: Before Query Business Rules, ACLs, Views/View Rules

---

## Architekturmodelle

| Modell | Stärke | Schwäche | Kundenprofil |
|--------|--------|----------|--------------|
| **Deliberate Customization** | Flexibel, keine Extra-Lizenzen | Technical Debt, limitierter SN-Support | Koordinierte Teams, leichte Prozessvariationen |
| **Multiple Instances** | Physische Datentrennung | Separate Lizenzen, hoher Governance-Aufwand | Sehr grosse Orgs, extreme Prozessabweichungen, Data Residency |
| **Domain Separation** | OOTB, SN-Support vorhanden | Komplex, ggf. Zusatzkosten | MSPs, Holding-Companies, stark regulierte Branchen |

---

## Instance Data Replication (IDR)

- Kopiert Daten von einer Instanz zu einer oder mehreren anderen — uni- oder bidirektional
- **Producer**: konfiguriert Replication Sets (Tabelle + Filter + Attribute)
- **Consumer**: empfängt Daten, kann transformieren, Business Rules triggern

**Komplexitätsstufen:**

| Komplexität | Use Case | Richtung |
|-------------|----------|----------|
| Niedrig | Foundation Data (Users, Groups, Location) | Unidirektional |
| Mittel | CMDB/Asset-Daten | Bidirektional |
| Hoch | Ticket-Daten (Incident, Request, Case) | Bidirektional via Staging Table |

**IDR Limits:**
- Seeding-Limit: 3 Mio Records pro Replication Set
- Kein Schedule-Support (near real-time, kein fixer Zeitplan)
- Kein Metadata-Replikation (Konfiguration, Settings)
- Kein Export ausserhalb ServiceNow

**Seeding vs. Replication**: Seeding = einmaliger Snapshot (kein Auto-Update danach); Replication = kontinuierlicher automatisierter Sync

**Service Bridge** (statt IDR) für Cross-Org Request Management zwischen verschiedenen Organisationen

---

## Code Migration

| Methode | Stärke | Key Points |
|---------|--------|-----------|
| **Update Sets** | OOTB, flexibel | XML-File; immer auf Non-Prod testen; Batching-Strategie empfohlen |
| **App Repository** | Für fertige Apps | Alle Änderungen final vor Publish; Dependencies manuell tracken |
| **Source Control (Git)** | Versionskontrolle, CI/CD | Nur 1 aktiver Branch pro App/Instanz; eigenes Repo pro Scope |
| **AEMC** | Low-Code, visuelle Pipelines | RBAC + ATF + Instance Scan einrichten |

> **Instance Migration ist KEINE OOTB Code-Migration-Option**

---

## Key Takeaways

- Gute Governance ist essenziell: robustes Framework für Operating Model, Platform Scope, Instances & Methodology
- Instance Stack auf Org-Bedürfnisse abstimmen: optimaler Stack + Instance Management Policies reduzieren Incident-Risiko
- Architekturmodelle verstehen: Stärken, Schwächen und Use Cases kennen bevor Empfehlung an Kunden
