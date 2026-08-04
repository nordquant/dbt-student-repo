With src_hosts as (
    select * from {{ref('src_hosts')}}
)
select
    NVL(host_name, 'Anonymous') AS host_name,
    IS_Superhost,
    created_at,
    updated_at
from src_hosts