# Data Quality Notes

This document summarizes initial data quality checks performed on the staging tables.

## Scope

The checks were performed on staging tables in the `stg` schema after CSV import.

The `stg.order_reviews` table is currently excluded because the CSV import was skipped due to free-text and multiline parsing issues.

## Duplicate Checks

Duplicate checks were performed for the main identifier columns and composite keys.

No duplicates were found for:

| Table | Key |
|---|---|
| `stg.customers` | `customer_id` |
| `stg.orders` | `order_id` |
| `stg.products` | `product_id` |
| `stg.sellers` | `seller_id` |
| `stg.product_category_name_translation` | `product_category_name` |
| `stg.order_items` | `order_id`, `order_item_id` |
| `stg.order_payments` | `order_id`, `payment_sequential` |

## Null Checks

Null checks were performed for key columns used in joins and later transformations.

No null values were found in the checked key columns.

## Referential Integrity Checks

The following relationships were checked:

| Source | Target | Result |
|---|---|---|
| `stg.orders.customer_id` | `stg.customers.customer_id` | OK |
| `stg.order_items.order_id` | `stg.orders.order_id` | OK |
| `stg.order_items.product_id` | `stg.products.product_id` | OK |
| `stg.order_items.seller_id` | `stg.sellers.seller_id` | OK |
| `stg.order_payments.order_id` | `stg.orders.order_id` | OK |

## Known Findings

Two product categories exist in `stg.products` but do not have an English translation in `stg.product_category_name_translation`:

| Product Category |
|---|
| `pc_gamer` |
| `portateis_cozinha_e_preparadores_de_alimentos` |

This is not treated as an import error. It will be handled later during transformation, either by using the original category name as fallback or by adding a manual translation rule.

## Known Limitations

The `stg.order_reviews` table currently contains 0 rows because the raw CSV file has free-text review fields that caused parsing issues during bulk import.

This table can be imported later with a more robust ETL approach, for example using C# CSV parsing.