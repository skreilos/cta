# Week 4 Summary — Agile Frameworks, CMDB and CSDM

---

## Agile Frameworks

### Agile Mindset

Agile is a **mindset, not a methodology**. The Agile Manifesto (2001) defines four core values:

- Individuals and interactions over processes and tools
- Working software over comprehensive documentation
- Responding to change over following a plan
- Customer collaboration over contract negotiation

### Agile vs. Waterfall

| Dimension | Waterfall | Agile |
|---|---|---|
| Scope/Timeline | Fixed scope & timeline | Fixed timeline, flexible scope |
| Teams | Siloed project teams | Cross-functional agile teams |
| Roles | Title-based | Interconvertible, coaching-focused |
| Delivery | Deliverable-based | Outcome-focused |

### Agile Frameworks — When to Use Which

| Framework | Team size | Dependencies | Use when |
|---|---|---|---|
| **Scrum** | Small, 1-2 teams | None between teams | One scope, small team |
| **Scrum of Scrums** | <50 people | Cross-team dependencies | Multiple teams, one product release |
| **SAFe** | 50-125+ people | Multiple value streams | Enterprise scale, multiple ARTs |
| **Hybrid** | Any | Any | Need both structure (waterfall) and flexibility (agile) |

### Scrum

**Roles:** Product Owner (vision + backlog), Scrum Master (process guardian), Development Team (self-organizing)

**Values:** Courage, Focus, Commitment, Respect, Openness

**Ceremonies:**
- **Sprint Planning** — team commits to sprint goal
- **Daily Scrum** — 15 min, inspect progress, not a status meeting
- **Sprint Review** — inspect shippable increment, stakeholders invited
- **Sprint Retrospective** — process improvement, not product

A **sprint** is time-boxed (max 1 month) and results in a potentially releasable increment.

### Scrum of Scrums

- Connects multiple Scrum teams delivering complex solutions
- Teams of 4-6 people; interlinking structures reduce communication paths
- First step to scaling agile for larger products

### SAFe (Scaled Agile Framework)

**Core values:** Alignment, built-in quality, transparency, program execution

**Configurations:**
- **Essential SAFe** — team + program levels (ART); most critical elements
- **Large Solution SAFe** — adds solution level for cross-program coordination
- **Portfolio SAFe** — adds strategic direction, investment funding, lean governance
- **Full SAFe** — all levels combined; for very large, integrated solutions

**Key concepts:**
- **Epic** — significant initiative at portfolio level
- **Feature** — stakeholder need, fits within one Program Increment; has benefit hypothesis + acceptance criteria
- **Story** — small enough to complete in one sprint
- **ART (Agile Release Train)** — set of teams working toward a single solution
- **PI (Program Increment)** — 8-12 week timeframe for ART delivery

**SAFe roles by level:**
- Team: Product Owner, Scrum Master
- Program: Release Train Engineer, System Architect
- Large Solution: Solution Manager, Solution Architect/Engineer
- Portfolio: Epic Owners, Enterprise Architect

**SAFe ceremonies:** Sprint Planning/Review/Retrospective (team), PI Planning + Inspect & Adapt + System Demo (program), Solution Demo + Pre/Post-PI Planning (large solution), Strategic Portfolio Review (portfolio, quarterly)

### Hybrid (Now Create)

ServiceNow's **Now Create** methodology is hybrid: Waterfall for Initiate, Plan, Deliver, Close; **Agile for Execute phase** (sprints, stories, scrum).

### Platform Team

A dedicated platform team is needed in Scrum of Scrums and SAFe to:
- Manage shared/global-scope capabilities across value streams
- Oversee automation and CI/CD pipelines
- Provide governance and stability for functional teams

---

## CMDB and CSDM

### Core Concepts

**CMDB** — single system of record for digital products and service data. Stores CIs (configuration items) and their relationships.

A CI can be:
- Physical (computer, router)
- Logical (database instance)
- Conceptual (requisition service)

**Asset vs. CI:** Both may refer to the same object but serve different purposes. CI = ITSM + technical data. Asset = financial + lifecycle data. All assets can be CIs, but not all CIs are assets.

**CSDM** — standard set of terms and definitions across all ServiceNow products. A blueprint for where data lives in the CMDB. **The CMDB is the heart; CSDM tells us how data is related across the platform.**

### CSDM v4.0 Domains

| Domain | Purpose | Operational? |
|---|---|---|
| **Build** | DevOps, SDLC components | Yes (Incident, Change targets) |
| **Design** | Business application rationalization | No (not selectable for Incident/Change) |
| **Manage Technical Services** | Technical service portfolio | Yes |
| **Sell/Consume** | Business services, offerings | Yes |
| **Foundation** | Base referential data (company, users, locations) | N/A (referenced, not in CMDB relationships) |

**CSDM v5.0** adds: Design & Plan (enhanced), Build & Integrate (SBOM/CycloneDX), Deliver (Service Instance base class), Consume, and a new **Ideate** domain.

### CSDM Staged Approach

