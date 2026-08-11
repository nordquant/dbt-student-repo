
    
    
    
    

    delete from AIRBNB.MART.mart_fullmoon_reviews DBT_INTERNAL_TARGET
    where (
    DBT_INTERNAL_TARGET.review_date >= to_timestamp_tz('2011-01-01 00:00:00+00:00')
    and DBT_INTERNAL_TARGET.review_date < to_timestamp_tz('2012-01-01 00:00:00+00:00')
    
    );insert into AIRBNB.MART.mart_fullmoon_reviews ("REVIEW_ID", "LISTING_ID", "REVIEW_DATE", "REVIEWER_NAME", "REVIEW_TEXT", "REVIEW_SENTIMENT", "IS_FULL_MOON")
    (
        select "REVIEW_ID", "LISTING_ID", "REVIEW_DATE", "REVIEWER_NAME", "REVIEW_TEXT", "REVIEW_SENTIMENT", "IS_FULL_MOON"
        from AIRBNB.MART.mart_fullmoon_reviews__dbt_tmp_2011
    )
