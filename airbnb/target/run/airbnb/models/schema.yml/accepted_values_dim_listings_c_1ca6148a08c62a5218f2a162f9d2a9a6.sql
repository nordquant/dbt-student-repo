
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.PROD__test_failures.accepted_values_dim_listings_c_1ca6148a08c62a5218f2a162f9d2a9a6
    
      
    ) dbt_internal_test