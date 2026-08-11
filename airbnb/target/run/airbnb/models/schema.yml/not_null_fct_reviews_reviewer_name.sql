
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB._TEST_FAILURES.not_null_fct_reviews_reviewer_name
    
      
    ) dbt_internal_test