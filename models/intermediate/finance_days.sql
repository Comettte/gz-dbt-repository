{{ config(materialized='table') }}

select 
date_date,
count(orders_id) as nb_transactions,
round(sum(revenue),2) as revenue,
round(sum(revenue)/count(orders_id),2) as average_basket,
round(sum(margin),2) as margin,
round(sum(operationnal_margin),2) as operational_margin


from {{ ref('int_orders_operational') }}

group by date_date

