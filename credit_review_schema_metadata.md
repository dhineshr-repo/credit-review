# Schema Metadata: Customer Credit Review Hub (CR Prefix)

## Table: CR_CUSTOMERS
- Primary Key: ID (NUMBER, Identity)
- Primary Display: COMPANY_NAME (VARCHAR2)
- Table Type: Transaction Master
- Context Description: Enterprise corporate customers with approved credit lines, bureau scores, risk categories, and accounts receivable balances.

### Columns
- ID: Primary key, numeric identifier.
- COMPANY_NAME: Legal corporate name of customer (Text, Mandatory, Unique).
- DUNS_NUMBER: 9-digit Dun & Bradstreet unique corporate identifier (Text, Unique).
- INDUSTRY: Industry sector categorization (LOV: Technology, Healthcare, Manufacturing, Financial_Services, Retail, Energy).
- ANNUAL_REVENUE: Total trailing 12-month top-line revenue in currency (Number, Currency).
- YEARS_IN_BUSINESS: Operational business vintage in years (Number).
- COUNTRY: Country of incorporation (Text).
- PRIMARY_CONTACT_NAME: Chief Financial Officer or Credit Controller name (Text).
- PRIMARY_CONTACT_EMAIL: Contact email address for billing and underwriting (Email).
- CURRENT_CREDIT_LIMIT: Currently sanctioned aggregate credit limit (Number, Currency, Default: 0).
- REQUESTED_CREDIT_LIMIT: Customer requested expansion credit limit (Number, Currency).
- CREDIT_SCORE: External commercial bureau risk score (Number, Range: 300 to 850).
- RISK_CATEGORY: Internal credit risk rating (LOV: Low_Risk, Moderate_Risk, High_Risk, Severe_Risk).
- PAYMENT_BEHAVIOR_SCORE: Historical trade payment index (Number, Range: 0 to 100).
- BANKRUPTCY_FLAG: Prior or active insolvency filing flag (LOV: Y, N, Default: N).
- OUTSTANDING_BALANCE: Total open unpaid invoices (Number, Currency).
- OVERDUE_AMOUNT: Delinquent invoices past agreed payment terms (Number, Currency).
- DAYS_SALES_OUTSTANDING: Current Days Sales Outstanding metric (Number, Days).
- REVIEW_STATUS: Lifecycle status of credit file (LOV: Draft, Pending_Analyst, Committee_Review, Approved, Rejected, Conditional).
- AI_RISK_SUMMARY: Generative AI synthesized risk assessment (CLOB, Long Text).

---

## Table: CR_CREDIT_REVIEWS
- Primary Key: ID (NUMBER, Identity)
- Primary Display: REVIEW_DATE (DATE)
- Parent Table: CR_CUSTOMERS (FK: CUSTOMER_ID)
- Table Type: Detail Transaction
- Context Description: Formal credit underwriting evaluations conducted by credit officers and committee members.

### Columns
- ID: Primary key.
- CUSTOMER_ID: Foreign key reference to CR_CUSTOMERS.
- REVIEW_DATE: Date underwriting assessment was completed (Date).
- ANALYST_NAME: Full name and title of the lead underwriter (Text).
- PROPOSED_CREDIT_LIMIT: Credit line recommended by the underwriter (Number, Currency).
- RECOMMENDED_ACTION: Credit decision recommendation (LOV: Approve_Limit, Maintain_Limit, Reduce_Limit, Require_Collateral, Reject).
- PAYMENT_TERMS: Approved commercial terms (LOV: Net_30, Net_45, Net_60, Letter_of_Credit, Prepayment).
- FINANCIAL_STATEMENT_RATING: Audit review quality (LOV: Strong, Satisfactory, Weak, Distressed).
- COLLATERAL_VALUE: Fair market value of assets pledged as security (Number, Currency).
- REVIEW_NOTES: Underwriting narrative and covenants (CLOB).
- APPROVAL_STATUS: Committee approval status (LOV: Pending, Approved, Rejected, Escalated).

---

## Table: CR_FINANCIAL_ANOMALIES
- Primary Key: ID (NUMBER, Identity)
- Primary Display: ALERT_DESCRIPTION (VARCHAR2)
- Parent Table: CR_CUSTOMERS (FK: CUSTOMER_ID)
- Table Type: Event / Anomaly Stream
- Context Description: Automated early warning signals detecting credit quality degradation.

### Columns
- ID: Primary key.
- CUSTOMER_ID: Foreign key reference to CR_CUSTOMERS.
- DETECTED_DATE: Date anomaly was detected (Date, Default: SYSDATE).
- ANOMALY_TYPE: Category of risk trigger (LOV: Late_Payment_Trend, Credit_Bureau_Downgrade, DSO_Spike, Adverse_Media, Revenue_Decline).
- SEVERITY: Priority level (LOV: Critical, High, Medium, Low).
- IMPACT_SCORE: Quantitative risk impact weighting (Number, Range: 0 to 100).
- ALERT_DESCRIPTION: Detailed description of trigger event (Text, 500 chars).
- STATUS: Investigation resolution status (LOV: Open, Under_Investigation, Resolved, False_Positive).
