SELECT *
FROM {{ ref('fct_reviews') }} F
    INNER JOIN {{ ref('dim_listings_cleansed') }} L
        USING (listing_id)
WHERE F.review_date < L.created_at
LIMIT 10