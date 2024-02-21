WITH source AS (
    SELECT * FROM {{ ref('stg_raw__product') }}
    JOIN {{ ref('stg_raw__sales') }} USING (products_id)
),

margintable as 
(

SELECT 
    *,
        {{ margin('revenue', 'purchase_price', 'quantity') }} AS margin,
    ROUND(CAST(purchase_price AS FLOAT64) * quantity, 2) AS purchase_cost


FROM source
)

SELECT
    *,
    {{ margin_percent('margin', 'revenue') }} AS margin_percent

FROM margintable