With src_hosts as (
select * from AIRBNB.RAW.RAW_HOSTS
)
select 
id as Host_ID,
name as Host_Name,
is_superhost,
created_at,
updated_at
from src_hosts