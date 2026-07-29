
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.PROD__test_failures.relationships_dim_listings_cle_05e2397b186a7b9306fc747b3cc4ef83
    
      
    ) dbt_internal_test