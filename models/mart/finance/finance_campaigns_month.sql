select 
concat(extract(year from date_date),"-0",extract(month from date_date)) as date_month,
round(sum(operational_margin) - sum(ads_cost),2) as ads_margin,
round(sum(average_basket),2) as average_basket,
round(sum(operational_margin),2) as operational_margin,
round(sum(ads_cost),2) as ads_cost


from {{ ref('finance_campaigns_day') }}

group by date_month

order by date_month ASC
