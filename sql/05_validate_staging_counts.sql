USE BrazilianECommerce;
GO

SELECT 'stg.customers' AS table_name, COUNT(*) AS row_count FROM stg.customers
UNION ALL
SELECT 'stg.orders', COUNT(*) FROM stg.orders
UNION ALL
SELECT 'stg.order_items', COUNT(*) FROM stg.order_items
UNION ALL
SELECT 'stg.order_payments', COUNT(*) FROM stg.order_payments
UNION ALL
SELECT 'stg.order_reviews', COUNT(*) FROM stg.order_reviews
UNION ALL
SELECT 'stg.products', COUNT(*) FROM stg.products
UNION ALL
SELECT 'stg.sellers', COUNT(*) FROM stg.sellers
UNION ALL
SELECT 'stg.product_category_name_translation', COUNT(*) FROM stg.product_category_name_translation
UNION ALL
SELECT 'stg.geolocation', COUNT(*) FROM stg.geolocation
ORDER BY table_name;
GO