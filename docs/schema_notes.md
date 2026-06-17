# Schema Notes

This document lists the columns found in each raw CSV file. These notes will be used later to design SQL Server staging tables.

## Raw CSV Columns

### olist_customers_dataset.csv

- customer_id
- customer_unique_id
- customer_zip_code_prefix
- customer_city
- customer_state

### olist_geolocation_dataset.csv

- geolocation_zip_code_prefix
- geolocation_lat
- geolocation_lng
- geolocation_city
- geolocation_state

### olist_orders_dataset.csv

- order_id
- customer_id
- order_status
- order_purchase_timestamp
- order_approved_at
- order_delivered_carrier_date
- order_delivered_customer_date
- order_estimated_delivery_date

### olist_order_items_dataset.csv

- order_id
- order_item_id
- product_id
- seller_id
- shipping_limit_date
- price
- freight_value

### olist_order_payments_dataset.csv

- order_id
- payment_sequential
- payment_type
- payment_installments
- payment_value

### olist_order_reviews_dataset.csv

- review_id
- order_id
- review_score
- review_comment_title
- review_comment_message
- review_creation_date
- review_answer_timestamp

### olist_products_dataset.csv

- product_id
- product_category_name
- product_name_lenght
- product_description_lenght
- product_photos_qty
- product_weight_g
- product_length_cm
- product_height_cm
- product_width_cm

### olist_sellers_dataset.csv

- seller_id
- seller_zip_code_prefix
- seller_city
- seller_state

### product_category_name_translation.csv

- product_category_name
- product_category_name_english

## Initial Relationship Notes

- `orders.customer_id` connects orders to customers.
- `order_items.order_id` connects order items to orders.
- `order_items.product_id` connects order items to products.
- `order_items.seller_id` connects order items to sellers.
- `order_payments.order_id` connects payments to orders.
- `order_reviews.order_id` connects reviews to orders.
- `products.product_category_name` connects products to category translations.