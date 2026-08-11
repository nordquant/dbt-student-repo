-- back compat for old kwarg name
  
  begin;
    

        insert into AIRBNB.DBT_MYDEV.fct_reviews ("REVIEW_ID", "LISTING_ID", "REVIEW_DATE", "REVIEWER_NAME", "REVIEW_TEXT", "REVIEW_SENTIMENT")
        (
            select "REVIEW_ID", "LISTING_ID", "REVIEW_DATE", "REVIEWER_NAME", "REVIEW_TEXT", "REVIEW_SENTIMENT"
            from AIRBNB.DBT_MYDEV.fct_reviews__dbt_tmp
        );
    commit;