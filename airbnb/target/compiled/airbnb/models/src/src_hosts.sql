WITH raw_hosts AS (
    SELECT * FROM AIRBNB.raw.raw_hosts
)
SELECT
    id as host_id,
    name as host_name,
    is_superhost,
    created_at,
    updated_at

FROM
    raw_hosts