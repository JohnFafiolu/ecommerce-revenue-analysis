
-- PROJECT: Olist E-commerce Revenue Analysis
-- SCRIPT: 02_category_sales.sql
-- PURPOSE: Rank product categories by merchandise sales.

SELECT
    COALESCE(
        NULLIF(TRIM(p.product_category_name), ''),
        'Unknown'
    ) AS product_category,

    COUNT(DISTINCT o.order_id) AS delivered_orders,

    COUNT(*) AS items_sold,

    ROUND(SUM(i.price)::numeric, 2) AS merchandise_sales

FROM public.olist_orders_dataset AS o

JOIN public.olist_order_items_dataset AS i
    ON o.order_id = i.order_id

JOIN public.olist_products_dataset AS p
    ON i.product_id = p.product_id

WHERE o.order_status = 'delivered'

GROUP BY
    COALESCE(
        NULLIF(TRIM(p.product_category_name), ''),
        'Unknown'
    )

ORDER BY merchandise_sales DESC;
