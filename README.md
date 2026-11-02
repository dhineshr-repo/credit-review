# CreditPulse: Customer Credit Review & Underwriting Hub
An enterprise-grade Oracle APEX application suite for commercial credit assessment, real-time exposure monitoring, and underwriting workflows.

---

## 🏛️ Application Overview
**CreditPulse** is built using modern Oracle APEX architectural patterns:
- **Declarative APEXLang Specification (`.apx`)**: Authored in Oracle's domain-specific language for AI and Agentic pipelines.
- **Oracle APEX 26.1 Application Blueprint**: Structured specifications (`functional_spec`, `schema_metadata`, and `blueprint`) for one-click application scaffolding.
- **Quick SQL & Production DDL**: Automated relational schema creation with identity primary keys, audit columns, check constraints, foreign keys, and comprehensive enterprise sample data.

---

## 📁 Repository Structure

```
├── credit_review_app.apx                # Official Oracle APEXLang (.apx) declarative app specification
├── quicksql_credit_review.sql           # Quick SQL shorthand for fast APEX schema compilation
├── cr_schema_clean.sql                  # Full Oracle DDL with triggers, sequences, and mock customer data
├── credit_review_functional_spec.md     # APEX 26.1 Functional Requirements & User Roles Spec
├── credit_review_schema_metadata.md     # APEX 26.1 Schema Metadata with semantic types & LOVs
├── credit_review_generated_blueprint.md # Oracle APEX 26.1 Blueprint Engine definition
└── README.md                            # Repository documentation & quickstart guide
```

---

## 🚀 Application Architecture & Page Map

| Page | Name | Component Type | Key Business Capability |
|---|---|---|---|
| **Page 1** | **Executive Command Center** | KPI Cards & Redwood Charts | Total portfolio exposure, watchlist concentration, overdue receivables, and risk distribution donut chart. |
| **Page 2** | **Customer Credit Directory** | Interactive Report | Filterable directory by Industry, Risk Tier, Country, Bankruptcy Flag, and Underwriting Status. |
| **Page 3** | **Customer Underwriting Dossier** | Modal Dialog Form | Detailed credit score assessment (300-850), payment behavior index (0-100), requested limit adjustment, and AI risk narrative. |
| **Page 4** | **Credit Committee Decision Log** | Interactive Report | Multi-tiered decision audit trail, proposed limits, collateral requirements, and approved payment terms (Net 30, Net 45, LC). |
| **Page 5** | **Underwriting Decision Entry** | Modal Dialog Form | Underwriter review submission, committee recommendation, terms selection, and condition rationale. |
| **Page 6** | **Early Warning & Anomalies Feed** | Cards / Feed Region | Real-time financial distress anomaly alerts (DSO spikes, credit bureau downgrades, payment delays) with severity badges. |

---

## 🛠️ Quickstart Deployment in Oracle APEX

### Method 1: Instant App Builder Scaffolding (via Blueprint)
1. In your Oracle APEX Workspace, navigate to **App Builder ➔ Create Application ➔ Load Blueprint**.
2. Copy and paste the contents of **`credit_review_generated_blueprint.md`**.
3. Click **Apply Blueprint**.
4. Review the generated pages and click **Create Application**.

### Method 2: Schema First (Quick SQL / DDL)
1. Go to **SQL Workshop ➔ SQL Scripts ➔ Upload**.
2. Upload **`cr_schema_clean.sql`** (or paste `quicksql_credit_review.sql` into **Quick SQL**).
3. Click **Run** to provision tables:
   - `CR_CUSTOMERS`
   - `CR_CREDIT_REVIEWS`
   - `CR_FINANCIAL_ANOMALIES`
4. Click **Create App from Script** to instantly generate reports and forms.

---

## 📜 APEXLang Declarative Snippet (`credit_review_app.apx`)

```apexlang
app CREDITPULSE (
    name: CreditPulse - Customer Credit Review Hub
    alias: CREDITPULSE
    version: 1.0.0

    userInterface {
        currentTheme: @universal-theme
        themeStyle: Redwood Light
        globalPage: 0
    }

    authentication {
        scheme: @oracle-apex-accounts
    }

    runtime {
        compatibilityMode: 26.1
    }
)
```

---

## 📄 License & Attribution
Developed for the Oracle APEX community and enterprise underwriting teams.
Authored with **APEXLang** and **Oracle APEX 26.1 Blueprint Standards**.
