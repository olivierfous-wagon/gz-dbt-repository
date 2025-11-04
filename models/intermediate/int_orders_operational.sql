WITH part1 AS

(
SELECT
*
FROM {{ ref('int_orders_margin') }}
INNER JOIN {{ ref('stg_raw__ship') }}
USING (orders_id)
)

,part2 AS
(
SELECT
*,
ROUND((margin+shipping_fee-logcost-ship_cost),2) AS Operational_margin
FROM part1
)


SELECT
    orders_id,
    date_date,
    SUM(revenue) AS total_revenue,
    SUM(quantity) AS total_quantity,
    SUM(purchase_cost) AS total_purchase_cost,
    SUM(margin) AS total_margin,
    SUM(shipping_fee) AS total_shipping_fee,
    SUM(logcost) AS total_logcost,
    SUM(ship_cost) AS total_ship_cost,
    SUM(operational_margin) AS total_operational_margin
FROM part2
GROUP BY date_date, orders_id
ORDER BY date_date