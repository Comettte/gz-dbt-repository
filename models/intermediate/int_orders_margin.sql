select 
orders_id,
date_date,
round(sum(revenue),2) as revenue,
round(sum(purchase_cost),2) as purchase_cost,
sum(quantity) as quantity,
round(sum(margin),2) as margin

from {{ ref('int_sales_margin') }}
    
group by orders_id, date_date

