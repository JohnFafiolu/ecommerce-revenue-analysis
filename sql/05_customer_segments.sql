
-- PROJECT: Olist E-commerce Revenue Analysis
-- SCRIPT: 05_customer_segments.sql
-- PURPOSE: Compare merchandise sales from one-time and repeat customers.

WITH delivered_order_sales AS (
    SELECT
        o.order_id,
        o.customer_id,
        SUM(i.price) AS order_sales
    FROM public.olist_orders_dataset AS o
    JOIN public.olist_order_items_dataset AS i
        ON o.order_id = i.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY o.order_id, o.customer_id
),

customer_sales AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT dos.order_id) AS delivered_orders,
        SUM(dos.order_sales) AS total_sales
    FROM delivered_order_sales AS dos
    JOIN public.olist_customers_dataset AS c
        ON dos.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
),

customer_segments AS (
    SELECT
        customer_unique_id,
        delivered_orders,
        total_sales,
        CASE
            WHEN delivered_orders > 1 THEN 'Repeat customer'
            ELSE 'One-time customer'
        END AS customer_type
    FROM customer_sales
)

SELECT
    customer_type,
    COUNT(*) AS total_customers,
    SUM(delivered_orders) AS delivered_orders,
    ROUND(SUM(total_sales)::numeric, 2) AS merchandise_sales,
    ROUND(AVG(total_sales)::numeric, 2) AS average_sales_per_customer
FROM customer_segments
GROUP BY customer_type
ORDER BY merchandise_sales DESC;
