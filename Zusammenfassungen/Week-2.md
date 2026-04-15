# Week 2 - Summary

---

### Governance for Instance & Release Strategy

**3 Core Considerations:**
- Balance: risk mitigation (control) vs. value realization (speed)
- Clear policies for moving code/data between environments
- Alignment with: operating model, platform scope, instance structure, deployment methodology

**4 Governance Areas:**
- **Operating Model**: delegated dev, SI partners, DevOps/separation of duties
- **Platform Scope**: apps/products, foundation data, regression testing, integrations, user communities
- **Instance Structure**: number/purpose of environments, capabilities, multi-dev merge, multi-prod deployment, cloning
- **Deployment Methodology**: waterfall/agile/SAFe, release cadence, testing strategy, tooling

---

### Instance Stacks

| Stack | Structure | When |
|---|---|---|
| **3-Instance** | Dev → Test → Prod | Small orgs, fast go-live, low complexity |
| **4-Instance** | Dev → QA → UAT → Prod | **~70% of all implementations** — standard for medium to large orgs |
| **5-Instance** | Dev → QA → UAT → Staging → Prod | Multiple teams, complex integrations, staging for pre-prod testing |

Optional instances: Training, Sandbox, Innovation

---

### Instance Management Policies

Define upfront to:
- **Reduce risk**: changes via defined process & maintenance windows
- **Reduce MTTR**: clear support procedures and teams
- **Prevent incidents**: especially critical for system properties & plugins

Policy areas: Instance Overview, Support Procedures, Critical Availability, Maintenance, Change Management, Advanced Permissions, System Properties, Plugins

> In large instances with multiple dev teams: system property policies are critical — one team can otherwise impact another's work.

---

### Multi-Dev Environments

Separate dev instances prevent conflicts in parallel development:
- **Split by product**: teams work independently per solution
- **Split by release**: each release builds on the previous one

Master data sync via: update sets, app repository, or Git SCM

---

### Multi-Production Instances

Use with caution — only with a sound business reason:
- **Data residency**: country data must stay in-country
- **Separation internal/external**: e.g. HR instance not accessible from non-corporate networks

Anti-patterns:
- Same process, same data on multiple instances → prefer single instance
- Heavy integrations (CMDB sync, ticket sync) = signal that there is no real reason for multiple instances

---

### Domain Separation

- Logical separation of data, processes, and UI on a single instance
- Provider = instance owner; Tenants = organizations using the instance
- 3 areas: **Data** (domain-scoped visibility) | **Process** (business logic overrideable per domain) | **UI** (menus, forms, dashboards overrideable per domain)
- **Must be enabled BEFORE any development work — cannot be reversed!**

For ✅: multiple entities on one instance, compliance requirements, global reporting needed

Against ❌: physical DB separation required, only internal collaboration issues, tenants want full admin control

Alternatives: Before Query Business Rules, ACLs, Views/View Rules

---

### Architectural Models

| Model | Strength | Weakness | Customer Profile |
|---|---|---|---|
| **Deliberate Customization** | Flexible, no extra licenses | Technical debt, limited SN support | Coordinated teams, light process variation |
| **Multiple Instances** | Physical data separation | Separate licenses, high governance effort | Very large orgs, extreme process deviations, data residency |
| **Domain Separation** | OOTB, SN support available | Complex, possible extra cost | MSPs, holding companies, heavily regulated industries |

---

### Instance Data Replication (IDR)

- Copies data from one instance to one or more others — uni- or bidirectional
- **Producer**: configures replication sets (table + filter + attributes)
- **Consumer**: receives data, can transform it, can trigger business rules

**Complexity levels:**

| Complexity | Use Case | Direction |
|---|---|---|
| Low | Foundation data (users, groups, location) | Unidirectional |
| Medium | CMDB/Asset data | Bidirectional |
| High | Ticket data (incident, request, case) | Bidirectional via staging table |

**IDR Limitations:**
- Seeding limit: 3 million records per replication set
- No schedule support (near real-time, no fixed schedule)
- No metadata replication (configuration, settings)
- No export outside ServiceNow

**Seeding vs. Replication**: Seeding = one-time snapshot (no auto-updates after); Replication = continuous automated sync

**Service Bridge** (instead of IDR): use for cross-org request management between different organizations

---

### Code Migration

| Method | Strength | Key Points |
|---|---|---|
| **Update Sets** | OOTB, flexible | XML file; always test on non-prod; batching strategy recommended |
| **App Repository** | For finished apps | All changes finalized before publishing; dependencies tracked manually |
| **Source Control (Git)** | Version control, CI/CD | Only 1 active branch per app/instance; own repo per scope |
| **AEMC** | Low-code, visual pipelines | Set up RBAC + ATF + Instance Scan |

> Instance Migration is **not** an OOTB code migration option.
