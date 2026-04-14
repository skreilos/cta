# CTA - Week 2 Workshop Notes

- Camera must be on during sessions — if off, notify Tim Kulhavy
- Always join with correct full name

---

## Governance

- Governance program = defines how an org makes decisions for ServiceNow implementation & ongoing management
- Governance — instance & release strategy (3 key considerations):
  - Balance between risk mitigation (control) vs. value realization (speed)
  - Clear policies & processes for moving code/data between environments
  - Align with customer's operating model, platform scope, instance structure & deployment methodology

- Release & Instance Strategy Diagram: ![Release and Instance](Release%20and%20Instance.png)

- Quiz: Governance steps for release & instance management consider → **Platform scope** (not capacity review, compliance/audit, or CAB)
  - Key factors: operating model, platform scope, instance structure, deployment methodology

> **Operating Model considerations:**
> **Delegated development: define development privileges, scope & oversight mechanisms**
> **SI partners: governance defines roles/responsibilities, approval processes, compliance with policies & best practices**
> **DevOps / Advanced Data Access / Separation of duties: distribute dev, test & deploy roles across different individuals/teams to prevent conflicts of interest**

> **Platform Scope considerations:**
> **Products/apps deployed: governance policies define which apps can be deployed → consistency across instances**
> **Foundation data / shared components: define ownership & maintenance; rules to ensure data integrity & prevent inconsistencies**
> **Regression testing: governance around test environments (mirror prod configs); define when automated vs. manual testing for complex scenarios**
> **Integration architecture: policies for designing/developing/maintaining integrations; standardized API & security protocols (auth, encryption, logging)**
> **Impacted user communities: align decisions with key stakeholder needs; define onboarding/training processes; feedback mechanisms for governance policies & enhancements**

> **Instance Structure considerations:**
> **Number/purpose of environments: define how instances are used, who has access & what restrictions apply**
> **Capabilities (SSO/integrations/data): each env must support key capabilities while ensuring integrity, security & compliance (auth, authz, integrations, data mgmt)**
> **Merging multi-dev environments: define roles, responsibilities & best practices for merging changes efficiently**
> **Deploying to multiple prod instances: standardized deployment process to reduce risk & maintain instance consistency**
> **Cloning practices: policies for frequency, data management, post-clone config & change freeze considerations**

> **Deployment Methodology considerations:**
> **Waterfall/Agile/SAFe: methodology influences instance management, environment usage & deployment practices**
> **Release cadence: scalable & repeatable release processes → uniform adherence to governance across enterprise**
> **Story / feature set / sprint package: packaging strategy affects deployment workflows & testing**
> **May vary by environment: different envs can support different methodologies**
> **Tooling strategy: ensures efficient governance & integration across the instance stack**
> **SDLC / Test Management / SPM: define how SDLC, testing & project management (PPM) integrate into ServiceNow**
> **Testing (automated vs. manual): define minimum test coverage requirements before changes move forward in release cycle**

---

## Instance Stack

- Instance stack (no "one size fits all") — factors determining optimal number of instances:
  - Organization size & resource availability (sysadmin/maintenance capacity)
  - User & team involvement (number of process users & teams)
  - Process & integration scope (volume of processes & integrations)
  - Flexibility requirements (adaptability needs)
  - Cost considerations (budget constraints)

- **3-Instance Stack** (Dev → Test → Prod):
  - Pros: standard deployment, separates test from dev, streamlined
  - Cons: no staging, single dev track, doesn't scale
  - Scenario: small org, short timeline, rapid go-live, limited UAT users, minimal integrations, agile but unstructured → low-maintenance 3-stack best fit

- **4-Instance Stack** (Dev → QA → UAT → Prod):
  - Pros: testing separated, UAT for training, explore data clone options
  - Cons: no staging, extra maintenance
  - Scenario: ITSM suite, no separate staging to minimize cost → UAT doubles as pre-go-live training env
  - > **~70% of implementations — preferred for most medium to large orgs**

- **5-Instance Stack** (Dev → QA → UAT → Staging → Prod):
  - Pros: deployment testing, staging for troubleshooting, increased parallel activity
  - Cons: increased time to value, higher maintenance effort
  - Scenario: multiple teams, wide range of processes, pilot before prod release, staging for pre-prod testing, complex integrations → 5-stack for flexibility

