SELECT
    r.review_date,
    l.created_at
FROM
    AIRBNB.PROD.fct_reviews AS r
JOIN
    AIRBNB.PROD.dim_listings_cleansed AS l
    ON r.listing_id = l.listing_id
WHERE
    r.review_date < l.created_at