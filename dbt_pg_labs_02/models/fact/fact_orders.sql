with orders as (
SELECT * FROM 
{{ source('dbt_pg_labs_02', 'orders') }}
),
order_details as 
(
SELECT * FROM 
{{ source('dbt_pg_labs_02', 'order_details') }}
)


select
    o.order_id,
    o.order_date,
    o.ship_country,
    o.customer_id,
    od.product_id,
    od.unit_price,
    od.quantity,
    od.discount,
    (od.unit_price * od.quantity) as gross_amount,
    (od.unit_price * od.quantity) * (1 - od.discount) as net_revenue

from orders o
left join order_details od
on o.order_id = od.order_id