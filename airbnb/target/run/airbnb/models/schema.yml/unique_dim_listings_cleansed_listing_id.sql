
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.PROD__test_failures.unique_dim_listings_cleansed_listing_id
    
      
    ) dbt_internal_test