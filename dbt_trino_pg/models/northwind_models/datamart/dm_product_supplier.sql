{{ config(enabled=false) }}

with products as 
(
select * 
from {{ref('stg_products')}}
),
supplier as 
(
select * 
from {{source('dbt_northwind','suppliers')}}
)
select p.product_name,
p.unit_price,
s.company_name as supplier_name
from products p 
join supplier s 
on p.supplier_id = s.supplier_id