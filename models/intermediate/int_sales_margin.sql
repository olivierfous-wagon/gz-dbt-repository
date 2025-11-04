WITH part1 AS

(
SELECT 
products_id
,purchase_price
,date_date
,orders_id
,revenue
,quantity
FROM {{ ref('stg_raw__product') }} AS product
INNER JOIN {{ ref('stg_raw__sales') }} AS sales
ON product.products_id = sales.pdt_id
)

,part2 AS

(
SELECT
products_id
,purchase_price
,date_date
,orders_id
,revenue
,quantity
,quantity*purchase_price AS purchase_cost

FROM part1
)

SELECT
products_id
,purchase_price
,date_date
,orders_id
,revenue
,quantity
,purchase_cost
,ROUND((revenue-purchase_cost),2) AS margin

FROM part2