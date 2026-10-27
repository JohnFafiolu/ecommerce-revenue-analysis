
-- PROJECT: Olist E-commerce Revenue Analysis
-- SCRIPT: 04_customer_cohorts.sql
-- PURPOSE: Measure repeat purchasing by first delivered-order month.

WITH delivered_orders AS (
    SELECT
        c.customer_unique_id,
        o.order_id,
        o.order_purchase_timestamp::timestamp AS order_date
    FROM public.olist_orders_dataset AS o
    JOIN public.olist_customers_dataset AS c
        ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
),

customer_cohorts AS (
    SELECT
        customer_unique_id,
        DATE_TRUNC('month', MIN(order_date))::date AS cohort_month
    FROM delivered_orders
    GROUP BY customer_unique_id
),

customer_order_counts AS (
    SELECT
        customer_unique_id,
        COUNT(DISTINCT order_id) AS delivered_order_count
    FROM delivered_orders
    GROUP BY customer_unique_id
)

SELECT
    cc.cohort_month,
    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE coc.delivered_order_count > 1
    ) AS repeat_customers,

    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE coc.delivered_order_count > 1
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS repeat_customer_rate_pct

FROM customer_cohorts AS cc
JOIN customer_order_counts AS coc
    ON cc.customer_unique_id = coc.customer_unique_id

GROUP BY cc.cohort_month
ORDER BY cc.cohort_month;
