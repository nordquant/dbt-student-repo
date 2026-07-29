
  
    

create or replace transient table AIRBNB.PROD.dim_hosts_cleansed
    
  (
    host_id integer not null,
    host_name TEXT not null,
    is_superhost TEXT,
    updated_at timestamp,
    created_at timestamp
    
    )

    
    
    
    as (
    select host_id, host_name, is_superhost, updated_at, created_at
    from (
        WITH  __dbt__cte__src_hosts as (
WITH raw_hosts AS (
    SELECT
        *
    FROM
       AIRBNB.raw.raw_hosts
)
SELECT
    id AS host_id,
    NAME AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    raw_hosts
), src_hosts AS (
    SELECT * FROM __dbt__cte__src_hosts
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
    ) as model_subq
    )
;


  