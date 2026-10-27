
-- PROJECT: Olist E-commerce Revenue Analysis
-- SCRIPT: 00_data_validation.sql
-- PURPOSE: Check table sizes, data quality, and join integrity.

-- 1. Check row counts for all imported tables
SELECT 'orders' AS table_name, COUNT(*) AS row_count
FROM public.olist_orders_dataset

UNION ALL
SELECT 'order_items', COUNT(*)
FROM public.olist_order_items_dataset

UNION ALL
SELECT 'payments', COUNT(*)
FROM public.olist_order_payments_dataset

UNION ALL
SELECT 'reviews', COUNT(*)
FROM public.olist_order_reviews_dataset

UNION ALL
SELECT 'customers', COUNT(*)
FROM public.olist_customers_dataset

UNION ALL
SELECT 'products', COUNT(*)
FROM public.olist_products_dataset

UNION ALL
SELECT 'sellers', COUNT(*)
FROM public.olist_sellers_dataset

UNION ALL
SELECT 'geolocation', COUNT(*)
FROM public.olist_geolocation_dataset

UNION ALL
SELECT 'category_translation', COUNT(*)
FROM public.product_category_name_translation;


-- 2. Check order status counts
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM public.olist_orders_dataset
GROUP BY order_status
ORDER BY total_orders DESC;


-- 3. Check the date range of orders
SELECT
    MIN(order_purchase_timestamp::timestamp) AS first_order_date,
    MAX(order_purchase_timestamp::timestamp) AS last_order_date,
    COUNT(*) AS total_orders
FROM public.olist_orders_dataset;


-- 4. Check duplicate order IDs
SELECT
    order_id,
    COUNT(*) AS occurrences
FROM public.olist_orders_dataset
GROUP BY order_id
HAVING COUNT(*) > 1;


-- 5. Check duplicate customer IDs in the customer table
SELECT
    customer_id,
    COUNT(*) AS occurrences
FROM public.olist_customers_dataset
GROUP BY customer_id
HAVING COUNT(*) > 1;


-- 6. Check missing key values in orders
SELECT
    COUNT(*) FILTER (WHERE order_id IS NULL) AS missing_order_id,
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_customer_id,
    COUNT(*) FILTER (WHERE order_status IS NULL) AS missing_order_status,
    COUNT(*) FILTER (
        WHERE order_purchase_timestamp IS NULL
    ) AS missing_purchase_timestamp
FROM public.olist_orders_dataset;


-- 7. Check missing customer unique IDs
SELECT
    COUNT(*) FILTER (
        WHERE customer_unique_id IS NULL
           OR TRIM(customer_unique_id) = ''
    ) AS missing_or_blank_unique_ids
FROM public.olist_customers_dataset;


-- 8. Check missing or blank product categories
SELECT
    COUNT(*) FILTER (
        WHERE product_category_name IS NULL
    ) AS missing_categories,
    COUNT(*) FILTER (
        WHERE product_category_name IS NOT NULL
          AND TRIM(product_category_name) = ''
    ) AS blank_categories
FROM public.olist_products_dataset;


-- 9. Check whether order items have matching orders
SELECT COUNT(*) AS items_without_matching_orders
FROM public.olist_order_items_dataset AS i
LEFT JOIN public.olist_orders_dataset AS o
    ON i.order_id = o.order_id
WHERE o.order_id IS NULL;


-- 10. Check whether orders have matching customer records
SELECT COUNT(*) AS orders_without_matching_customers
FROM public.olist_orders_dataset AS o
LEFT JOIN public.olist_customers_dataset AS c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- 11. Check whether order items have matching products
SELECT COUNT(*) AS items_without_matching_products
FROM public.olist_order_items_dataset AS i
LEFT JOIN public.olist_products_dataset AS p
    ON i.product_id = p.product_id
WHERE p.product_id IS NULL;


-- 12. Establish the delivered merchandise sales baseline
SELECT
    COUNT(*) AS delivered_item_rows,
    ROUND(SUM(i.price)::numeric, 2) AS merchandise_sales
FROM public.olist_orders_dataset AS o
JOIN public.olist_order_items_dataset AS i
    ON o.order_id = i.order_id
WHERE o.order_status = 'delivered';
