-- We want to get those rows as a result in this test, where the review is _before_ the listing creation
-- Remember that tests must return the "bad" records, only

SELECT * FROM AIRBNB.PROD.dim_listings_cleansed l
INNER JOIN AIRBNB.PROD.fct_reviews r
USING (listing_id)
WHERE l.created_at > r.review_date