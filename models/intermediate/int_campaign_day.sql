SELECT
date_date
-- ,CONCAT(date_date, "-",campaign_key) AS campaign_key
,SUM(ads_cost) AS ads_cost
,SUM(impression) AS impression
,SUM (click) AS click
FROM {{ ref('int_campaigns') }}
GROUP BY date_date
ORDER BY date_date DESC