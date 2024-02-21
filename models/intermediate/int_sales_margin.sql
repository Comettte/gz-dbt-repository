with 

source as (

    select * from {{ ref('stg_raw__product')}}
    join {{ ref('stg_raw__sales')}} 
    using (products_id)

)

select
    *,
    round(revenue - CAST(purchase_price as FLOAT64)*quantity,2) as margin,
    round(CAST(purchase_price as FLOAT64) * quantity,2) as purchase_cost

    from source


