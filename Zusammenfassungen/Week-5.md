# Week 5 - Security Architecture

## Security Mindset & Threat Modeling

- A **security mindset** means proactively anticipating risks before they occur: skeptical, curious, detail-oriented, preventive rather than reactive.
- Two core questions when architecting any solution:
  - What might go wrong?
  - What can we do to prevent this?
- **Threat modeling** is a risk-based approach that systematically identifies possible threats, assesses their impact, and defines mitigations — output is a list of technical threats and security measures.

## Shared Security Model

Security is a **shared responsibility** between ServiceNow (data processor) and the customer (data controller).

- **Customer responsibilities**: security contact details, instance configuration, authentication/authorization, data classification and retention, data encryption at rest, encryption key management
- **ServiceNow responsibilities**: physical security, cloud infrastructure, media disposal, backup/restore
- **Shared**: data encryption in transit, key management, security logging/monitoring, vulnerability management, penetration testing, privacy compliance, regulatory compliance

> **The customer is responsible for determining how data is collected, stored, used, shared, archived, and destroyed.**

## Physical Security Architecture

- Data centers arranged in **high-availability regional pairs** across 5 continents: Asia, Australia, Europe, North America, South America.
- All customer production data is stored in **both** facilities within the pair, kept in sync via real-time database replication. Both are active simultaneously.
- Controls: 24/7 security guards + CCTV, biometric access, physical intrusion detection, anti-climb fencing, crash-resistant walls, physical access audits, redundant power paths, fire detection/suppression.

## Logical Security Architecture: 3 Layers

The platform uses **defense-in-depth** across three logical layers:

| Layer | Focus |
|---|---|
| Network layer (Internet services) | Network connectivity and data transmission |
| Application layer | Secure user access, authentication, instance configuration |
| Database layer | Protecting stored data and the hardware it resides on |

> **Requests from users and integrations always enter through the Network layer first — the Application layer is not directly accessible from the internet.**

---

## Network Layer

- **TLS 1.2**: all traffic to/from the instance is encrypted in transit.
- **IP Address Access Control**: activated via the `com.snc.ipauthenticator` plugin — defines trusted (allow) and untrusted (deny) IP ranges. A block only applies if a Deny rule exists and no Allow rule matches. Default: no restrictions.
- **Certificates**: required for LDAP, mutual authentication (outbound web services), browser/server SSL connections, and MID Server communication.
- **VPN**: ensures users connect from a trusted IP range. Also used to integrate ServiceNow with external data sources when security policy requires it. VPN requests go through ServiceNow Support (typical build time: one week or less).

---

## Application Layer

### Pre-Logon
Policy framework that enforces the right authentication controls for the right persona at the right time. Based on: user role, device used, location. Outcomes: allow/deny, enforce MFA, assign least-privileged access.

### Adaptive Authentication
Validates user identity and then authorizes access to features matching their roles.

- **Filter Criteria**: policy inputs that verify authentication requests (e.g., IP range)
- **Authentication Policy**: evaluates conditions and determines access
- **4 policy decisions**: Allow full access / Access after MFA / Allow with reduced access / Deny access

> **At any point, only one of Allow Access Policy or Deny Access Policy can execute — not both.**

**Best practices:**
- Prefer corporate SSO so password policies follow corporate standards.
- Enable MFA for local accounts (password policies not enforced for local accounts).
- Since Yokohama: MFA is enforced for non-SSO logins.

### Authorization (RBAC + ACLs)
- Roles combined with ACLs are the standard mechanism for access control.
- **`security_admin` role**: not inherited, must be explicitly granted, requires user to "elevate" to it.
- REST Table API is open to any user passing table ACL checks; insert/update via REST ignore client script validations but business rules still apply.

### Zero Trust Access (ZTA)
- Principle: **"never trust, always verify"**
- Access granted based on user identity, device security posture, and request context — not network location.
- Can remove or limit a user's role based on defined conditions.

### Security Center (SSC)
Free application with three consoles:

- **Security Configuration**: hardening compliance score, graphical trends, non-compliant settings, scan results
- **Security Monitoring**: security notifications and metrics
- **Security Posture**: identify, respond to, and recover from threats — step-by-step guidance

---

## Database Layer

### Database Encryption
Converts stored data into an unreadable format using a key. Data is unusable without the decryption key. Applied when customer policies require certain data classifications to be encrypted at rest.

### Platform Encryption (subscription bundle)

**Field Encryption** (new as of Yokohama, replaces Column-Level Encryption, Edge Encryption, Secrets Management, and Encrypted Text):
- Permanently encrypts sensitive data in supported field types — in the database and UI
- Only temporarily decrypted in the UI via ephemeral object decryption
- Uses **Module Access Policies (MAPs)** to restrict access to users, scripts, and system processes
- Includes **Access Observer**: tracks who/what accessed a field before encryption is applied
- Keys are rooted in **FIPS 140-2 L3 validated HSMs**

**Cloud Encryption**:
- Encrypts the total database host, including all backups and sub-prods
- Protects against physical theft or unauthorized access in datacenters

> **Field Encryption = data in use + at rest. Cloud Encryption = protection against physical loss/theft of storage devices.**

### ServiceNow Vault (paid plugin)

Additional security tools on top of Platform Encryption and ZTA:

- **Code Signing**: creates digital signatures for scripts and configuration data — ensures only authorized scripts execute on MID Servers
- **Data Privacy**: discover and classify sensitive data, then anonymize it so it is no longer considered regulated private information
- **Data Discovery**: runs jobs on defined tables to identify sensitive data (credit cards, SSNs, emails, etc.) and reports findings on a dashboard
- **Log Export Service**: exports system and application logs to third-party SIEM tools for threat detection and performance monitoring

---

## Key Takeaways

1. **Security mindset + threat modeling** are the starting point for any secure architecture decision.
2. **Shared responsibility** means the customer owns configuration, access control, and data management — ServiceNow owns the infrastructure.
3. **Defense-in-depth** across three layers (network, application, database) makes the platform robust against varied threats.
4. **Field Encryption** (Yokohama) replaces multiple older mechanisms — know what it replaced.
5. **Zero Trust Access** goes beyond Role-Based Access Control: continuous verification based on identity, device posture, and context.
