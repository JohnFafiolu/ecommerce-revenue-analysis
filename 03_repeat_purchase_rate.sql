
-- PROJECT: Olist E-commerce Revenue Analysis
-- SCRIPT: 03_repeat_purchase_rate.sql
-- PURPOSE: Calculate the repeat-customer rate among customers
-- with at least one delivered order.

WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS delivered_order_count
    FROM public.olist_orders_dataset AS o
    JOIN public.olist_customers_dataset AS c
        ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
),

customer_summary AS (
    SELECT
        customer_unique_id,
        delivered_order_count,
        CASE
            WHEN delivered_order_count > 1 THEN 'Repeat customer'
            ELSE 'One-time customer'
        END AS customer_type
    FROM customer_orders
)

SELECT
    COUNT(*) AS total_unique_customers,

    COUNT(*) FILTER (
        WHERE customer_type = 'Repeat customer'
    ) AS repeat_customers,

    COUNT(*) FILTER (
        WHERE customer_type = 'One-time customer'
    ) AS one_time_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE customer_type = 'Repeat customer'
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS repeat_customer_rate_pct

FROM customer_summary;
