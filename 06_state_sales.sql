
SELECT
    c.customer_state,
    COUNT(DISTINCT c.customer_unique_id) AS customers,
    COUNT(DISTINCT o.order_id) AS delivered_orders,
    ROUND(SUM(i.price::numeric), 2) AS merchandise_sales
FROM public.olist_orders_dataset AS o
JOIN public.olist_order_items_dataset AS i
    ON o.order_id = i.order_id
JOIN public.olist_customers_dataset AS c
    ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY merchandise_sales DESC;
