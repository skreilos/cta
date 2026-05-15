# Week 6 — User Experience (Summary)

## UX Fundamentals

**UI vs UX vs CX:**
- **UI (User Interface):** The visual and interactive layer connecting users to the system
- **UX (User Experience):** The overall experience of interacting with a product
- **CX (Customer Experience):** The result when UI and UX are successfully combined

**Why UX matters:** For every $1 invested in UX, organizations can expect ~$100 return (9,900% ROI). Good UX reduces training costs, support tickets, and rework.

**Design Thinking** — three phases:
- **Discover:** Understand the problem through empathy — observe users, identify pain points
- **Ideate:** Generate and validate ideas — go broad, then narrow to the best solution
- **Deliver:** Rapid iteration — prototype, test, refine, launch

## Key UX Principles

| Principle | Description | Practical outcome |
|---|---|---|
| **Empathy** | Understand users' emotions, motivations, and challenges | Observe workflows, use empathy maps, identify friction points |
| **Validation** | Test ideas with real users to confirm designs solve the right problem | Low-cost prototypes, usability tests, continuous iteration |
| **Reuse** | Leverage existing patterns and components | Consistent UX, faster development, reduced rework |

## UX Design Process

| Stage | Focus | Techniques |
|---|---|---|
| Early | Identify user needs | Interviews, surveys, empathy maps, journey mapping |
| During | Create and test concepts | Prototyping, usability testing, wireframing, heuristic evaluation |
| Later | Refine and finalize | A/B testing, feedback analysis, design reviews, iterative updates |

Tip: 3-5 participants are usually enough to identify major usability issues.

## Interface & Interaction Design

**UI Design Leading Practices:**
- Keep interfaces simple and intuitive
- Maintain consistency in layout, color, and typography
- Provide system feedback (status, errors, confirmations)
- Design purposeful layouts that guide users to complete tasks
- Use color and texture strategically

**Interaction Design Laws:**
- **Miller's Law:** Chunk information into 7 (±2) items — short-term memory holds 5-9 items
- **Hick's Law:** Decision time increases with the number and familiarity of choices
- **Fitts' Law:** Buttons must be large enough to click, especially on mobile; edges/corners are ideal locations
- **Tesler's Law (Conservation of Complexity):** Remove as much complexity from the user as possible and build it into the system — but only up to a functional limit
- **Poka-Yoke:** Place constraints that force users to correct behavior before proceeding

**Responsiveness levels:** Immediate (<0.1s), stammer (0.1-1s), interruption (1-10s), disruption (>10s)

**Affordances:** Visual clues (color, shape, size) that hint at how an element works
**Signifiers:** Information telling the user what will happen before they act

## Now Experience Framework

Introduced to modernize the ServiceNow UI and provide a consumer-grade experience using reusable web components.

**Key elements:**
- **Now Design System:** All elements for designing and building products (components, guidelines, API docs, playgrounds)
- **UI Builder:** WYSIWYG builder for workspace and portal pages using drag-and-drop components. Accessible standalone or from App Engine Studio.
- **ServiceNow CLI:** External command-line tool for creating, testing, and deploying custom components (pro-code)
- **App Engine Studio:** Low-/no-code development tool for building applications
- **Components:** 150+ pre-built, reusable building blocks — generic, flexible, WCAG 2.0 accessible, mobile-ready, internationalization-enabled

**Form Design Checklist (CTA must know):**
- Logical layout, correct field data types, clear labels
- Tooltips, feedback messages, accessible color use
- Logical field groupings, hints, UI policies (mandatory/hidden/read-only)

**Client-side logic** is fast and dynamic but only knows browser data. Use **GlideAJAX** for async server calls. Use **Display Business Rules** to preload server data and avoid unnecessary round-trips.

**Universal Request:** Single entry point for all departments (IT, HR, Facilities, Legal). Routes automatically, enables seamless cross-department handovers, supports ESM/GBS strategies.

## Service Portal

**What it is:** A visual layer on top of ServiceNow providing an intuitive, device-responsive self-service experience. Available in no-code, low-code, and pro-code configurations.

**Default portal in base system: `/esc` (Employee Center)**

**OOB portals (selection):** `/sp` (Service Portal), `/esc` (Employee Center), `/kb` (Knowledge), `/csm` (Customer Support), `/isc` (Instance Security Center), `/ws` (Workplace Services)

**Architecture components:**
- **URL suffix:** Defines the unique portal address
- **Portal record:** Theme, logo, default pages, main menu, search sources
- **Homepage:** Displays widgets
- **Widgets / Widget instances:** Reusable UI components with individual configurations
- **Scripts:** HTML (render), CSS (style), Client scripts (interactions), Server scripts (data/queries)