- Additional optional instances:
  - Training: dedicated env for end-user training → doesn't impede dev cycle
  - Sandbox: test upgrades & POCs without disrupting dev cycle
  - Innovation: explore new features & improvement projects without disrupting other dev

---

## Instance Management Policies

- Define upfront to:
  - Reduce risk: changes via defined process & maintenance windows
  - Reduce MTTR: clear support procedures & teams
  - > **Prevent incidents: define process to modify system properties or enable plugins**

- > **Quiz: Instance policy reasons → Reduce risk, Reduce MTTR, Prevent incidents/outages (NOT data governance delays)**

- Policy areas — questions to answer per instance:
  - Instance overview: purpose/intent, permitted activities, limitations, which prod data allowed, intended audience
  - Support procedures: incident resolution process, support groups, escalation paths, when/how to escalate to SN support
  - Critical availability: blackout windows, compliance/regulatory controls on maintenance timing
  - Maintenance procedures: maintenance windows for routine tasks & change requests, enterprise windows impacting the instance
  - Change management: falls under CM control? process for changes? change types for CRs?
  - Advanced permissions: who gets admin/security admin (security admin = most elevated), prerequisites, monitoring & maintenance over time, security hardening guide applicability
  - System properties: review process before modifying, who approves?
  - Plugins: activation process, who to consult, who approves?

- > **NOTE: In large instances with multiple dev teams — system property policies are critical to prevent one team from impacting another's work**

---

## Multi-Dev Environment Stack

- Separate dev instances for parallel teams → prevents overwriting or simultaneous conflicts on same item
  - Split by product: teams work independently per solution → releases promoted to test, conflicts resolved per migration approach
  - Split by release: each release builds on previous (e.g. ITSM R6 includes R5 updates); teams on separate releases → promote to test, resolve conflicts per migration approach
  - Master data sync (both strategies): via update sets, app repository, or Git integration (SCM)
  - Other multi-dev scenarios:
    - Complex solution with multiple integrations (shared instance = risk for parallel devs)
    - External partner/developer needs isolated instance (no access to customer data/configs)
    - Different org units want full control of own dev instance
    - Installing store apps for trial without affecting main dev instance

---

## Multi-Production Instances

- Use with caution — must have a sound business reason
- > **Data residency requirements: country data must stay in-country (common for CSM & MSP use cases)**
- > **Separation of internal/external data & access: e.g. HR instance not accessible from non-corporate devices, but onboarding/alumni solutions need public access**
- Risk: duplication of resources & effort → Solution: close collaboration between instance owners or single instance owner
- Challenge: sharing common data (foundation data / CSDM) → Solution: instance data replication
- Challenge: executing processes across multiple instances is complex → Solution: Remote Process Sync
- Remote tables: data hosted across different geographies → consolidated view of work across instances
- > **Tip: Always prioritize user convenience — consolidate services into a single, unified platform**
- Tip: evaluate licensing needs carefully to avoid unnecessary costs & complexity for process users

- Each instance must contain all needed data (end-to-end visibility):
  - Design per value stream, not per process (e.g. monitoring event → impact assessment → incident → customer notification)
  - All data must be on one instance so the process is never interrupted mid-stream
  - Tip: think end-to-end first — if data lives on another instance, the value stream breaks

- No heavy integrations: maintenance cost over time exceeds initial implementation cost
  - A truly separate instance has: own customers, own process users, all needed data
  - Heavy integration needs (CMDB sync, ticket sync, etc.) = high cost & usually signals no real reason for multiple instances
  - Tip: minimize integration requirements to reduce long-term costs & complexity

- Integrated tools must support multi-instance architecture:
  - Not all data providers can split data across multiple instances
  - Risk: "domino effect" — other tools may need similar separation/architecture
  - Tip: verify all integrated tools can handle multi-instance setups

- Never run the same process on the same data across multiple instances:
  - If processes & data are distinct → multi-instance works
  - Heavy data exchange needed → single instance is better choice
  - Tip: avoid duplicating processes across instances

