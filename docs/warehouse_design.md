# Warehouse Design

This document describes the planned analytical data warehouse layer for the Brazilian E-Commerce project.

## Goal

The goal of the warehouse layer is to transform raw staging data into tables that are easier to use for reporting and analysis.

The staging layer keeps data close to the original CSV structure, while the warehouse layer should provide a cleaner business-oriented model.

## Planned Schema

The warehouse tables will be created in a separate schema:

| Schema | Purpose |
|---|---|
| `dw` | Analytical data warehouse tables |

## Planned Dimensions

Dimensions describe business entities used for filtering, grouping, and reporting.

| Dimension | Source Tables | Description |
|---|---|---|
| `dw.dim_customers` | `stg.customers` | Customer location and customer identifiers |
| `dw.dim_products` | `stg.products`, `stg.product_category_name_translation` | Product attributes and translated category names |
| `dw.dim_sellers` | `stg.sellers` | Seller location and seller identifiers |
| `dw.dim_date` | `stg.orders` | Calendar attributes based on order dates |

## Planned Fact Tables

Fact tables contain measurable business events.

| Fact Table | Source Tables | Grain | Measures |
|---|---|---|---|
| `dw.fact_order_items` | `stg.orders`, `stg.order_items`, `stg.order_payments` | One row per order item | Price, freight value, payment value |
| `dw.fact_orders` | `stg.orders`, `stg.order_payments` | One row per order | Order count, payment value |

## Initial Modeling Decision

The main analytical fact table will be `dw.fact_order_items`.

This table is useful because it keeps product-level detail and supports analysis such as:

- revenue by product category
- revenue by seller
- freight cost by state
- orders over time
- average order item value

## Known Considerations

The `stg.order_reviews` table is not included in the first warehouse version because it was not imported during the initial staging load.

Product categories without English translation will be handled during product dimension creation by using a fallback value.

## Star Schema Explanation

The warehouse layer follows a star schema idea.

In this model, dimension tables describe business entities, while fact tables store business events and numeric measures.

The main planned fact table is `dw.fact_order_items`.

One row in `dw.fact_order_items` will represent one product item within one order.

The surrounding dimension tables answer descriptive questions:

| Question | Dimension |
|---|---|
| Who bought the item? | `dw.dim_customers` |
| What product was bought? | `dw.dim_products` |
| Who sold the item? | `dw.dim_sellers` |
| When was the item ordered? | `dw.dim_date` |

The fact table will store keys that point to these dimensions, together with numeric measures such as `price` and `freight_value`.

Simple model:

```text
                 dw.dim_date
                     |
dw.dim_customers -- dw.fact_order_items -- dw.dim_products
                     |
                dw.dim_sellers
```

This structure makes analytical queries easier, for example:

- revenue by product category
- revenue by customer state
- revenue by seller state
- revenue by month or year

## Known Considerations

The `stg.order_reviews` table is not included in the first warehouse version because it was not imported during the initial staging load.

Product categories without English translation are handled during product dimension loading by using the original category name as a fallback value.