-- If this fails: it means some reocrds in `shares`, `market_value`, `weight` are non-negative

SELECT date, fund, shares, market_value, weight
FROM {{ source('dbt_ark', 'ARK_DAILY_SS') }}
-- weird thing weight could be zero sometimes, maybe round down due to small number
WHERE shares < 0 OR market_value < 0 OR weight < 0