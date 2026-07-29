
-- Fixture for fct_reviews
select try_cast(null as character varying(32)) as "REVIEW_ID", try_cast(null as NUMBER(38,0)) as "LISTING_ID", 
    
        try_cast('2025-01-13' as TIMESTAMP_NTZ)
     as "REVIEW_DATE", try_cast(null as character varying(16777216)) as "REVIEWER_NAME", try_cast(null as character varying(16777216)) as "REVIEW_TEXT", try_cast(null as character varying(16777216)) as "REVIEW_SENTIMENT"
union all
select try_cast(null as character varying(32)) as "REVIEW_ID", try_cast(null as NUMBER(38,0)) as "LISTING_ID", 
    
        try_cast('2025-01-14' as TIMESTAMP_NTZ)
     as "REVIEW_DATE", try_cast(null as character varying(16777216)) as "REVIEWER_NAME", try_cast(null as character varying(16777216)) as "REVIEW_TEXT", try_cast(null as character varying(16777216)) as "REVIEW_SENTIMENT"
union all
select try_cast(null as character varying(32)) as "REVIEW_ID", try_cast(null as NUMBER(38,0)) as "LISTING_ID", 
    
        try_cast('2025-01-15' as TIMESTAMP_NTZ)
     as "REVIEW_DATE", try_cast(null as character varying(16777216)) as "REVIEWER_NAME", try_cast(null as character varying(16777216)) as "REVIEW_TEXT", try_cast(null as character varying(16777216)) as "REVIEW_SENTIMENT"