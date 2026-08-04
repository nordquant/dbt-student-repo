with src_reviews as(
select * from AIRBNB.RAW.RAW_REVIEWS
)
select 
DATE as review_date,
comments as review_text,
sentiment as review_sentiment,
Listing_ID,
Reviewer_Name
from src_reviews