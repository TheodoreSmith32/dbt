with sources as (
    select *
    from 
    {{source('dbt_pg_labs_02','customers')}}
)

select 
customer_id,
    company_name,
    contact_name,
    contact_title,
    address ||' '|| city ||' '|| postal_code   as customer_address,
    country,
    phone ,
    fax  
from sources