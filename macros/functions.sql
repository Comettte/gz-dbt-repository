{% macro margin(revenue,purchase_price,quantity) %}
    round({{revenue}} - CAST({{purchase_price}} as FLOAT64)*{{quantity}},2)
{% endmacro %}

{% macro margin_percent(revenue,margin) %}
    round(SAFE_DIVIDE(margin,revenue),2)
{% endmacro %}
