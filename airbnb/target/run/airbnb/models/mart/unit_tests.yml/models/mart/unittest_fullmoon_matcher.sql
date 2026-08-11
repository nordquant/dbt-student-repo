
    -- Build actual result given inputs
with dbt_internal_unit_test_actual as (
  select
    "REVIEW_DATE","IS_FULL_MOON", 'actual' as "actual_or_expected"
  from (
    

WITH  __dbt__cte__fct_reviews as (

-- Fixture for fct_reviews
select try_cast(null as character varying(32)) as "REVIEW_ID", try_cast(null as NUMBER(38,0)) as "LISTING_ID", 
    
        try_cast('2025-01-13' as TIMESTAMP_NTZ)
     as "REVIEW_DATE", try_cast(null as character varying(16777216)) as "REVIEWER_NAME", try_cast(null as character varying(16777216)) as "REVIEW_TEXT", try_cast(null as character varying(16777216)) as "REVIEW_SENTIMENT"
union all
select try_cast(null as character varying(32)) as "REVIEW_ID", try_cast(null as NUMBER(38,0)) as "LISTING_ID", 
    
        try_cast('2025-01-14' as TIMESTAMP_NTZ)
     as "REVIEW_DATE", try_cast(null as character varying(16777216)) as "REVIEWER_NAME", try_cast(null as character varying(16777216)) as "REVIEW_TEXT", try_cast(null as character varying(16777216)) as "REVIEW_SENTIMENT"
union all
select try_cast(null as character varying(32)) as "REVIEW_ID", try_cast(null as NUMBER(38,0)) as "LISTING_ID", 
    
        try_cast('2025-01-15' as TIMESTAMP_NTZ)
     as "REVIEW_DATE", try_cast(null as character varying(16777216)) as "REVIEWER_NAME", try_cast(null as character varying(16777216)) as "REVIEW_TEXT", try_cast(null as character varying(16777216)) as "REVIEW_SENTIMENT"
),  __dbt__cte__seed_full_moon_dates as (

-- Fixture for seed_full_moon_dates
select 
    
        try_cast('2025-01-14' as DATE)
     as "FULL_MOON_DATE"
), fct_reviews AS (
    SELECT * FROM __dbt__cte__fct_reviews
),
full_moon_dates AS (
    SELECT * FROM __dbt__cte__seed_full_moon_dates
)

SELECT
  r.*,
  CASE
    WHEN fm.full_moon_date IS NULL THEN 'not full moon'
    ELSE 'full moon'
  END AS is_full_moon
FROM
  fct_reviews
  r
  LEFT JOIN full_moon_dates
  fm
  ON (TO_DATE(r.review_date) = DATEADD(DAY, 1, fm.full_moon_date))
  ) _dbt_internal_unit_test_actual
),
-- Build expected result
dbt_internal_unit_test_expected as (
  select
    "REVIEW_DATE", "IS_FULL_MOON", 'expected' as "actual_or_expected"
  from (
    select 
    
        try_cast('2025-01-13' as TIMESTAMP_NTZ)
     as "REVIEW_DATE", 
    
        try_cast('not full moon' as character varying(13))
     as "IS_FULL_MOON"
union all
select 
    
        try_cast('2025-01-14' as TIMESTAMP_NTZ)
     as "REVIEW_DATE", 
    
        try_cast('not full moon' as character varying(13))
     as "IS_FULL_MOON"
union all
select 
    
        try_cast('2025-01-15' as TIMESTAMP_NTZ)
     as "REVIEW_DATE", 
    
        try_cast('full moon' as character varying(13))
     as "IS_FULL_MOON"
  ) _dbt_internal_unit_test_expected
)
-- Union actual and expected results
select * from dbt_internal_unit_test_actual
union all
select * from dbt_internal_unit_test_expected