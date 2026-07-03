# Analytics Notes

This document describes the initial analytical queries created for the warehouse model.

The queries use `dw.fact_order_items` as the main fact table and join it with dimension tables for descriptive attributes.

## Revenue by Product Category

Business question:
Which product categories generated the highest revenue?

Tables used:
- `dw.fact_order_items`
- `dw.dim_products`

Result:
Shows total revenue, total freight value, and number of sold order items for each product category.

## Revenue by Customer State

Business question:
Which customer states generated the highest revenue?

Tables used:
- `dw.fact_order_items`
- `dw.dim_customers`

Result:
Shows total revenue, total freight value, and number of sold order items grouped by customer state.

## Revenue by Month

Business question:
How did revenue change over time by year and month?

Tables used:
- `dw.fact_order_items`
- `dw.dim_date`

Result:
Shows monthly revenue, freight value, and number of sold order items.

## Revenue by Seller State

Business question:
Which seller states generated the highest revenue?

Tables used:
- `dw.fact_order_items`
- `dw.dim_sellers`

Result:
Shows total revenue, total freight value, and number of sold order items grouped by seller state.

## Top Categories by Average Item Value

Business question:
Which product categories have the highest average sold item price?

Tables used:
- `dw.fact_order_items`
- `dw.dim_products`

Result:
Shows the top product categories by average item price, including total revenue and number of sold order items. Only categories with at least 50 sold items are included.

## Freight to Revenue by Product Category

Business question:
Which product categories have the highest freight cost compared to product revenue?

Tables used:
- `dw.fact_order_items`
- `dw.dim_products`

Result:
Shows total revenue, total freight value, and freight as a percentage of revenue for each product category. Only categories with at least 50 sold items are included.

## Top Sellers by Revenue

Business question:
Which sellers generated the highest revenue?

Tables used:
- `dw.fact_order_items`
- `dw.dim_sellers`

Result:
Shows the top sellers by total product revenue, including seller state, number of sold order items, total revenue, and total freight value.