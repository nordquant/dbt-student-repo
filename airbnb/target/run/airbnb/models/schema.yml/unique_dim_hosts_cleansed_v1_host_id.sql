
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from AIRBNB._TEST_FAILURES.unique_dim_hosts_cleansed_v1_host_id
    
      
    ) dbt_internal_test