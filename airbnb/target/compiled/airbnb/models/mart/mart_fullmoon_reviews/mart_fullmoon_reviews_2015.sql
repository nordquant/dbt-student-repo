

WITH fct_reviews AS (
    SELECT * FROM (select * from AIRBNB.PROD.fct_reviews where review_date >= to_timestamp_tz('2015-01-01 00:00:00+00:00') and review_date < to_timestamp_tz('2016-01-01 00:00:00+00:00'))
),
full_moon_dates AS (
    SELECT * FROM AIRBNB.PROD.seed_full_moon_dates
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