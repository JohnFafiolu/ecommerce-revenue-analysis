# Analysis Methodology

## 1. Data Source

The project uses the Brazilian E-Commerce Public Dataset by Olist. The analysis uses order, order-item, customer, and product tables stored in PostgreSQL.

## 2. Data Validation

Before analysis, SQL queries were used to examine:

- Table row counts and distinct identifiers.
- Order status distribution.
- Missing or blank key fields.
- Duplicate identifiers.
- Customer-to-order relationships.
- Product category completeness.
- Delivered-order item counts and merchandise sales.

These checks help establish whether the tables can be used reliably for the planned analysis.

## 3. Data Preparation

### Order Filtering
Sales and customer analyses were restricted to orders with the status `delivered`.

### Table Joins
The analysis joins orders to order items using `order_id`. Customer analysis joins orders to customers using `customer_id`. Category analysis joins order items to products using `product_id`.

### Category Standardization
Blank or missing product category labels are represented as `Unknown` using `NULLIF`, `TRIM`, and `COALESCE`.

### Financial Calculations
The source `price` column is stored as PostgreSQL `real`. Prices are converted to `numeric` using `price::numeric` before aggregation to avoid relying on floating-point arithmetic for financial totals.

## 4. Analysis Methods

### Monthly Sales
Item prices are summed by the month of the order purchase timestamp. Delivered orders and item rows are counted separately.

### Category Sales
Item prices are aggregated by product category. Categories are ranked by merchandise sales.

### Repeat Purchase Rate
Orders are deduplicated by unique customer and order. Customers with more than one delivered order are classified as repeat customers.

Formula:

Repeat-purchase rate = (Repeat customers / Total customers) × 100

### Customer Cohorts
Each customer's cohort is defined by the month of their first delivered purchase. The analysis measures the proportion of customers in each cohort who have more than one delivered order over the full observed period.

### Customer Segmentation
Customers are classified into one-time and repeat groups. The analysis compares customer counts, delivered orders, total merchandise sales, and average observed merchandise sales per customer.

### Geographic Sales
Merchandise sales are aggregated by customer state and ranked from highest to lowest.

### Category-Level Repeat Purchasing
Customers are grouped by product category. A customer is classified as a repeat purchaser of a category if they have more than one distinct delivered order containing that category.

## 5. Reconciliation and Validation

The final validation query checks the total number of delivered orders, delivered item rows, unique delivered customers, and merchandise sales.

The validated baseline is:

- Delivered orders: 96,478
- Delivered item rows: 110,197
- Unique delivered customers: 93,358
- Merchandise sales: R$13,221,498.11

Customer segment sales were also checked against the merchandise-sales baseline.

## 6. Interpretation Considerations

- Merchandise sales exclude freight and other charges.
- Merchandise sales are not profit.
- Repeat purchasing is measured only within the available observation period.
- Recent cohorts have less time to make another purchase.
- Small category samples may produce unstable repeat-purchase rates.
- Observed patterns do not prove the causes of customer behavior or sales performance.
