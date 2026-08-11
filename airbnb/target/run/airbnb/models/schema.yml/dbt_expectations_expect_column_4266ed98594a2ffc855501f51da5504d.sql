
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.PROD__test_failures.dbt_expectations_expect_column_4266ed98594a2ffc855501f51da5504d
    
      
    ) dbt_internal_test