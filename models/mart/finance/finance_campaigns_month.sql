SELECT
    FORMAT_DATE('%B', date) AS month_date,
    ROUND(SUM(ads_margin)) AS ads_margin,
    ROUND(AVG(average_basket)) AS average_basket,
    ROUND(SUM(total_number_of_transactions)) AS total_number_of_transactions,
    ROUND(SUM(operational_margin)) AS operational_margin,
    ROUND(SUM(total_revenue)) AS total_revenue,
    ROUND(SUM(total_purchase_cost)) AS total_purchase_cost,
    ROUND(SUM(total_shipping_fee)) AS total_shipping_fee,
    ROUND(SUM(total_logcost)) AS total_logcost,
    ROUND(SUM(total_number_of_products_sold)) AS total_number_of_products_sold,
    ROUND(SUM(ads_cost)) AS ads_cost,
    ROUND(SUM(impression)) AS impression,
    ROUND(SUM(click)) AS click
FROM {{ ref('finance_campaigns_day') }}
GROUP BY month_date
ORDER BY month_date ASC