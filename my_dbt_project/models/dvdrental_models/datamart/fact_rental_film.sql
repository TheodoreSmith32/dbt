{{ config(
    materialized='table'
) }}


--QUERY get from source yml 
with film_source as (
    select * 
    from {{ source('dvdrental_project1', 'film') }}
)
, inventory_source as 
(
    select * 
    from {{ source('dvdrental_project1', 'inventory') }}
)
, rental_source as 
(
    select * 
    from {{ source('dvdrental_project1', 'rental') }}
)
,film_name as (
select i.inventory_id ,f.film_id ,f.title  
from inventory_source i 
join film_source f on i.film_id =f.film_id 
)
,film_rental_cust as (
SELECT r.rental_id ,r.rental_date ,
sc."Full_Name" as "Customer_name",
fn.title as "Film_name",fn.film_id
from rental_source r 
join stg_customer sc on r.customer_id =sc.customer_id 
join film_name fn on fn.inventory_id = r.inventory_id 
)

select 
COUNT("film_id") as TOTAL_RENTAL, 
"Film_name",
extract(year from "rental_date" ) as YEARS
,extract(month from "rental_date" ) as MONTHS
from film_rental_cust
group by "Film_name" ,
extract(year from "rental_date" )
,extract(month from "rental_date" )
order by "Film_name" 