| Stage | Focus |
|---|---|
| **Foundation** | Company, BU, department, locations, groups, users, product models, contracts |
| **Crawl** | Business application, Application service, Application, Server/host |
| **Walk** | Technology Management Service, Service Offering, Dynamic CI Group |
| **Run** | Business Service Portfolio, Business Service, Business Service Offering |
| **Fly** | Business Capability, Information Object, Service Offerings in catalog |

---

## Three Pillars of CMDB

### Pillar 1 — Ingestion

Continuous intake of data; merging, updating, deleting to maintain a single reliable model.

| Tool | Purpose |
|---|---|
| **Discovery** | Scans network, identifies devices/apps, updates CMDB automatically |
| **Service Mapping** | Top-down discovery; maps services and their dependencies |
| **Agent Client Collector (ACC)** | Agent-based; no credentials or firewall exceptions needed; real-time monitoring |
| **IntegrationHub ETL** | Extract/Transform/Load third-party data; uses RTE + IRE |
| **Service Graph Connectors** | Pre-built integrations for third-party sources (security, cloud, IoT, etc.) |
| **Import Sets + Transform Maps** | Staging tables for external data; transform maps route data to correct CMDB tables |

**Discovery types:**
- **Horizontal Discovery** — finds computers and devices across the network
- **Top-down Discovery** — used by Service Mapping; maps service dependencies

**IRE (Identification and Reconciliation Engine):**
- **Identification rules** — uniquely identify CIs (one per CMDB class)
- **Reconciliation rules** — static (with data refresh rules) or dynamic (CMDB 360/Multisource)
- **Data refresh rules** — determine CI staleness per discovery source
- **Data source rules** — for sources trusted to update but not create CIs

**Duplicate CI Remediator** — groups duplicate CIs into de-duplication tasks; supports merging, relationship transfer, and deletion.

**Reclassification** — CIs can be automatically reclassified to another class, or a task generated for manual review.

### Pillar 2 — Governance

Maintaining CMDB health after ingestion through roles, tools, and lifecycle automation.

**CMDB Health Dashboard** — central view of CMDB health. Three KPI tiles:
- **Completeness** (Recommended, Required)
- **Correctness** (Staleness, Orphan, Duplicate)
- **Compliance** (Audit)

Three views: Class view (default), Service view, Health group view. Scores updated via scheduled jobs (All > Configuration > Health Preference).

**Lifecycle Management tools:**
- **Life Cycle Mapping** — converts legacy status values to CSDM life-cycle value pairs
- **CMDB Data Manager** — bulk CI lifecycle management via policies (attest, certify, retire, delete). A policy defines: policy type, filters, assignment target, and timeframe. Scheduled jobs process published policies; tasks land in CMDB Workspace.

### Pillar 3 — Insight

Extract value from CMDB data for decision-making.

| Tool | Purpose |
|---|---|
| **CMDB Query Builder** | Drag-and-drop complex queries across CMDB and non-CMDB tables; save, schedule, export, report |
| **Unified Map** | Visual map of CI relationships (merges Dependency Map + Service Map); used for outage impact analysis and change assessment |
| **CMDB + CSDM Data Foundations Dashboards** | CSDM dashboard: grouped by maturity (Foundation/Crawl/Walk/Run/Fly). CMDB dashboard: grouped by Best Practices, Customizations, Data Management, ITSM Processes. Requires plugin: **sn_getwell** |

---

## Data Modeling for CMDB-CSDM Alignment

As a CTA, you lead this process. Two implementation approaches: **service-focused** or **application-focused**.

| Stage | Key activities |
|---|---|
| **Prepare** | Choose approach (service vs. application), assign roles (EA, CMDB manager, process owners, SN product owner, developer/admin), enable plugins, map legacy lifecycle values |
| **Gather data** | App-focused: list of business applications + production installs. Service-focused: list of services + supporting applications. Legacy: run CMDB Health Scan, use scripts to assess remediation impact |
| **Model data** | Use [Data Modeling Workbook](https://learning.servicenow.com/nowcreate/en/pages/assets?id=nc_asset&asset_id=abda54d987cbd9d4046fff38dabb351d) + data diagrams (app-focused) or Service Builder + Service Taxonomy (service-focused). Develop governance processes for long-term sustainability |
| **Enter data** | Import via import sets: Business Applications, Application Services, Business/Technical Services, Offerings, and relationships (Consumes, Contains, Depends on). Manual entry for exceptions |
| **Maintain/Use data** | Use Dashboards, Data Foundations, CMDB Health, CMDB Workspace, Data Manager. Train data owners and users on lifecycle management |

### CI Relationships in CSDM

- Not every CSDM conceptual model object maps to a CMDB table
- Not all objects have built-in relationships
- Some relationships must be created manually
- For infrastructure CIs, follow how Discovery would normally create relationships
- Many products (e.g., Enterprise Architecture) depend on correct CSDM relationships to function

Reference: [How CSDM concepts map to CMDB tables](https://www.servicenow.com/docs/bundle/xanadu-servicenow-platform/page/product/csdm-implementation/concept/csdm-to-cmdb-mapping.html)
