
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.PROD__test_failures.minimum_row_count_dim_listings_cleansed_1000
    
      
    ) dbt_internal_test