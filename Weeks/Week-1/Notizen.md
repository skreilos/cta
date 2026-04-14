# 01-Grundlagen - Notizen

## Articulate the Value of the Platform

> **Organizations leverage the following resources to achieve business outcomes: People, Processes, Technology**

Organizations define strategic business drivers and work toward achieving them through people, processes and technology. Key business outcomes:
- Single system of truth for IT
- Optimizing service delivery
- Mitigating cybersecurity risks
- Managing application inventory
- Reimagining customer engagement

Value propositions must be backed by clear, credible evidence: customer success stories, case studies, industry benchmarks, ROI calculations, and KPIs aligned with customer priorities.

## MyNow Best Practices Portal & Now Create

> **[MyNow Best Practices Portal](https://mynow.servicenow.com/):** designed to help customers achieve faster time to value with less risk and better outcomes. Built on insights from thousands of successful implementations, it provides on-demand guidance to ensure every ServiceNow project runs smoothly from start to finish.

**Now Create vs. MyNow Best Practices Portal:**
- Now Create = the methodology (the "what and how")
- MyNow Best Practices Portal = the portal where Now Create content is accessed



## ServiceNow Resource Center

> **[ServiceNow Resource Center](https://www.servicenow.com/resources.html):** materials to help craft compelling value statements. Available resources:
- Analyst reports
- Solution briefs
- White papers
- Customer case studies
- Infographics
- eBooks
- Datasheets
- Webinars
- Recap
- Video

**Analyst reports:** research documents published by independent firms evaluating companies, products, or industry trends — provide insights, competitive comparisons, and expert opinions for informed decision-making.

**Solution briefs:** short documents providing an overview of a specific ServiceNow product or solution, highlighting key features, benefits, and use cases. Available for all ServiceNow platform solutions.

**Customer case studies:** in-depth documentation of customer implementations and results — the real value of ServiceNow is best seen through customer experiences.

**eBooks:** cover various topics addressing pain (challenges), pain relievers (solutions), gain creators (benefits), and gain (value delivered to customers).

## Know Your Audience

> **When articulating platform value, understanding your audience is essential. Different stakeholders have varying priorities — a CIO focuses on scalability and cost efficiency, a developer on API flexibility. Competing interests must also be considered.**

**Executives (CIO, CTO, CFO, Business Leaders)** — Focus: Business value, ROI, strategic impact
- Cost reduction and efficiency improvements
- Business outcomes (automation, reduced manual effort)
- Competitive advantage and innovation
- High-level security and compliance

**IT Leaders (IT Director, IT Operations, Platform Owners)** — Focus: System performance, governance, scalability
- Alignment with IT strategy and enterprise architecture
- Security, compliance, and data governance
- Scalability and long-term maintainability
- Performance impacts and monitoring

**Developers & Technical Teams** — Focus: APIs, architecture, implementation
- Technical specifications (API endpoints, authentication, data formats)
- Integration patterns and best practices
- Error handling, logging, and troubleshooting

**Process Users (Service Desk Agents, Business Users)** — Focus: User experience, workflow improvements
- Simplified tasks and reduced manual effort
- Changes in daily workflows (automation, self-service)
- Required training or onboarding

## Substantiate the Value Proposition

A compelling value proposition must be supported by clear and credible evidence — measurable impact through data, real-world results, and trusted references.

Two key resources for CTAs to substantiate value:

**Now Create** — ServiceNow's prescriptive, proven methodology based on thousands of successful implementations. Provides project-specific **Success Packs** (the heart of Now Create): blueprints with prescriptive guidance, leading practices, and project recommendations.

**Resource Center** — Comprehensive repository with analyst reports, solution briefs, customer case studies, eBooks, and more. Helps communicate value with credible proof points.

> Note: Success Packs belong to **Now Create** — not to the Resource Center.

## Steps to Build a Value Proposition

> **Three key steps for building a value proposition:**
- Understand the customer's desired outcomes
- Identify the relevant solutions and capabilities
- Communicate the value-added metrics that matter to the customer

## Key Takeaways

1. **Understand the platform's value:** Use clear communication, highlight key metrics, and align business cases with desired results to showcase the platform's impact.
2. **Substantiate claims with evidence:** Data, real-world examples, and customer success stories support your value proposition. Use Now Create and the Resource Center to enhance value statements.
3. **Know your audience:** Tailor your message to address the specific priorities and expertise levels of different stakeholders.

[QRG - Articulate the Value](QRG_Articulate%20the%20Value.pdf)

---

## Current and To-Be Architecture

### Technical Architecture Domains

> **Data Management (D)**
- Data ownership
- Data availability
- Data and integration standards
- Data security

  *Standards & controls for high data quality, security, and reliability. Data integrity & consistency → better decision-making and operational efficiency.*

> **Environment Management (E)**
- Environments
- Applications

  *Architecture & processes for structured development, testing & release workflows. Per-instance requirements: security controls, user access based on personas & permissions.*

> **App Development Management (A)**
- Development standards
- Leading practices
- Bespoke requirements (massgeschneiderte Anforderungen)
- Application method guidelines

  *Quality assurance & reduction of technical debt. Unified tools across the entire development cycle. Standardized methods for common implementation projects.*

> **Platform Management (P)**
- Operational maintenance
- Administration
- Policies
- Procedures

  *Governs: access, upgrades, patches, security & maintenance of the Now Platform. Long-term: reduced maintenance effort, improved end-user experience. Upgrade/patching processes for efficient execution & fast adoption of new features.*

### Steps to Assess Current Architecture

**1. Identify Key Stakeholders and Gather Information**
- Identify individuals & groups involved in or impacted by the architecture
- Conduct structured interviews about current architecture
- Collect documentation & artifacts on the technology landscape

**2. Document, Analyze, and Interpret Results**
- Structure information into categories: infrastructure, applications, data flows, security, etc.
- Analyze architecture and extract insights:
  - Redundant systems that could be consolidated?
  - Outdated infrastructure or performance gaps?
  - Business needs aligned with IT capabilities?

**3. Document Findings and Present to Stakeholders**
- Compile findings in a structured document or presentation (diagrams, charts, models)
- Schedule meeting with key stakeholders to walk through findings & recommendations
- Encourage feedback & discussion to refine recommendations and ensure alignment

### Identify and Interview Stakeholders
- Identify all key stakeholders involved in the process
- Compile comprehensive list, categorized by roles & responsibilities

### Plan Logistics
- Schedule interviews: meeting times, venues, required resources
- Effective planning → streamlined process & productive discussions

### Decide on Relevant Questions
- Identify key questions aligned with project objectives
- Determine required documents & data for decision-making
- Keep requests clear & concise

### Conduct Stakeholder Interviews
- Engage stakeholders with executive sponsorship & oversight
- Build rapport, ask open-ended questions
- Document key takeaways & insights

### Interview Leading Practices
- Prepare thoroughly beforehand
- Keep interviews under one hour
- Max. two participants per session
- Ask open-ended questions
- Take relevant notes
- Ask for documents

### Data Management Interview Questions
- Data ownership: Who decides on data-related decisions?
- Data availability: Is data accessible for analysis? Existing reports?
- Data standards: Established standards for formatting & governance?
- Integration standards: Defined standards for cross-system data integration?
- Security policies: What policies protect the data?

### Environment Interview Questions
- Environment overview: Environments in use & key considerations?
- Current applications: Applications used & their primary functions?
- Environment integration: Connected environments (portals, backends, integrations)?
- Software versions: Current software version?
- Dev vs. production: How are environments structured & what are key differences?

### Application Interview Questions
- Existing guidelines: Established best practices or "golden rules"?
- Customization scope: Extent of customization & significant modifications?
- Development team: Number of developers working on the application?
- Configuration vs. customization: Clear distinction in current setup?
- Essential features: Must-have features or functionalities?

### Platform Interview Questions
- Maintenance procedures: What procedures are currently in place?
- System integrations: Existing integrations within the system?
- Environment administration: How are prod & non-prod environments managed?
- Processes & procedures: Documented processes for system operations & management?
- Non-functional testing: Performance, security, reliability testing conducted?

### Gather Documentation
Request & organize documentation into categories:
- **Applications & Software:** platforms, tools, third-party solutions
- **Infrastructure:** cloud, on-premises servers, networks, storage
- **Data Flows:** how data moves between systems & where it's stored
- **Security & Compliance:** frameworks, policies, enforcement mechanisms

### Document, Analyze, and Interpret Results

**Heatmap**
- Visual tool using colors to represent data (warm = high, cool = low)
- Divided by: **CUS** (Customer Effort) / **ENG** (Engagement Effort)
- Accessibility: consider colorblind users → use patterns, labels, or numerical values as alternatives

**Structure the Findings → then add coloration to the heatmap**
- Categorize stakeholder comments & responses per area of interest
- Incorporate relevant documentation for comprehensive analysis
- Apply color coding after structuring is complete

**Heatmap Table Structure (Management Process Area Highlights):**

| Area | Topic | Interview | Further comments | CUS | ENG |
|------|-------|-----------|------------------|-----|-----|

Color coding per CUS / ENG:
- Green = no gap / baseline functionality
- Yellow = minor gap / requires configuration
- Pink/Red = significant gap / must be built or fully unknown

**Analyze the Findings**
- Record detailed notes with organization's permission
- Provide initial effort estimate (scalable, not exact) → "working notes"
- Include as appendix in final presentation for reference & corrections
- Always present effort estimation → missing it undermines credibility
- Maintain transparency with the customer organization

**Chart the Findings**
- Once evidence is collated → create the heatmap chart
- Example: Data Management chart with areas: Process, Categorizations, Integrations, Reporting, Security, Service Architecture, Data Accuracy
- Each area rated separately for CUS (Customer Effort) & ENG (Engagement Effort)

### ServiceNow Environment (Existing Customers)
> **If customer already uses ServiceNow → separate process to define future architecture:**
- **Map current capabilities:** use ServiceNow capabilities map to identify licensed, activated & actively used products
- **Identify hot spots:** highlight areas needing improvement; distinguish used vs. unused products
- **Capability map:** standard roadmap showing current usage + hot spots → basis for future architecture

### Prepare the Presentation
Final step: structured architecture diagram outlining the future environment.

- **Define format:** diagrams, reports, presentations, or dashboards — based on stakeholder preferences & documentation standards
- **Make it transparent:** involve technical teams, business leaders & end users → gather feedback, refine & validate
- **Present final readout:** key findings, recommended solutions, expected benefits — to a well-prepared audience

> **Important to remember:**
- Securing stakeholder buy-in is the most important aspect of any analysis
- No surprises: engage stakeholders early, include the right level of detail throughout
- Playback session = validation of what stakeholders already know + a few new details → easier to finalize to-be architecture

**Complete Heatmap:** ![Complete Heatmap](complete%20heatmap.png)

### Transition Architecture
- Bridge between current state and to-be state via incremental phases
- Manages complexity & risk while ensuring business continuity
- Must be captured as part of a phased implementation
- Purpose of each phase must be clearly explained to stakeholders
- ServiceNow provides guidance on recommended product implementation sequence, customer maturity alignment & readiness assessment → [Implementation Sequence](https://mynow.servicenow.com/now/mynow/search/implementation%20sequence/params/source/global)

![Recommended Sequence](Recommended%20sequence.jpg)

### Architecture Diagram
To-be architecture diagram created from interviews, documentation & assessments. Includes:
- ServiceNow instances
- Disparate systems (heterogene/verteilte Systeme)
- Integrations
- Authentication systems
- Portals
- Data lakes
- External service providers
- Other relevant items

![Solution Overview](Solution%20overview%20imag.png)
[Template: Solution Overview](https://mynow.servicenow.com/now/best-practices/assets/solution-overview-template)

### Challenges

> **Common challenges in architectural assessments:**
1. **No executive sponsorship:** Without leadership buy-in → hard to secure participation, funding & strategic alignment. Engage leadership early.
2. **Only involving IT teams:** IT focuses on technical aspects, missing how technology is actually used. Include business stakeholders & end users.
3. **Too many people in interviews:** 30-40 people in one meeting = unfocused, ineffective. Keep sessions small & targeted (max. 2 participants per session).

## Key Takeaways (Current and To-Be Architecture)

1. **Four domains of technical architecture:** Data, Environment, App Development, Platform Management — each plays a role in a robust and efficient system.
2. **Do your homework:** Know which stakeholders to engage and prepare thoroughly for interviews — accurate information gathering is essential.
3. **Document findings clearly:** Use structured diagrams, heatmaps, charts, and models to communicate analysis and identify effort levels.

### Additional Resources

| Resource | Type |
|----------|------|
| [ServiceNow Capability Map](https://learning.servicenow.com/nowcreate/en/pages/assets?id=nc_asset&asset_id=f655e0209328a254fb94b4886cba10b2&nc_source=copy_asset_link) | PPT |
| [Platform Questionnaire](https://learning.servicenow.com/nowcreate/en/pages/assets?id=nc_asset&asset_id=9712b17493e67590f2d9bc686cba107e&nc_source=copy_asset_link) | Word |
| [Security Questionnaire](https://learning.servicenow.com/nowcreate/en/pages/assets?id=nc_asset&asset_id=12f0c1e2936b4e50fb94b4886cba1014&nc_source=copy_asset_link) | Word |
| [Process Owner Questionnaire](https://learning.servicenow.com/nowcreate/en/pages/assets?id=nc_asset&asset_id=3e6b2f3a4747b95090542034846d43d3&nc_source=copy_asset_link) | Word |
| [Upgrade Architecture & Technical Questionnaire](https://learning.servicenow.com/nowcreate/en/pages/assets?id=nc_asset&asset_id=beccc1f987bc5518f2f443f7dabb35b4&nc_source=copy_asset_link) | Word |
| [Platform - Scoping Guide](https://learning.servicenow.com/nowcreate/en/pages/assets?id=nc_asset&asset_id=dc67e56fc31ce290c6009313e40131d2&nc_source=copy_asset_link) | Word |

[QRG - Current and To-Be Architecture](QRG_Current%20and%20To-Be%20Architecture.pdf)

---

## Week 1 Quiz

**Q: When presenting ServiceNow solutions to customers, how does understanding their desired outcomes improve the effectiveness of platform value articulation?**
- Allows CTAs to tailor messages to address specific pain points and demonstrate measurable benefits
- Understanding outcomes = relevant, targeted communication — not generic feature lists

**Q: What is the primary purpose of Now Create when articulating the value of the ServiceNow platform?**
- **Prescriptive methodology** offering on-demand guidance through project-specific Success Packs, blueprints, best practices, and project recommendations
- Wrong distractors: Resource Center = document repository; Learning Portal = training; neither = marketing materials

**Q: As a CTA presenting integration benefits to process users (service desk agents, business users) — which approach best addresses their needs?**
- **Highlight how integrations simplify daily tasks, reduce manual effort, improve workflows, and provide self-service options — including required training**
- Process users care about UX and workflow changes, not APIs or ROI
- Wrong distractors: API/technical specs = developers; ROI/strategic benefits = executives; performance/scalability = IT leaders

**Q: Which technical architecture domain defines the structure and processes that support development, testing, and release workflows, including security controls for different personas?**
- **Environment Management (E)** ← not App Development Management
- Covers: structured dev/test/release workflows + per-instance security controls, user access based on personas & permissions
- App Development Management = development standards, leading practices, bespoke requirements (different focus)

**Q: What is the initial step in the process of architectural assessment?**
- **Identify stakeholders and gather information**
- Without this foundation: gaps, heatmaps, and to-be architecture lack factual basis

**Q: After stakeholder interviews, which actions best reflect clear and effective preparation of findings for project leadership? (two correct)**
- Prepare a structured, visual report: key insights, identified gaps, recommended next steps
- Schedule a review session to validate findings and gather feedback
- Wrong: raw interview notes (unprocessed), system-level technical details (wrong audience)