- Quiz: Valid reasons for multi-dev/prod instances → all of the following:
  - Split by release
  - External partner/developer instance
  - Instance hosted in another country (data residency)
  - Split by product

---

## Domain Separation

- Feature: one instance serves multiple customers/BUs via data, process & UI separation → logical groupings called domains
- > **Provider = instance owner; Tenants = orgs using the instance; each tenant has its own domain**
- > **3 separation areas: Data (domain-scoped visibility, partitioned by table) | Process (business logic overrideable per domain) | UI (menus, forms, dashboards overrideable per domain)**
- > **IMPORTANT: Must be enabled BEFORE any dev work — once active irreversible; disabling has hard-to-reverse trickle-down effects**
- > **WARNING: Extremely complex to add or disable post-implementation**

- Domain hierarchy: Top domain = where base business processes are defined → minimizes OOTB changes via overrides; easier upgrades

- Use cases: MSPs, global outsourcers, legal/regulatory requirements, holding companies (M&A/divestitures), global business services ("lift-and-shift")

- Reasons FOR ✅:
  - Different entities on same instance with moderate process/platform alignment
  - Logical data segregation required for compliance
  - Global reporting needed

- Reasons AGAINST ❌:
  - Regulations require physical data separation at DB level (not just logical)
  - Segregation needed only to resolve internal collaboration issues (→ use ACLs instead)
  - Tenants want full ownership & administration of own instance
  - Tenants so large they require multiple nodes or dedicated hardware

- Alternatives for data segregation (when domain separation is overkill):
  - Before query business rules → prevent access to certain records
  - ACLs → limit data visibility among users/groups
  - Filters, views & view rules → limit visible fields on forms/lists per user/group

- Quiz: Domain separation essential consideration → must be applied BEFORE any dev work; cannot be reversed, only disabled

---

## Architectural Models

- **Deliberate customization**: extends OOTB apps for complex requirements; flexible, combinable with other models; risk → overly complex over time
  - Use cases: unique process req not achievable OOTB; data sharing across teams; unified process across countries with ACL-based data segregation
  - Support: SN support has limited ability to support custom code
  - Cost: no additional licenses; higher technical debt
  - Governance: strong governance critical — document all custom code
  - Customer profile: coordinated/lightly coupled teams, light process variation, simple data isolation; applicable to all org types

- **Multiple instances**: each instance purpose-built; physical data separation (advantage over domain separation = only logical); may require significant cross-instance integration
  - Sometimes mandatory for data residency requirements
  - Use cases: international teams with different operations; BUs operating as separate companies; separate cost management per BU
  - Support: reduces customization & support effort
  - Cost: separate licensing, implementation & maintenance per instance
  - Governance: comprehensive governance needed for data, dev, admin & OCM
  - Customer profile: extremely large user groups, extreme process deviations, legal/political demands, highly siloed orgs, specific business mandates

- **Domain separation (model)**: OOTB on single instance; shared database; data & process segregation for multiple business lines/customers
  - Use cases: separate legal/operational entities under common mgmt; global business services; holding companies; MSPs
  - Support: NOW Support team supports domain separation
  - Cost: additional charge may apply
  - Governance: platform team must practice good governance across all domains
  - Customer profile: MSPs, large orgs with discrete BUs, multiple brand identities, complex shared services, highly regulated companies

- Quiz: Models supporting full data separation → **Domain separation** & **Multiple instances** (not deliberate customization)
- Quiz: Model requiring customer to support all customization → **Deliberate customization**

---

## Key Takeaways (Module 6)

- Good governance is essential: robust framework needed for operating model, platform scope, instances & methodology
- Tailor instance stacks to org needs: optimal stack + thorough instance management policies → reduce incident/outage risk
- Explore architectural models: understand strengths, weaknesses & use cases before recommending to customers

---

## Resources

