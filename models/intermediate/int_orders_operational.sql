select 
*,
    round(margin + shipping_fee - logcost - CAST(ship_cost as FLOAT64),2) as operationnal_margin

from {{ ref('int_orders_margin') }}
join {{ ref('stg_raw__ship') }}
    using (orders_id)

order by orders_id desc