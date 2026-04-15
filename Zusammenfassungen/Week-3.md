# Week 3 - Summary

---

### What is Governance?

- Decision-making framework: defines how ServiceNow strategy, portfolio, and technical decisions are made, and who has authority
- Not an operating model (operating model = how products/services reach consumers)
- Governance is foundational to growing and scaling an enterprise platform

**Why invest in governance?**
- Drives transformation vision: aligns investments with strategic goals, ensures appropriate resource allocation
- Delivers the right work at the right time: clear roles/responsibilities reduce roadblocks, enable faster decision-making
- Maintains implementation integrity: provides guidelines, standards, and leading practices

---

### Governance Key Players

| Role | Main Responsibility |
|---|---|
| **Executive Sponsor** | Chairs Executive Steering Committee; sets vision, secures funding |
| **Platform Owner** | Strategic roadmap; governance policies; may co-chair TGB |
| **Platform Architect** | Best practices for data modelling, integrations, configs; may co-chair TGB |
| **Demand Manager** | Chairs Demand Board; demand prioritization based on value/urgency/resources |
| **Process Owner** | Best practices for own process; approves process changes |
| **Developer / Administrator** | Impact assessment; documentation; change control |

---

### Governance Boards

**3 Boards, 3 Focus Levels:**

| Board | Focus | Composition |
|---|---|---|
| **Executive Steering Board** | Strategy | Senior IT + Business Leaders |
| **Demand Board** | Portfolio | Platform & Process Owners |
| **Technical Governance Board** | Technical | IT Leaders + Architects |

Flow: ESB sends strategic principles → Demand Board sends demand for assessment → TGB returns solution/design/impact/effort → Operations CAB handles implementation

> Key principle: separate expertise per level, but open communication between boards prevents siloed decisions.

**CTA role in TGB:**
- Help outline the board's charter, scope, roles, and responsibilities
- Provide expertise on platform architecture, scalability, and maintainability
- Help define coding standards, development guidelines, and security policies
- Identify strategies for addressing technical debt and legacy issues

---

### Technical Governance Domains (DEAP)

#### Data Management

- **Data owners**: responsible for accuracy, must have authority to enforce policies
- **Data stewards**: improve compliance with policies and standards
- Tools: Discovery, Service Mapping, Identification & Reconciliation Engine
- Production = single source of truth; IDR or cloning for consistency across instances
- Security: authentication, RBAC, encryption; regulated industries may require additional safeguards
- Integrations: start with pre-built (ServiceNow Store) before custom solutions

#### Environment Management

- Instance structure = foundation of environment governance
- Define early — ideally in pre-sales engagement with ServiceNow

#### App Development Management

- Custom development only when configuration cannot meet business needs
- Consistent naming conventions across all artifacts (update sets, script includes, business rules, workflows, tables)
- Key question: does the business value of customization outweigh the risk (technical debt, upgradeability)?
- Policies should be reviewed and communicated frequently to all stakeholders

#### Platform Management

**Access policies — define:**
- Who has access? What level? How to request? Training/certification required? Who approves?
- Types: Access Levels, Now Support Access, Temporary Access

**Upgrade management** (SN leading practice: upgrade at least once per year):
- Policy areas: process, approvals, testing, scheduling, communications, support

**Performance monitoring**: define hygiene activities at daily, weekly, monthly, and quarterly frequency

---

### Governance Golden Rules

- **Out-of-the-box first**: adjust the business before adjusting the platform; customize only when there is a clear business need and no alternative
- **Single system of record**: only CIs/attributes/relationships in CMDB with actual usage requirement
- **Outcomes over features**: focus on business outcomes, not legacy features
- **Automation**: automate processes for data maintenance and monitoring
- **80/20 rule**: deliver 80% of immediate business need, don't configure for edge cases
- **Upgrades**: stay current within X months of release via rapid deployment + automated testing
- **Integrations**: only necessary integrations; bespoke builds as last resort

---

### Governance & Continuous Improvement

**2 Dimensions:**
1. Governance boards prioritize platform improvements
2. The governance process itself is continuously improved

**Key areas:** feedback collection, performance optimization, defect resolution, technology upgrades, change management, monitoring & analytics, stakeholder engagement, best practices

**Tools for platform health:**
- **ITOM Health**: AI-driven monitoring, event correlation, log analytics — Health Log Analytics predicts issues before they impact users
- **Instance Scan**: checks for configurations indicating health issues and best practice violations — usable in dev ops, release management, pre/post upgrades

---

### Governance Optimization

- Goal: right amount of governance — not too little, not too much
- Too little → indecision and implementation risks
- Too much → "red tape," blocks innovation

**3 Levers:**
1. **Define metrics**: find the measures that show when governance works and when it doesn't
2. **Remove bottlenecks**: systematically identify and eliminate them
3. **Triage decisions**: only the most important decisions go to boards, the rest to front lines

**Metrics (Lagging vs. Leading):**
- Lagging: success against top-level KPIs (hard to directly attribute to governance)
- Leading: number of board decisions per quarter, board participation rate, % escalation reduction, % policies current

> Governance metrics don't need to be exact — simple, even anecdotal benchmarks tracked over time are sufficient to identify improvement opportunities.
