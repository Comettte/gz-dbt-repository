select 
date_date,
round(sum(operational_margin) - sum(ads_cost),2) as ads_margin,
sum(average_basket) as average_basket,
sum(operational_margin) as operational_margin,
sum(ads_cost) as ads_cost


from {{ ref('finance_days') }}
join {{ ref('int_campaigns_day') }}
using (date_date)

group by date_date

