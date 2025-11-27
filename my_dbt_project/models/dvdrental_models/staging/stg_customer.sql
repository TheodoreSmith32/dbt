--ADD OVERRIDE CONFIG -> RESULT BECOME TABLE
{{ config(
    materialized='table'
) }}


--QUERY 
with source as (
    select * 
    from {{ source('dvdrental_project1', 'customer') }}
)

select customer_id ,first_name ,last_name ,
first_name || ' ' ||last_name as "Full_Name" 
from source

