WITH raw_reviews AS (
    SELECT * FROM AIRBNB.raw.raw_reviews
)
SELECT
    listing_id,
    date as review_date,
    reviewer_name,
    comments as review_text,
    sentiment as review_sentiment

FROM
    raw_reviews