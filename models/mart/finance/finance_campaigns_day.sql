select 
date_date,
round(operational_margin - ads_cost,2) as ads_margin,
average_basket,
operational_margin,
ads_cost

from {{ ref('finance_days') }}
join {{ ref('int_campaigns_day') }}
using (date_date)

order by date_date desc
