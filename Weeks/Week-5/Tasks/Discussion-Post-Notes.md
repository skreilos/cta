# Week 5 - Discussion Post Working Notes
Group 10 "Cooking Architects" | Week 5: Security Architecture

## Summary
The proposed three-layer security model addresses GlobalPort's core concerns reasonably well at the technical level. Network and Application layers are fully covered. The Data Layer has the right tools in place but lacks a governance and data residency strategy, which is critical for a multinational operation under General Data Protection Regulation (GDPR) and international trade law. The main gaps are not in the technology itself, but in what the architecture leaves unspecified: no Disaster Recovery plan, no key ownership definition, no audit log export, and no behavioral anomaly detection.

---

## Group Analysis

### Network Layer
- **Assessment:** Fully covered
- IP-based access control: restricts who can reach the platform at network level
- Certificates: ensure encrypted, authenticated communication between systems
- Virtual Private Network (VPN): secures connectivity for remote users and external sites
- Reasoning:

### Application Layer
- **Assessment:** Fully covered
- Zero Trust Access (ZTA): every request is verified regardless of origin (no implicit trust)
- Adaptive authentication: adjusts login requirements based on risk signals (location, device, behavior)
- Role-Based Access Control (RBAC): users only access what their role explicitly permits
- Secure Application Programming Interface (API) integrations: external systems connect through controlled, authenticated endpoints
- Reasoning:

### Data Layer
- **Assessment:** Partially covered
- ServiceNow Vault: encrypts data at rest, protects field values directly in the database
- Platform encryption: covers data in transit between services
- Reasoning: The encryption technology is there, but the architecture says nothing about data residency. GlobalPort operates across multiple countries, each with different laws (General Data Protection Regulation (GDPR) in the EU, data localization requirements in other regions). Vault protects data, but without a clear strategy for where data is hosted and who controls the encryption keys, GlobalPort cannot demonstrate compliance per country.

---

## Four Questions

### Q1: Does the architecture sufficiently address Confidentiality, Integrity, Availability (CIA) + Compliance?
- Confidentiality: Largely addressed. Role-Based Access Control (RBAC) and Zero Trust Access (ZTA) control who can access what, Vault protects the data itself. The siloed systems problem is solved by consolidating data into ServiceNow rather than just connecting systems, which means one consistent security model applies to everything. Remaining risk: the migration process itself is a window where data moves out of old systems and into ServiceNow, introducing transitional exposure.
- Integrity: Audit trails are proposed, but logs stay within ServiceNow. A compromised admin could tamper with them. Log Export Service to an external Security Information and Event Management (SIEM) (e.g. Splunk, Azure Sentinel) is not mentioned, so there is a gap here.
- Availability: Partially addressed. ServiceNow's physical architecture features High Availability (HA) regional pairs with redundant power distribution to minimize downtime. However, the architecture does not mention a Disaster Recovery (DR) instance, Recovery Time Objective (RTO)/Recovery Point Objective (RPO) targets, or a failover strategy. For a 24/7 operation with financial penalties for downtime, monitoring alone is not enough - you need a defined recovery plan.
- Compliance (General Data Protection Regulation (GDPR)): Well addressed. Platform encryption, data discovery via Vault, and Log Export Service align directly with General Data Protection Regulation (GDPR) requirements. Automated compliance reporting and real-time monitoring dashboards close the "demonstrable safeguards" gap. The Security Center (SSC) continuously monitors and validates the security posture of the ServiceNow deployment.

### Q2: Are all three layers adequately covered? Gaps?
- Network: Fully covered
- Application: Fully covered
- Data: Partially covered - Governance and Data Residency not addressed
- Gaps:
  - Log Export Service
  - Disaster Recovery (DR)
  - Governance Framework
  - Endpoint Security
  - User Friction
  - No Intrusion Detection System (IDS) tuning or Security Information and Event Management (SIEM) alert rules specific to logistics and trade data patterns

### Q3: What risks / operational challenges remain unaddressed?
- Data migration is a transitional confidentiality risk: moving data from siloed systems into ServiceNow creates a window of exposure that is not addressed in the architecture
- No Disaster Recovery (DR) strategy defined: the architecture does not specify a secondary instance, Recovery Time Objective (RTO)/Recovery Point Objective (RPO) targets, or failover process - critical for a 24/7 operation with financial penalties for downtime
- The technical pieces are in place, but there is no governance framework:
  - No definition of who decides which fields are encrypted
  - No key management or rotation policy for Vault
  - No data residency strategy: the architecture does not specify where data is hosted per region, or whether separate instances are needed per country
  - No key ownership definition: it is unclear whether GlobalPort or ServiceNow controls the encryption keys (relevant for data sovereignty)
  - "Periodic reviews of access privileges" is mentioned as an enhancement, but is an intent statement, not a governance framework
- Log Export Service is not mentioned. Audit logs stored only in ServiceNow can be tampered with by a privileged user. Exporting to an external Security Information and Event Management (SIEM) (e.g. Splunk, Azure Sentinel) would make them tamper proof and allow cross system correlation.
- Endpoint security: ServiceNow's data centers are physically secured, but the devices at GlobalPort's warehouses and transport hubs are outside that perimeter. A compromised local device bypasses Zero Trust Access (ZTA) at the application level.
- User friction: enforcing Zero Trust Access (ZTA) and Multi-Factor Authentication (MFA) across global warehouse staff requires a change management plan. Without it, security measures can slow down the 24/7 operations GlobalPort is trying to protect.
- No User and Entity Behavior Analytics (UEBA) or anomaly detection: periodic access reviews are mentioned but do not cover real-time insider threat detection. A compromised or malicious user operating within their assigned role would go undetected.
- Third-party data feed integrity: GlobalPort connects to external systems (customs, trade, partners). Outbound connections use certificates, but the integrity of inbound data from those systems is not governed.


### Q4: How to present to leadership? Which benefit to emphasize?
- Lead with regulatory compliance: General Data Protection Regulation (GDPR) penalties and trade law violations are direct financial and reputational risks. Frame the three-layer model as an audit-ready evidence framework, not just an IT architecture.
- Then shift to operational resilience: connect the architecture directly to revenue protection. Fewer outages mean fewer penalties and fewer dissatisfied clients.
- Close with scalability: the architecture expands with GlobalPort. New markets do not create new security debt.
- Concrete recommendation to add: a formal Business Continuity and Disaster Recovery (BCDR) addendum specifically addressing the 24/7 availability requirement. Without it, leadership's skepticism on operational resilience is justified.


---

## Draft Post


