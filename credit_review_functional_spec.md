# Functional Requirements: Customer Credit Review & Underwriting Hub (CreditPulse)

## 1. Overview & Business Context
CreditPulse is an enterprise financial application designed for corporate treasury, credit analysts, and underwriting committees. It automates customer credit assessments, monitors real-time exposure limits, and evaluates financial health indicators (DSO, payment history, debt service, bankruptcy indicators, and third-party credit bureau scores).

### Core Business Objectives:
- Track customer accounts, approved credit lines, and requested limit expansions.
- Implement multi-tiered underwriting approval flows (Analyst review, Committee escalation).
- Flag real-time financial distress anomalies (late payment trends, DSO spikes, rating downgrades).
- Provide executive visibility into aggregate portfolio exposure by industry and risk category.

---

## 2. Security & User Roles
The application uses Oracle APEX Access Control with the following roles:
- **Administrator**: Full system access, configuration of risk scoring thresholds and user provisioning.
- **Credit Officer / Underwriter**: Review customer dossiers, perform financial statement evaluations, propose credit lines.
- **Credit Committee Member**: Approve, reject, or escalate high-exposure credit limits (> $5,000,000).
- **Treasury Analyst**: Monitor daily outstanding balances, receivables aging, and DSO anomalies.
- **Viewer**: Read-only portfolio visibility.

---

## 3. Work Areas & User Experience

### Work Area 1: Executive Command Center (Dashboard)
- **KPI Indicators**:
  - Total Approved Credit Exposure ($)
  - Watchlist Portfolio Exposure (High / Severe Risk accounts)
  - Total Past Due Receivables ($) and Average Days Sales Outstanding (DSO)
  - Pending Committee Approvals count
- **Visual Analytics**:
  - Donut Chart: Customer Distribution by Risk Tier (Low, Moderate, High, Severe).
  - Bar Chart: Aggregate Exposure by Industry Sector.

### Work Area 2: Customer Credit Directory & Scoring (Directory)
- **Interactive Report**:
  - Filterable by Industry, Risk Tier, Country, Bankruptcy Flag, and Underwriting Status.
  - Searchable by Legal Company Name and D-U-N-S Number.
  - Row Action: Launch Customer Underwriting Assessment dialog.
  - Page Action: "Onboard Customer" button.

### Work Area 3: Customer Underwriting Assessment (Modal Dialog)
- **Form Controls**:
  - Customer legal identifiers, industry, annual revenue, and bureau credit score (300-850).
  - Exposure controls: Current Credit Limit vs. Requested Credit Limit.
  - Risk classification and payment behavior score (0-100).
  - Balance sheet strength rating and historical bankruptcy indicator.
  - AI risk synthesis narrative field.

### Work Area 4: Credit Committee Decision Log (Reviews)
- **Interactive Report**:
  - Historical underwriting decisions by analyst and committee.
  - Tracks proposed limits, approved payment terms (Net 30, Net 45, LC), and pledged collateral value.
  - Status badges for Pending, Approved, Rejected, and Escalated reviews.

### Work Area 5: Underwriting Decision Entry (Modal Dialog)
- **Form Controls**:
  - Customer lookup selector.
  - Decision date and underwriter attribution.
  - Proposed limit, terms selection, collateral amount, and conditions rationale.

### Work Area 6: Early Warning & Financial Anomalies (Feed)
- **Anomaly Feed**:
  - Card stream of real-time early warning triggers (DSO spikes, credit downgrades, payment delays).
  - Visual severity tags (Critical, High, Medium, Low) and Impact Scores (0-100).
  - Drill-down action directly into customer dossier.
