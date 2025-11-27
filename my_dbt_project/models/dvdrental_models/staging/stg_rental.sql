--ADD OVERRIDE CONFIG -> RESULT BECOME TABLE
{{ config(
    materialized='table'
) }}


--QUERY
with source as (
    SELECT * FROM {{source('dvdrental_project1','rental')}}
)

select 
rental_id ,
to_char(rental_date,'YYYY-MM-DD HH24:MI:SS') as rental_date,
to_char(return_date,'YYYY-MM-DD HH24:MI:SS') as return_date,
inventory_id ,
customer_id ,
staff_id 
from source 