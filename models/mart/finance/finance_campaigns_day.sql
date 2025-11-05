{{ config(materialized='view')}}

WITH part1 AS
(
SELECT *
FROM {{ ref('finance_days') }}
INNER JOIN {{ ref('int_campaign_day') }}
USING (date_date)
)

SELECT
date_date AS date
,ROUND((operational_margin-ads_cost),2) AS ads_margin
,average_basket
,total_number_of_transactions
,operational_margin
,total_revenue
,total_purchase_cost
,total_shipping_fee
,total_logcost
,total_number_of_products_sold
,ads_cost
,impression
,click
FROM part1
