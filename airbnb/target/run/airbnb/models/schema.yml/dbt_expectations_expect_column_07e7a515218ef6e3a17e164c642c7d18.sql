
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.PROD__test_failures.dbt_expectations_expect_column_07e7a515218ef6e3a17e164c642c7d18
    
      
    ) dbt_internal_test