- [Application Support for Domain Separation](https://docs.servicenow.com/csh?version=latest&topicname=domain-separated-apps) — domain separation support levels by SN application
- [Service Provider Implementer learning path](https://learning.servicenow.com/lxp/en/now-platform/service-provider-implementer?id=learning_path_prev&path_id=c3efc5ae1bdb0c101a9b415dee4bcb5d) — SN University learning path & domain separation specialization
- [Comparison of four complex SN architectural models](https://mynow.servicenow.com/now/best-practices/assets/a-comparison-of-four-complex-servicenow-architectural-models) — PDF with 4 architectural models & use cases
- [Domain separation for service providers](https://docs.servicenow.com/csh?version=latest&topicname=domain-sep-landing-page) — recommended practices, config & admin docs
- [Domain separation for service providers workshop](https://mynow.servicenow.com/now/best-practices/assets/domain-separation-for-service-providers-workshop) — PPT for guiding domain separation workshop

---

## Instance Data Replication (IDR)

- IDR = process of copying data from one instance to one or more other instances → consistent data across instances
- Supports one-way or two-way replication of specified data between instances
- Advantages:
  - Selective replication of specific tables, records or data sets based on business needs
  - Use cases: dev/testing, business continuity, multi-instance synchronization
  - Scheduling: near real-time, periodic, or on-demand
  - Security: data encrypted in transit & at rest; RBAC restricts who can configure/manage replication; only authorized data replicated → compliance with security policies

> **Instance Data Replication (IDR) is the process of copying data from one instance to one or more other instances. IDR enables customers to maintain consistent data across different instances.**

- IDR is a no-code solution, making it easy to set up and configure without the need for complex scripting
- ServiceNow provides templates and guided setup to simplify the replication process
- Administrators can manage replication from a single dashboard, reducing operational complexity

- IDR scale out: designed to help customers scale — use cases:
  - Split data/transactions across instances
  - Separate users and data between businesses or processes
  - Integrate with service providers
  - Provide a single source of truth for foundational data across prods and sub-prods
  - Sync public-facing and internal IP access restricted instances

- IDR sync data: fully integrated into ServiceNow, no third-party systems needed
  - Automatically replicates between selected tables
  - Supports one-to-many and bi-directional replication
  - Handles scalability, conflict resolution, and reliability

- IDR producer instance: source instance where replication sets are configured
  - Select table, define data filter, choose attributes to share → replication set
  - Can publish desired records, entire record or selected columns, and attachments

- IDR consumer instance: target instance where replicated data is received
  - Select target table and define attribute mapping
  - Secure connection with producer, can transform data, seed full data sets
  - Detects and pushes record changes automatically, can fire business rules on target table

> **Quiz**
> **Q:** How does IDR enable syncing specified data between ServiceNow instances?
> **Options:**
> - In either a unidirectional or bidirectional replication
> - Data is automatically replicated to one or more other instances
> - By configuring only a producer replication set
> - By activating the producer replication set
> **Correct:** In either a unidirectional or bidirectional replication
> **Erklärung:** One instance is configured as a producer to distribute data, others as consumer instances to receive data. Bidirectional replication enables data to flow from producer to consumer and back.

- IDR: seeding vs. replication
  - **Seeding**: one-time snapshot copy from producer to consumer — no automatic updates after transfer
    - Use cases: new instance setup, large dataset migration, restoring lost data
  - **Replication**: continuous, automated sync — monitors for changes and pushes them to target in real-time/near real-time
    - Use cases: business continuity, global instance consistency, high availability backup

- Quiz: Seeding is used to copy a large dataset to a new instance before enabling replication — ensures initial data is available in the target instance before continuous sync starts

- IDR complexity levels — Low complexity:
  - Use when: table structures are identical or near-identical, no data transformation needed (typically foundation data tables)
  - How: consumer and producer tables directly connected, unidirectional replication set

![IDR Complexity Levels](Slide%2012_IDR%20%E2%80%93.png)

- IDR complexity levels — Medium complexity:
  - Use when: table structures somewhat different, data transformation needed between source and target (typically CI/Asset tables)
  - How: tables directly connected, unidirectional replication set; for bidirectional sync a separate replication set is required

![IDR Medium Complexity](Slide%2013_IDR%20%E2%80%93.jpg)

- IDR complexity levels — High complexity:
  - Use when: table structures very different, heavy transformation needed (typically ticket data: incident, request, case with different state models)
  - How: source and target connected via staging table; business rules process staging records and update target; decision tables translate attribute values (e.g. state mappings)

![IDR High Complexity](Slide%2014_IDR%20%E2%80%93.png)

- IDR use case complexity overview:

| Use Case | Complexity | Direction | Details |
|---|---|---|---|
| **Foundation data**<br>- Users/Groups/Roles<br>- Company/Department/Location | Low | Unidirectional | - Foundation data is managed on the master instance<br>- Foundation data changes are updated from master instance to target instance<br>- Initial load of foundation data is needed |
| **CMDB/Asset data**<br>- Configuration Items<br>- Assets | Medium | Bidirectional | - CMDB data is managed on both instances<br>- CMDB data changes are updated between instances<br>- Initial load of CMDB/Asset data is needed |
| **Ticket data**<br>- Incident/Problem/Change/Request/Case | High | Bidirectional | - Tickets are created on both instances<br>- Tickets are transferred between instances based on filter criteria (support group/service)<br>- Ticket data changes are updated between instances<br>- Tickets are managed on one instance, only pre-defined status changes are allowed on the other instance<br>- Tickets can contain attachments; no initial load of all ticket data is needed |

- When NOT to use IDR:
  - ❌ Very large data sets: seeding limit is 3 million records — not a replacement for cloning
  - ❌ Pre-set schedule: IDR syncs near real-time, no predefined scheduling support
  - ❌ Metadata: configuration, settings, and other metadata are not replicated
  - ❌ Data outside ServiceNow: IDR does not support integrations or data export use cases

> **Quiz**
> **Q:** What are the IDR limitations that you should be aware of as a CTA to help your customer in defining IDR strategies? (Select all that apply)
> **Options:**
> - IDR is designed to replicate data, not clone instances
> - Initial seeding of the tables must be less than 3 million records per replication set
> - IDR does not move data on a pre-set schedule
> - IDR does not replicate metadata tables, configuration, and settings
> - IDR does not support integration or data export use cases outside of ServiceNow
> **Correct:** All of the above
> **Erklärung:** IDR does not replicate metadata tables, is designed to replicate data not clone instances, does not support integration/data export outside ServiceNow, seeding limit is 3M records per replication set, syncs near real-time for targeted tables and columns.

- Core data IDR (multi-instance): designate a golden source (master instance) for core data — established as architectural guideline in design phase; sync via unidirectional IDR job from source to target

- CMDB IDR high-level design: target architecture = consolidated ITSM platform; use IDR as transition mechanism
  - CI ownership assigned to specific groups per instance — managing instance = master record (architectural guideline)
  - Sync CI data via unidirectional IDR job from source to target

- SPM IDR high-level design: data migration needs both high-level strategy and detailed design (depends on data structures and volumes)
  - Understand full scope before selecting solution — IDR is likely one of several options in the migration plan
  - IDR can seed/migrate data, but: processing limit = 50,000 records/hour on target instance (e.g. 1M records ≈ 20 hours)
  - During seeding: all other IDR replication jobs are paused

> **Quiz**
> **Q:** What is the best approach for managing CMDB data when multiple instances exist?
> **Options:**
> - Each instance should have its own independent CMDB
> - Assign ownership of CMDB data to specific groups and designate a master source
> - Synchronize all CMDB data bi-directionally across all instances to maintain consistency
> - Use update sets to transfer CMDB data between instances
> **Correct:** Assign ownership of CMDB data to specific groups and designate a master source
> **Erklärung:** CMDB data should have clear ownership, with a designated master source and structured synchronization rules.

- ServiceNow Requests IDR: Service Bridge is preferred over IDR for cross-org request management
  - Service Bridge: integration between own instance and customer/partner/vendor SN instance; enables bi-directional workflows for service providers to receive and fulfill requests in their own instance
  - IDR = same-org data replication; Service Bridge = cross-instance request management across organizations
  - No one-size-fits-all: always study requirements and build evaluation matrix (options, pros, cons)

---

## Code Migration

- Code migration options:
  1. Update sets
  2. Application repository (Scoped applications)
  3. Integration with a source control repository
  4. App Engine Management Center deployment pipelines

### Application Repository

- Allows developers to publish custom applications for installation on other instances within the organization
- Used to distribute fully developed and tested applications across environments

**Benefits:**
- Enables installation and updates of applications across all instances within an organization
- Restricts access to applications within the same organization
- Facilitates deployment of completed applications to end users

**Key Considerations:**
- Each application must be tested and deployed individually
- All changes must be finalized before publishing a new application version
- Dependencies between packages must be manually tracked to ensure proper functionality

---

### Source Control Integration

- ServiceNow supports integration with Git Source Control for managing changes to code
- Allows developers to track and manage application versions from a non-production instance

**Benefits:**
- Enables management of multiple application versions
- Allows developers to store application work in a Git repository, reducing reliance on update sets for archiving
- Ideal for organizations with multiple non-production instances
- Compatible with ServiceNow CI/CD APIs, enabling automated deployment pipelines

**Key Guidelines:**
- Only one active branch per application per instance can be used at a time
- Each application version must be tested and deployed individually
- Each scope requires its own repository within the Git system
- Dependencies between packages must be manually tracked
- The initial deployment to a target instance requires manual import, but subsequent deployments can be fully automated using CI/CD actions
- A disciplined approach is required when committing changes, merging branches, and maintaining version control hygiene to avoid conflicts

---

### Update Sets

- A collection of configuration changes that can be transferred from one ServiceNow instance to another
- Groups a series of changes into a named set and moves them as a unit to other environments
- An update set is essentially an XML file containing:
  - Record details that uniquely identify the update set
  - A list of configuration changes (customizations like scripts, UI policies, business rules)
  - A state that defines whether the update set can be retrieved and applied on another instance

**Benefits:**
- Tracks changes made to both applications and system platform features
- Facilitates development on non-production instances and promotes changes to other environments
- Supports grouping multiple configuration changes into a single unit for easier management and transfer

**Key Guidelines:**
- Implement a batching strategy to efficiently manage deployment of multiple update sets (especially for large/complex changes)
- The state of an update set should be carefully monitored to ensure changes are applied correctly and only to intended environments
- Always test changes on a non-production instance before moving to production

---

### App Engine Management Center (AEMC)

- Allows organizations to adopt low-code development strategies for app development
- Provides governance and insight; administrators manage app deployment using visual pipelines

**Benefits:**
- Manages the entire application lifecycle (design, development, testing, deployment, maintenance)
- Facilitates version control and updates, enabling new features with minimal risk to live systems
- Provides tools for automated testing to ensure quality and compliance before deployment

**Key Guidelines:**
- Establish role-based access control (RBAC) to ensure only authorized users can create, modify, and deploy applications
- Follow a structured application lifecycle: development → staging/testing → production
- Set up Automated Testing Framework (ATF) and Instance Scan to ensure applications function as expected before deployment

> **Quiz**
> **Q:** What code migration options are supported out of the box? (Select all that apply)
> **Options:**
> - Update sets
> - Instance migration
> - Source control integration
> - Application repository
> **Correct:** Update sets, Source control integration, Application repository
> **Erklärung:** Update sets, source control integration, and application repository are out-of-the-box supported code migration/deployment options. Instance migration is not.

---

## Key Takeaways (Module 5 — IDR & Code Migration)

- 🔑 Understand IDR benefits: ensures data consistency across multiple ServiceNow instances, tailorable to different data structures and complexity levels
- 🔑 Consider approach and design for IDR use cases: understand the customer challenge first, then assess whether IDR is the right solution
- 🔑 Implement best practices for code migration: assess pros/cons of update sets, repositories, and pipelines (AEMC); implement efficient procedures to support release strategies

> **Quiz**
> **Q:** What is a staging instance used for in a 5-instance stack?
> **Options:**
> - End-user training without affecting the dev cycle
> - Pre-production testing, deployment validation, and troubleshooting before changes reach production
> - Storing archived production data
> - Testing upgrades and POCs in isolation
> **Correct:** Pre-production testing, deployment validation, and troubleshooting before changes reach production
> **Erklärung:** A staging instance sits between UAT and Production. It is used for deployment testing (validating the rollout process itself), troubleshooting issues before they reach prod, running pilots, and enabling increased parallel activity across teams. Typical for complex multi-team environments with many integrations.
