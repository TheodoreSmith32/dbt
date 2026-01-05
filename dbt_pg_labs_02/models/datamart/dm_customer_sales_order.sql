with fact_order as (

    select
       *
    from  {{ref('fact_orders')}}

)
,
dim_customer as (

    select * 
    from {{ref('dim_customers')}}
    where has_phone = 'Y'

)

select
    format_datetime(current_timestamp, 'yyyyMMdd') as report_date,
    f.customer_id,
    d.customer_name,


    count(distinct f.order_id)        as order_count,
    sum(f.quantity)                   as total_quantity,
    avg(f.unit_price)                 as avg_unit_price,
    sum(f.gross_amount)               as total_gross_amount,
    sum(f.net_revenue)                as total_net_revenue,
    format_datetime(current_timestamp, 'yyyy-MM-dd HH:mm:ss') as updated_at
from fact_order f
left join dim_customer d
    on f.customer_id = d.customer_id
group by
    f.customer_id,
    d.customer_name