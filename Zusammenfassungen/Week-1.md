# Week 1 - Summary

---

### Role of the Technical Architect

- Translates customer requirements into architectural blueprints
- Acts as the technical gateway between sales designs and delivery teams (PMs, BAs, Architects, Developers)
- Guides technical governance and operating model design
- Reduces risk and minimizes technical debt through platform expertise
- Requires more than technical skills: service management, operational skills, and soft skills (communication, negotiation, influence) are equally important

---

### Articulate the Value of the Platform

#### Value Proposition

- Organizations achieve business outcomes through **People, Processes, Technology**
- Key outcomes: single system of truth for IT, optimized service delivery, mitigated cybersecurity risks, managed application inventory, reimagined customer engagement
- Value propositions must be backed by clear, credible evidence: data, ROI, customer success stories, KPIs

#### 3 Steps to Build a Value Proposition

1. Understand the customer's desired outcomes
2. Identify the relevant solutions and capabilities
3. Communicate value-added metrics that matter to the customer

#### Key Resources

| Resource | Purpose |
|---|---|
| **Now Create** | Prescriptive methodology — Success Packs with blueprints, leading practices, project recommendations |
| **Resource Center** | Repository: analyst reports, solution briefs, customer case studies, eBooks, whitepapers |

> Success Packs belong to **Now Create** — not to the Resource Center.

#### Know Your Audience

| Persona | Focus |
|---|---|
| **Executives (CIO, CFO)** | ROI, strategic impact, cost savings, high-level security & compliance |
| **IT Leaders** | System performance, governance, scalability, alignment with IT strategy |
| **Developers** | APIs, integration patterns, technical specs, error handling |
| **Process Users** | UX improvements, reduced manual effort, self-service, required training |

---

### Current and To-Be Architecture

#### DEAP — 4 Technical Architecture Domains

| Domain | Focus |
|---|---|
| **D — Data Management** | Data quality, security, reliability; ownership, availability, integration standards |
| **E — Environment Management** | Dev/test/release workflows; security controls and user access per instance |
| **A — App Development Management** | Development standards, leading practices, reduction of technical debt |
| **P — Platform Management** | Upgrades, patches, access, maintenance; long-term reduced maintenance effort |

#### 3-Step Architecture Assessment Process

1. **Identify stakeholders and gather information** — structured interviews, collect documentation
2. **Document, analyze, and interpret results** — identify redundancies, gaps, misalignment
3. **Present findings** — structured diagrams, heatmaps; validate with stakeholders

#### Interview Best Practices

- Keep interviews under one hour
- Max. two participants per session
- Ask open-ended questions
- Request relevant documents
- Focus on the four DEAP domains

#### Heatmap

- **CUS** = Customer Effort / **ENG** = Engagement Effort
- Green = no gap / baseline functionality
- Yellow = minor gap / requires configuration
- Pink/Red = significant gap / must be built or unknown
- **Always present effort estimations — missing estimates undermine credibility**

#### Existing ServiceNow Customers

- **ServiceNow Capability Map**: documents licensed, activated, and actively used products
- Identify **Hot Spots** (areas needing improvement)
- Pink = improvement area / Light Blue = licensed

#### To-Be Architecture Diagram

Includes: ServiceNow instances, disparate systems, integrations, authentication systems, portals, data lakes, external service providers

#### Transition Architecture

- Bridge between current state and to-be state via incremental phases
- Manages complexity and risk while maintaining business continuity
- Purpose of each phase must be clearly communicated to stakeholders

#### Common Challenges

- **No executive sponsorship** → hard to secure participation and strategic alignment
- **Only involving IT teams** → misses how technology is actually used
- **Too many people in interviews** → unfocused sessions, no depth

---

### Communication Essentials

#### Pyramid Model of Communication (bottom to top)

1. **Credibility Foundation** — trust through reliability and professionalism
2. **Information Governance** — share the right information with the right people
3. **Message Architecture** — structure content, audience, and timing
4. **Expression Strategy** — tone, delivery style, and clarity
5. **Contextual Personalization** — tailor communication to individual needs

#### 5 Steps to Communicate Value

1. **Discover** — encourage conversations to identify pain points
2. **Listen & Empathize** — reflect concerns, show understanding
3. **Tailor Message** — map capabilities to needs
4. **Align to Objectives** — link to business outcomes
5. **Quantify** — share measurable benefits

#### Feedback Models

| Model | Structure | When |
|---|---|---|
| **SBI** | Situation → Behavior → Impact | Concise, event-focused feedback |
| **CEDAR** | Context → Example → Diagnosis → Action → Review | Deeper, development-oriented feedback |

> Architects must translate complex information into clear messages — unclear communication leads to wrong decisions and lost stakeholder trust.
