
  
    

create or replace transient table AIRBNB.DEV.mart_fullmoon_reviews
    
    
    
    as (

WITH fct_reviews AS (
    SELECT * FROM AIRBNB.DEV.fct_reviews
),
full_moon_dates AS (
    SELECT * FROM AIRBNB.DEV.seed_full_moon_dates
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
    )
;


  