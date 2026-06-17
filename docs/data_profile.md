# Data Profile

This document contains initial profiling notes for the raw CSV files.

## Row Counts

Row counts below exclude the header row.

| File | Rows |
|---|---:|
| olist_customers_dataset.csv | 99,441 |
| olist_geolocation_dataset.csv | 1,000,163 |
| olist_order_items_dataset.csv | 112,650 |
| olist_order_payments_dataset.csv | 103,886 |
| olist_order_reviews_dataset.csv | 104,719 |
| olist_orders_dataset.csv | 99,441 |
| olist_products_dataset.csv | 32,951 |
| olist_sellers_dataset.csv | 3,095 |
| product_category_name_translation.csv | 70 |

## Initial Observations

- The geolocation file is the largest raw file by row count.
- The customers and orders files have the same number of data rows.
- Order items, payments, and reviews can have multiple rows per order.
- The category translation file is small and can be treated as a lookup table.