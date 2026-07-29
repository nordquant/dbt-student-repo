
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.PROD__test_failures.dbt_expectations_expect_column_c59e300e0dddb335c4211147100ac1c6
    
      
    ) dbt_internal_test