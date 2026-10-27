# Brazilian E-Commerce Revenue and Customer Analysis

## Project Overview

This project analyzes Brazilian e-commerce transaction data using PostgreSQL to understand merchandise sales, product category performance, customer purchasing behavior, and geographic revenue distribution.

The analysis focuses on questions that can support business decisions around sales performance, customer retention, and market prioritization.

## Business Questions

1. How does merchandise sales performance change over time?
2. Which product categories generate the most merchandise sales?
3. What proportion of customers make repeat purchases?
4. How does repeat purchasing vary across customer acquisition cohorts?
5. How do one-time and repeat customers compare in merchandise spending?
6. Which Brazilian states generate the most merchandise sales?
7. Which product categories show the highest repeat-purchase rates?

## Tools Used

- **PostgreSQL** — data querying and analysis
- **DBeaver** — database management and SQL execution
- **SQL** — joins, common table expressions (CTEs), aggregation, date-based analysis, conditional counting, and data validation

## Dataset

The project uses the Brazilian E-Commerce Public Dataset by Olist, containing order, item, customer, product, seller, payment, review, and geographic information.

The analysis uses delivered orders and item prices to calculate merchandise sales. Freight charges and other costs are excluded from merchandise-sales calculations.

## Key Findings

### 1. Overall Performance

- **96,478** delivered orders
- **110,197** delivered item rows
- **93,358** unique delivered customers
- **R$13,221,498.11** in merchandise sales

### 2. Monthly Sales

- November 2017 recorded the highest monthly merchandise sales: **R$987,765.37**.
- December 2016 recorded the lowest: **R$10.90**, from only one delivered order.
- The available order-purchase months span September 2016 to August 2018.

### 3. Product Category Performance

The top five categories by merchandise sales were:

1. Health & Beauty — R$1,233,131.72
2. Watches & Gifts — R$1,166,176.98
3. Bed, Bath & Table — R$1,023,434.76
4. Sports & Leisure — R$954,852.55
5. Computers & Accessories — R$888,724.61

### 4. Customer Retention

- **2,801** customers made more than one delivered purchase.
- The overall repeat-purchase rate was **3.00%**.
- January 2017 had a repeat-purchase rate of **7.25%** among its 717-customer cohort.

Repeat-purchase rate is calculated as the percentage of unique customers with more than one delivered order during the observed dataset period.

### 5. Customer Segmentation

| Segment | Customers | Merchandise sales | Average sales per customer |
|---|---:|---:|---:|
| One-time customers | 90,557 | R$12,493,089.36 | R$137.96 |
| Repeat customers | 2,801 | R$728,408.75 | R$260.05 |

Repeat customers represented approximately 3.00% of customers and generated approximately 5.51% of merchandise sales. Their average observed merchandise spend per customer was approximately 1.88 times that of one-time customers.

### 6. Geographic Performance

The leading states by merchandise sales were:

- São Paulo (SP) — R$5,067,633.16
- Rio de Janeiro (RJ) — R$1,759,651.13
- Minas Gerais (MG) — R$1,552,481.83
- Rio Grande do Sul (RS) — R$728,897.47
- Paraná (PR) — R$666,063.51

São Paulo accounted for approximately 38.3% of total merchandise sales.

### 7. Category-Level Repeat Purchasing

Home Appliances had a repeat-purchase rate of **7.27%** among 688 customers. Arts & Crafts showed 9.52%, but this was based on only 21 customers and should be interpreted cautiously.

## Business Recommendations

Based on the observed patterns, the following actions are worth investigating:

1. **Investigate customer retention:** With a 3.00% repeat-purchase rate within the observed dataset, the business could examine why customers do not return and test post-purchase communication, loyalty incentives, or targeted follow-up campaigns.

2. **Study high-performing product categories:** Health & Beauty and Watches & Gifts generated the highest merchandise sales among the categories analyzed. The business could investigate their sales drivers, margins, inventory requirements, and opportunities for sustainable growth.

3. **Evaluate geographic concentration:** São Paulo contributed approximately 38.3% of merchandise sales. The business could assess whether this concentration reflects customer demand, seller availability, delivery coverage, or other market factors before deciding where to expand.

4. **Measure retention over time:** Cohort results suggest differences in repeat purchasing across customer acquisition months. The business should account for differences in observation time before comparing cohorts or evaluating retention initiatives.

These are recommendations for further investigation, not proven causes or guaranteed outcomes. Their impact should be evaluated using additional data and controlled experiments where appropriate.

## Analysis Files and Results

| Analysis | SQL Query | Results |
|---|---|---|
| Monthly Sales | [View SQL](sql/01_monthly_sales.sql) | [View CSV](results/monthly_sales.csv) |
| Category Sales | [View SQL](sql/02_category_sales.sql) | [View CSV](results/category_sales.csv) |
| Customer Segments | [View SQL](sql/05_customer_segments.sql) | [View CSV](results/customer_segments.csv) |
| Sales by State | [View SQL](sql/06_state_sales.sql) | [View CSV](results/state_sales.csv) |
| Category Repeat Purchase | [View SQL](sql/07_category_repeat_purchase.sql) | [View CSV](results/category_repeat_purchase.csv) |

### Additional SQL Analysis

- [Data Validation](sql/00_data_validation.sql)
- [Repeat Purchase Rate](sql/03_repeat_purchase_rate.sql)
- [Customer Cohort Analysis](sql/04_customer_cohorts.sql)
- [Final Validation](sql/08_final_validation.sql)

## Methodology

1. Validated table counts, order statuses, and key identifiers.
2. Restricted sales analysis to delivered orders.
3. Joined order, item, customer, and product tables as required.
4. Cast item prices to PostgreSQL `numeric` before financial aggregation.
5. Used `customer_unique_id` to identify customers across multiple customer records.
6. Grouped results by month, category, customer segment, cohort, and state.
7. Reconciled total merchandise sales across customer segments and final validation.

## Limitations

- Repeat purchases are measured only within the dataset's observation period; customers classified as one-time may purchase again outside that period.
- Recent customer cohorts have less follow-up time than older cohorts.
- Small category samples can produce unstable repeat-purchase rates.
- Merchandise sales are based on item prices and exclude freight and other costs. They should not be interpreted as profit.
- The analysis describes observed associations and patterns; it does not establish the causes of sales or repeat purchasing.

## Repository Structure

```text
ecommerce-revenue-analysis/
├── sql/
│   ├── 00_data_validation.sql
│   ├── 01_monthly_sales.sql
│   ├── 02_category_sales.sql
│   ├── 03_repeat_purchase_rate.sql
│   ├── 04_customer_cohorts.sql
│   ├── 05_customer_segments.sql
│   ├── 06_state_sales.sql
│   ├── 07_category_repeat_purchase.sql
│   └── 08_final_validation.sql
├── documentation/
│   ├── business_questions.md
│   ├── methodology.md
│   ├── data_dictionary.md
│   └── business_findings.md
├── results/
│   ├── monthly_sales.csv
│   ├── category_sales.csv
│   ├── customer_segments.csv
│   ├── state_sales.csv
│   └── category_repeat_purchase.csv
├── data/
├── README.md
└── .gitignore
```

## Conclusion

This analysis establishes a baseline for merchandise sales, category performance, and repeat purchasing in the Olist dataset. The results highlight the importance of understanding customer retention alongside sales volume and suggest opportunities for further investigation into repeat purchasing and geographic concentration.

The project demonstrates practical SQL skills in data validation, relational joins, financial aggregation, customer segmentation, cohort analysis, and business-focused interpretation.
