WITH part1 AS (
    SELECT 
        date_date,
        COUNT(orders_id) AS total_number_of_transactions,
        SUM(total_revenue) AS total_revenue,
        SUM(total_operational_margin) AS operational_margin,
        SUM(total_purchase_cost) AS total_purchase_cost,
        SUM(total_shipping_fee) AS total_shipping_fee,
        SUM(total_logcost) AS total_logcost,
        SUM(total_quantity) AS total_number_of_products_sold
    FROM {{ ref('int_orders_operational') }}
    GROUP BY date_date
)

SELECT
    date_date,
    ROUND(total_number_of_transactions, 2) AS total_number_of_transactions,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(operational_margin, 2) AS operational_margin,
    ROUND(total_purchase_cost, 2) AS total_purchase_cost,
    ROUND(total_shipping_fee, 2) AS total_shipping_fee,
    ROUND(total_logcost, 2) AS total_logcost,
    ROUND(total_number_of_products_sold, 2) AS total_number_of_products_sold,
    ROUND(total_revenue / NULLIF(total_number_of_transactions, 0), 2) AS average_basket
FROM part1
ORDER BY date_date

