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

from {{ source('dbt_northwind', 'orders') }} o
left join {{ source('dbt_northwind', 'order_details') }} od
    on o.order_id = od.order_id