# Data Dictionary

## Overview

This project uses the Brazilian E-Commerce Public Dataset by Olist. The following tables support the sales and customer analyses.

## Tables Used

| Table | Purpose | Key Columns |
|---|---|---|
| `olist_orders_dataset` | Order records and purchase dates | `order_id`, `customer_id`, `order_status`, `order_purchase_timestamp` |
| `olist_order_items_dataset` | Items purchased in each order | `order_id`, `product_id`, `seller_id`, `price`, `freight_value` |
| `olist_customers_dataset` | Customer records and geographic location | `customer_id`, `customer_unique_id`, `customer_state`, `customer_city` |
| `olist_products_dataset` | Product details and categories | `product_id`, `product_category_name` |

Other tables are present in the database, including payments, reviews, sellers, geolocation, and category translations. They were not required for the main analyses documented in this project.

## Important Columns

### Orders
- `order_id`: Identifier for an order.
- `customer_id`: Identifier linking an order to a customer record.
- `order_status`: Recorded order status.
- `order_purchase_timestamp`: Timestamp when the order was placed.

### Order Items
- `order_id`: Links an item row to its order.
- `product_id`: Links an item to its product.
- `price`: Recorded item price. Stored as PostgreSQL `real` in this database and cast to `numeric` for financial calculations.
- `freight_value`: Recorded freight charge; excluded from merchandise-sales calculations.

### Customers
- `customer_id`: Identifier for a customer record.
- `customer_unique_id`: Identifier used to recognize the same customer across records.
- `customer_state`: Brazilian state abbreviation associated with the customer record.

### Products
- `product_id`: Identifier for a product.
- `product_category_name`: Original product category label. Blank labels are grouped as `Unknown` in category analysis.

## Derived Metrics

| Metric | Definition |
|---|---|
| Merchandise sales | Sum of item `price` for delivered orders |
| Delivered orders | Number of distinct orders with status `delivered` |
| Items sold | Number of order-item rows associated with delivered orders |
| Unique delivered customers | Count of distinct `customer_unique_id` values among delivered orders |
| Repeat customer | Unique customer with more than one distinct delivered order |
| Repeat-purchase rate | Repeat customers divided by total unique delivered customers, multiplied by 100 |
| Average sales per customer | Total observed merchandise sales for a segment divided by the number of customers in that segment |

## Notes

- Table relationships are established using the relevant identifiers.
- Customer-level analyses use `customer_unique_id`, not only `customer_id`.
- Merchandise sales exclude freight charges, payment fees, and other costs.
- Category names are retained in their original form in the SQL output, except blank labels, which are standardized to `Unknown`.
