
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB._TEST_FAILURES.accepted_values_fct_reviews_beb36f129a533890a78cc01ac370ef78
    
      
    ) dbt_internal_test