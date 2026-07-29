
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.PROD__test_failures.dbt_expectations_expect_column_39596d790161761077ff1592b68943f6
    
      
    ) dbt_internal_test