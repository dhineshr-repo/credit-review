-- ==============================================================================
-- Quick SQL Schema for CreditPulse: Enterprise Customer Credit Review Hub
-- File: credit_review/quicksql_credit_review.sql
-- ==============================================================================
-- Paste into APEX SQL Workshop -> Quick SQL -> Generate DDL -> Run
-- ==============================================================================

# settings = { prefix: "CR", pk: "IDENTITY", auditcols: true, drop: true }

customers /insert 12
  company_name vc150 /nn /unique
  duns_number vc20 /unique
  industry vc60 /values Technology, Healthcare, Manufacturing, Financial_Services, Retail, Energy
  annual_revenue num(14,2)
  years_in_business num(4)
  country vc50
  primary_contact_name vc100
  primary_contact_email vc120
  current_credit_limit num(12,2)
  requested_credit_limit num(12,2)
  credit_score num(3) /range 300..850
  risk_category vc20 /values Low_Risk, Moderate_Risk, High_Risk, Severe_Risk
  payment_behavior_score num(3) /range 0..100
  bankruptcy_flag vc1 /check Y, N
  outstanding_balance num(12,2)
  overdue_amount num(12,2)
  days_sales_outstanding num(3)
  review_status vc30 /values Draft, Pending_Analyst, Committee_Review, Approved, Rejected, Conditional
  ai_risk_summary clob

credit_reviews /insert 20
  customer_id /fk CR_CUSTOMERS
  review_date date /nn
  analyst_name vc100
  proposed_credit_limit num(12,2)
  recommended_action vc30 /values Approve_Limit, Maintain_Limit, Reduce_Limit, Require_Collateral, Reject
  payment_terms vc30 /values Net_30, Net_45, Net_60, Letter_of_Credit, Prepayment
  financial_statement_rating vc10 /values Strong, Satisfactory, Weak, Distressed
  collateral_value num(12,2)
  review_notes clob
  approval_status vc20 /values Pending, Approved, Rejected, Escalated

financial_anomalies /insert 15
  customer_id /fk CR_CUSTOMERS
  detected_date date /default sysdate
  anomaly_type vc50 /values Late_Payment_Trend, Credit_Bureau_Downgrade, DSO_Spike, Adverse_Media, Revenue_Decline
  severity vc10 /values Critical, High, Medium, Low
  impact_score num(3) /range 0..100
  alert_description vc500 /nn
  status vc20 /values Open, Under_Investigation, Resolved, False_Positive
