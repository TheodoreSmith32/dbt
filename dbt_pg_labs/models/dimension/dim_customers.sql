

select
    format_datetime(current_timestamp, 'yyyyMMdd') as report_date,
    customer_id,
    UPPER(company_name) customer_name,
    contact_name,
    contact_title,
    customer_address,
    country,
    case when phone is not null then 'Y' else 'N' end as has_phone,
    case when fax   is not null then 'Y' else 'N' end as has_fax,
    format_datetime(current_timestamp, 'yyyy-MM-dd HH:mm:ss') as updated_at
from {{ ref('stg_customers') }}