USE BrazilianECommerce;
GO

-- Unique customer_id in customers
SELECT
	customer_id,
	COUNT(*) AS duplicate_count
FROM
	stg.customers
GROUP BY
	customer_id
HAVING
	COUNT(*) > 1;
GO

-- Unique order_id in orders
SELECT
	order_id,
	COUNT(*) AS duplicate_count
FROM
	stg.orders
GROUP BY
	order_id
HAVING
	COUNT(*) > 1;
GO

-- Duplicate product_id values
SELECT 
    product_id,
    COUNT(*) AS duplicate_count
FROM stg.products
GROUP BY product_id
HAVING COUNT(*) > 1;
GO

-- Duplicate seller_id values
SELECT 
    seller_id,
    COUNT(*) AS duplicate_count
FROM stg.sellers
GROUP BY seller_id
HAVING COUNT(*) > 1;
GO

-- Duplicate product category translation values
SELECT 
    product_category_name,
    COUNT(*) AS duplicate_count
FROM stg.product_category_name_translation
GROUP BY product_category_name
HAVING COUNT(*) > 1;
GO

-- Duplicate order item keys
SELECT 
    order_id,
    order_item_id,
    COUNT(*) AS duplicate_count
FROM stg.order_items
GROUP BY order_id, order_item_id
HAVING COUNT(*) > 1;
GO

-- Duplicate order payment keys
SELECT 
    order_id,
    payment_sequential,
    COUNT(*) AS duplicate_count
FROM stg.order_payments
GROUP BY order_id, payment_sequential
HAVING COUNT(*) > 1;
GO

-- NULL values in key columns
SELECT 'stg.customers.customer_id' AS check_name, COUNT(*) AS null_count
FROM stg.customers
WHERE customer_id IS NULL

UNION ALL

SELECT 'stg.orders.order_id', COUNT(*)
FROM stg.orders
WHERE order_id IS NULL

UNION ALL

SELECT 'stg.orders.customer_id', COUNT(*)
FROM stg.orders
WHERE customer_id IS NULL

UNION ALL

SELECT 'stg.products.product_id', COUNT(*)
FROM stg.products
WHERE product_id IS NULL

UNION ALL

SELECT 'stg.sellers.seller_id', COUNT(*)
FROM stg.sellers
WHERE seller_id IS NULL

UNION ALL

SELECT 'stg.order_items.order_id', COUNT(*)
FROM stg.order_items
WHERE order_id IS NULL

UNION ALL

SELECT 'stg.order_items.order_item_id', COUNT(*)
FROM stg.order_items
WHERE order_item_id IS NULL

UNION ALL

SELECT 'stg.order_items.product_id', COUNT(*)
FROM stg.order_items
WHERE product_id IS NULL

UNION ALL

SELECT 'stg.order_items.seller_id', COUNT(*)
FROM stg.order_items
WHERE seller_id IS NULL

UNION ALL

SELECT 'stg.order_payments.order_id', COUNT(*)
FROM stg.order_payments
WHERE order_id IS NULL

UNION ALL

SELECT 'stg.order_payments.payment_sequential', COUNT(*)
FROM stg.order_payments
WHERE payment_sequential IS NULL;
GO