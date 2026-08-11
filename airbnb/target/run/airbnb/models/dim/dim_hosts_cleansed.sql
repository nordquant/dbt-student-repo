
  
    

create or replace transient table AIRBNB.DBT_MYDEV.dim_hosts_cleansed_v1
    
    
    
    as (
WITH  __dbt__cte__src_hosts as (
WITH raw_hosts AS (
    SELECT * FROM (select * from AIRBNB.raw.raw_hosts where false limit 0)
)
SELECT
    id as host_id,
    name as host_name,
    is_superhost,
    created_at,
    updated_at

FROM
    raw_hosts
), src_hosts AS (
    SELECT
        *
    FROM
        (select * from __dbt__cte__src_hosts where false limit 0)
)
SELECT
    host_id,
    NVL(
        host_name,
        'Anonymous'
    ) AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts
    )
;


  