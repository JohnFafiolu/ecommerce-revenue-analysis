
-- PROJECT: Olist E-commerce Revenue Analysis
-- SCRIPT: 01_monthly_sales.sql
-- PURPOSE: Calculate monthly merchandise sales for delivered orders.

SELECT
    DATE_TRUNC(
        'month',
        o.order_purchase_timestamp::timestamp
    )::date AS order_month,

    COUNT(DISTINCT o.order_id) AS delivered_orders,

    COUNT(*) AS items_sold,

    ROUND(SUM(i.price)::numeric, 2) AS merchandise_sales

FROM public.olist_orders_dataset AS o

JOIN public.olist_order_items_dataset AS i
    ON o.order_id = i.order_id

WHERE o.order_status = 'delivered'

GROUP BY DATE_TRUNC(
    'month',
    o.order_purchase_timestamp::timestamp
)

ORDER BY order_month;
