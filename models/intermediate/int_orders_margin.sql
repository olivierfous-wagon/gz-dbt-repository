    SELECT
        orders_id,
        date_date,
        ROUND(SUM(revenue),2) AS revenue,
        SUM(quantity) AS quantity
        ROUND(SUM(quantity * purchase_price),2) AS purchase_cost,
        ROUND(SUM(revenue - (quantity * purchase_price)),2) AS margin,
    FROM {{ ref('int_sales_margin') }}
    WHERE date_date = '2021-09-30'
    AND orders_id IN(1002561, 1002560, 1002559)
    GROUP BY orders_id, date_date