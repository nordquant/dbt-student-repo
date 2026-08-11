

WITH fct_reviews AS (
    SELECT * FROM (select * from (select * from AIRBNB.DBT_MYDEV.fct_reviews where false limit 0) where review_date >= to_timestamp_tz('2010-01-01 00:00:00+00:00') and review_date < to_timestamp_tz('2011-01-01 00:00:00+00:00'))
),
full_moon_dates AS (
    SELECT * FROM (select * from AIRBNB.DBT_MYDEV.seed_full_moon_dates where false limit 0)
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