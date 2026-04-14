# Week 2 - Quiz Questions

> **Quiz**
> **Q:** Which of the following best represents the key balance that governance steps must achieve when defining the instance and release strategy?
> **Options:**
> - Balancing single-domain structures vs. multiple-domain structures
> - Balancing innovation vs. budget control
> - Balancing control vs. deployment speed
> - Balancing risk mitigation vs. value realization
> **Correct:** Balancing risk mitigation vs. value realization
> **Erklärung:** Governance steps in instance and release strategy must ensure risk is controlled while still delivering value — not just speed or budget.

> **Quiz**
> **Q:** As a CTA when should you leverage your workshop agenda? [Note: Question appears incomplete in source — likely about multi-domain challenges]
> **Options:**
> - Increased license management effort across domains
> - Increased upgrade complexity due to separate testing for each domain
> - Increased administrative overhead to maintain domain configurations
> - Increased difficulty in ensuring consistent governance across domains
> **Correct:** Increased upgrade complexity due to separate testing for each domain
> **Erklärung:** Question wording appears incomplete in source. Options 1, 3, 4 were tested and wrong — option 2 determined by elimination.

> **Quiz**
> **Q:** A global organization is implementing a complex ServiceNow solution involving multiple teams, numerous integrations, and strict pre-production testing requirements. Which instance stack would best support the organization's implementation needs?
> **Options:**
> - Three instance stack: Development, Testing, Production
> - Four instance stack: Development, QA, UAT, Production
> - Five instance stack: Development, QA, UAT, Staging, Production
> - Two instance stack: Development, Production
> **Correct:** Five instance stack: Development, QA, UAT, Staging, Production
> **Erklärung:** A global organization with numerous integrations and strict pre-production testing requirements needs a Staging environment as a final production-like validation layer before go-live. The 4-instance stack is standard for complex implementations, but Staging is justified here due to the global scope and integration complexity.

> **Quiz**
> **Q:** Instance Data Replication (IDR) allows data to be copied from one ServiceNow instance to one or more other instances. Which of the following reflects the advantages of using IDR?
> **Options:**
> - Uses custom scripts for replication setup and execution
> - Provides a no-code setup and a single dashboard for administrators to manage replication
> - Focuses on replicating metadata changes across ServiceNow instances
> - Eliminates the need for encryption during data transfer
> **Correct:** Provides a no-code setup and a single dashboard for administrators to manage replication
> **Erklärung:** IDR's key advantage is the no-code configuration and centralized dashboard — no custom scripting needed, and it handles data (not metadata) replication with encryption intact.

> **Quiz**
> **Q:** True or False: Instance Data Replication (IDR) can be used both for a one-time seeding process, which copies all required data from a producer instance to consumer instances, and for continuously keeping data synchronized through replication.
> **Options:**
> - True
> - False
> **Correct:** True
> **Erklärung:** IDR supports both modes: initial one-time seeding to populate consumer instances, and ongoing continuous replication to keep data in sync.

> **Quiz**
> **Q:** A development team wants to implement version control and support automated deployment pipelines for their ServiceNow applications. Which code migration method should they choose?
> **Options:**
> - Update sets
> - Application repository
> - Manual XML export and import
> - Source control integration (Git)
> **Correct:** Source control integration (Git)
> **Erklärung:** Git integration provides both version control and automated CI/CD pipeline support for ServiceNow applications. The Application Repository is an artifact store within the pipeline, not the entry point for version control.

