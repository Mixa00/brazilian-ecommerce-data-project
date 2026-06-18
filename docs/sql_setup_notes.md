# SQL Setup Notes

This document describes the initial SQL Server setup for the project.

## Scripts

The SQL scripts should be executed in this order:

1. `sql/01_create_database.sql`
2. `sql/02_create_staging_schema.sql`
3. `sql/03_create_staging_tables.sql`

## Database

Database name: `BrazilianECommerce`

## Schemas

| Schema | Purpose |
|---|---|
| stg | Staging tables for raw CSV imports |

## Staging Tables

| Table | Source CSV |
|---|---|
| stg.customers | olist_customers_dataset.csv |
| stg.geolocation | olist_geolocation_dataset.csv |
| stg.orders | olist_orders_dataset.csv |
| stg.order_items | olist_order_items_dataset.csv |
| stg.order_payments | olist_order_payments_dataset.csv |
| stg.order_reviews | olist_order_reviews_dataset.csv |
| stg.products | olist_products_dataset.csv |
| stg.sellers | olist_sellers_dataset.csv |
| stg.product_category_name_translation | product_category_name_translation.csv |

## Notes

- Staging tables are designed to stay close to the raw CSV structure.
- Data cleaning and corrected column names will be handled later in cleaned tables or views.
- Raw CSV files are stored locally and are not committed to Git.