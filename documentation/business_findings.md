# Business Findings Report

## 1. Executive Summary

This project analyzes delivered orders from the Brazilian E-Commerce Public Dataset by Olist to understand merchandise sales, product category performance, repeat purchasing, and geographic concentration.

The analysis identified R$13.22 million in merchandise sales across 96,478 delivered orders and 93,358 unique customers. Sales were concentrated in a small number of product categories and in São Paulo state. Repeat customers represented a small proportion of the customer base but had higher average observed merchandise spending than one-time customers.

## 2. Overall Performance

| Metric | Result |
|---|---:|
| Delivered orders | 96,478 |
| Delivered item rows | 110,197 |
| Unique delivered customers | 93,358 |
| Merchandise sales | R$13,221,498.11 |
| Repeat-purchase rate | 3.00% |

**Interpretation:** The dataset records a large number of delivered orders, but only 3.00% of unique customers placed more than one delivered order during the observed period. This is a useful retention baseline, not proof that customers are dissatisfied or will never return.

## 3. Monthly Sales Performance

November 2017 had the highest monthly merchandise sales at R$987,765.37. December 2016 had the lowest at R$10.90, but that month contained only one delivered order.

**Business implication:** Sales planning should consider monthly demand patterns, but the unusually low early-period observations should not be treated as representative of a typical month.

## 4. Product Category Performance

| Rank | Category | Merchandise sales |
|---:|---|---:|
| 1 | Health & Beauty | R$1,233,131.72 |
| 2 | Watches & Gifts | R$1,166,176.98 |
| 3 | Bed, Bath & Table | R$1,023,434.76 |
| 4 | Sports & Leisure | R$954,852.55 |
| 5 | Computers & Accessories | R$888,724.61 |

**Interpretation:** Health & Beauty generated the highest merchandise sales among the categories analyzed.

**Business implication:** These leading categories are candidates for further analysis of margins, stock availability, delivery performance, and promotional effectiveness. Sales alone do not establish profitability.

## 5. Customer Retention and Cohorts

There were 2,801 repeat customers and 90,557 one-time customers, giving an overall repeat-purchase rate of 3.00%.

January 2017 had the highest repeat-purchase rate among the reported cohorts with a meaningful customer count: 7.25% across 717 customers.

**Interpretation:** Repeat purchasing is relatively uncommon within the observed dataset period.

**Business implication:** The business could investigate post-purchase communication, customer experience, delivery reliability, and category-specific retention opportunities. These are hypotheses to test, not causes established by this analysis.

Recent cohorts have had less time to place another order, so their repeat rates should not be compared directly with older cohorts.

## 6. One-Time vs Repeat Customers

| Segment | Customers | Merchandise sales | Average observed sales per customer |
|---|---:|---:|---:|
| One-time customers | 90,557 | R$12,493,089.36 | R$137.96 |
| Repeat customers | 2,801 | R$728,408.75 | R$260.05 |

Repeat customers accounted for approximately 3.00% of customers and 5.51% of merchandise sales. Their average observed merchandise spending per customer was approximately 1.88 times that of one-time customers.

**Business implication:** Repeat customers may represent a valuable retention opportunity. Before estimating the financial return from retention campaigns, the business should examine profit margins, customer acquisition costs, and the timing of repeat purchases.

## 7. Geographic Sales Distribution

São Paulo generated R$5,067,633.16 in merchandise sales, approximately 38.3% of the overall total. Rio de Janeiro and Minas Gerais ranked second and third.

**Interpretation:** Merchandise sales are geographically concentrated, with São Paulo contributing the largest share.

**Business implication:** Further investigation could compare delivery costs, order frequency, returns, and profitability by state before prioritizing investment.

## 8. Category-Level Repeat Purchasing

Home Appliances had a repeat-purchase rate of 7.27% among 688 customers. Arts & Crafts had a rate of 9.52%, but this was based on only 21 customers.

**Interpretation:** Home Appliances provides a more substantial customer base for follow-up investigation than Arts & Crafts, despite the latter's higher observed rate.

**Business implication:** Analyze repeat-purchase timing, margins, and category-specific customer behavior before recommending retention campaigns.

## 9. Limitations

- Merchandise sales exclude freight and other charges and are not equivalent to profit.
- Repeat purchasing is measured only within the observed dataset period.
- Recent cohorts have shorter follow-up periods.
- Small customer groups can produce unstable rates.
- The analysis is descriptive and does not establish causal relationships.
- Further work is needed to assess profitability, seasonality, and the drivers of repeat purchasing.

## 10. Conclusion

The analysis establishes a baseline for merchandise sales and customer behavior in the Olist dataset. The main opportunities for further investigation are customer retention, the performance of leading product categories, and geographic concentration.

The project demonstrates how SQL can be used to validate data, aggregate sales, segment customers, perform cohort analysis, and translate results into business-focused findings.
