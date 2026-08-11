
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB.DEV__test_failures.accepted_values_dim_hosts_cleansed_is_superhost__t__f
    
      
    ) dbt_internal_test