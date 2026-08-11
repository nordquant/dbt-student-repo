{% test minimum_row_count(model, min_row_count) %}
{{ config(severity='WARN'
) }}
SELECT COUNT(*) AS row_count
FROM {{ model }}
HAVING COUNT(*) < {{ min_row_count }}
{% endtest %}