## Content Architecture

**Content, Users, Context** — the three pillars. Content is only valuable when it is findable, accessible, and relevant to the right audience in the right context.

**Content lifecycle (5 steps):**
1. **Audit & Analysis** — stakeholder interviews, competitive analysis, content inventory
2. **Strategy** — ownership, taxonomy, workflow, voice/tone, success metrics
3. **Plan** — staffing, CMS config, metadata framework, migration plan
4. **Create** — content production, governance, SEO optimization, quality assurance
5. **Maintain** — audit cycles, performance tracking, continuous improvement

**Content creation leading practices:**
- Understand organizational goals and user needs
- Follow style guides for language and design
- Use language users already use in daily life
- Be purposeful about what content to include or exclude
- Keep content updated or archive it when outdated

## Content Organization: Schemes and Structures

**Exact schemes** (clear, mutually exclusive): Alphabetical, Chronological, Geographical
**Subjective schemes** (org/industry-specific, more useful but harder to design): Topic, Task, Audience, Metaphor

Use hybrid schemes with caution — only when a team cannot agree on a single scheme.

**Structures:**
- **Hierarchical:** Parent/child, top-down — familiar to users
- **Sequential:** Step-by-step flow — assumes order improves understanding
- **Matrix:** User-defined path — takes advantage of hypertext linking

**Sustainable structures:** Avoid too shallow (cluttered menus) and too deep (buried content, frustration, abandonment). Strike a balance.

## Content Labels & Navigation

**Labeling goals:** Convey meaning in few words, use familiar language, show organization, avoid invented terminology.

**Textual label types:**
- **Contextual links:** In-body links relying on surrounding context
- **Headings:** Establish hierarchy, guide scanning
- **Navigation system choices:** Consistent labels across the site (Home, Search, Contact Us)
- **Index terms:** Keywords/controlled vocabulary for search and browsing

**Iconic labels:** Visual symbols that save space but communicate less than text. Risk of misinterpretation without clear/familiar symbols.

**Navigation system types:**
- **Structural:** Follows site hierarchy (global + local navigation)
- **Associative:** Links related content regardless of location — often embedded, easy to miss
- **Utility:** Site tools (site map, help, login/logout, font size)

**Search patterns:**
| Pattern | Description |
|---|---|
| Exact | Basic keyword matching, indexing variants |
| Faceted | Incremental refinement via attributes/tags |
| Parametric | Multiple options (checkboxes, dropdowns) to build a query |
| Best first | Ranked by relevance score (frequency, exact match, metadata weight) |
| Pagination | Linear, inline, or progressive result display |
| Auto-complete / Auto-suggest | Partial query completion / related term suggestions |

## Portal Widgets

**Widget facts:**
- Technically AngularJS directives
- Reusable, self-contained, secure
- 190+ OOB widgets available
- Can be added multiple times per page with different configurations per instance
- Widget Editor: WYSIWYG editor for HTML, CSS, JavaScript with real-time preview

**Widget behavior:**
- **HTML:** Renders the view, binds client script variables
- **Server scripts:** Loads initial data, runs server-side queries
- **Client scripts:** Maps server data to client objects, processes data, passes input back to server

**Additional widget components:** CSS/Bootstrap (styling), Link function (DOM manipulation), Option schema (admin-configurable options), Angular providers (widget sync, shared context, persistent state), Dependencies (external JS/CSS files)

**Widget color codes (Diagnostic Tool):**
- Green: Base system (unmodified)
- Yellow: Cloned widget
- Blue: New custom widget
- Red: Customized base widget (code/schema/dependencies modified)

## Portal Tools

**Widget Diagnostic Tool:**
- CTRL + right-click on portal page to activate
- Color-codes widgets by customization level
- Allows viewing and comparing code (widget, dependencies, Angular providers, templates)
- Limitations: cannot fix/revert code in-tool; navigating to another page disables it; first-level dependencies only; deleted dependencies untrackable; not accessible for visually impaired users
- Troubleshooting tip: deactivate widgets one at a time to isolate issues

**Portal Analyzer:**
- Scheduled job, can run on demand
- Stores results in `sp_portal_analyzer` table
- Fields: Page, Page ID, Widget, Widget ID, Status (OOTB/Cloned/Customized/New), Page views, User count
- Running the job deletes and replaces existing records

**Service Portal Log Entries:** `sp_log` table — portal-specific transaction logs for reporting, troubleshooting, and debugging

**User Experience Analytics:** Tracks key metrics (catalog orders, article views) to optimize portal performance and identify popular content
