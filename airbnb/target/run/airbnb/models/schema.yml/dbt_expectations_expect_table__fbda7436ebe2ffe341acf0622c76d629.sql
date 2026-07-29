
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.PROD__test_failures.dbt_expectations_expect_table__fbda7436ebe2ffe341acf0622c76d629
    
      
    ) dbt_internal_test