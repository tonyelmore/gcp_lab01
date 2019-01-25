bosh int \
    datadog.yml \
    -l ../../../../tilegen/datadog/2.5.0/resource-vars.yml \
    -l ../../../../tilegen/datadog/2.5.0/product-default-vars.yml \
    -l datadog-vars.yml \
    --var-errs
