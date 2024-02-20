select 
    orders_id,
    date_date,
    revenue,
    quantity,
    purchase_cost,
    margin

    from {{ ref('int_sales_margin') }}


