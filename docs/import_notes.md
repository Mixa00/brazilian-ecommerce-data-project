# Import Notes

This document tracks notes and issues discovered during the raw CSV import into SQL Server staging tables.

## Import Method

Most raw CSV files are imported into SQL Server staging tables using `BULK INSERT`.

Bulk insert script: `sql/04_bulk_insert_staging.sql`

## Imported Tables

The following staging tables were successfully imported:

| Table | Rows |
|---|---:|
| stg.customers | 99,441 |
| stg.orders | 99,441 |
| stg.order_items | 112,650 |
| stg.order_payments | 103,886 |
| stg.products | 32,951 |
| stg.sellers | 3,095 |
| stg.product_category_name_translation | 71 |
| stg.geolocation | 1,000,163 |

## Pending Import

| Table | Status |
|---|---|
| stg.order_reviews | Pending |

## Known Issue: order_reviews CSV

The `olist_order_reviews_dataset.csv` file contains customer review comments with commas, special characters, and multiline text values.

Initial `BULK INSERT` attempts failed for this file with an OLE DB provider error.

Because of this, `stg.order_reviews` is currently left empty and will be handled later with a more robust import approach, likely using a C# ETL helper application.

## Current Validation Result

Row count validation script: `sql/05_validate_staging_counts.sql`

Current expected result:

| Table | Rows |
|---|---:|
| stg.customers | 99,441 |
| stg.geolocation | 1,000,163 |
| stg.order_items | 112,650 |
| stg.order_payments | 103,886 |
| stg.order_reviews | 0 |
| stg.orders | 99,441 |
| stg.product_category_name_translation | 71 |
| stg.products | 32,951 |
| stg.sellers | 3,095 |