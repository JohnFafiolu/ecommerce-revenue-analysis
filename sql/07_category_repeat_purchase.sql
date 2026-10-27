
WITH customer_category_orders AS (
    SELECT DISTINCT
        c.customer_unique_id,
        COALESCE(
            NULLIF(TRIM(p.product_category_name), ''),
            'Unknown'
        ) AS product_category,
        o.order_id
    FROM public.olist_orders_dataset AS o
    JOIN public.olist_order_items_dataset AS i
        ON o.order_id = i.order_id
    JOIN public.olist_customers_dataset AS c
        ON o.customer_id = c.customer_id
    JOIN public.olist_products_dataset AS p
        ON i.product_id = p.product_id
    WHERE o.order_status = 'delivered'
),
category_customer_counts AS (
    SELECT
        product_category,
        customer_unique_id,
        COUNT(DISTINCT order_id) AS category_orders
    FROM customer_category_orders
    GROUP BY product_category, customer_unique_id
)
SELECT
    product_category,
    COUNT(*) AS customers,
    COUNT(*) FILTER (
        WHERE category_orders > 1
    ) AS repeat_customers,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE category_orders > 1
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS repeat_purchase_rate_pct
FROM category_customer_counts
GROUP BY product_category
ORDER BY repeat_purchase_rate_pct DESC, customers DESC;
