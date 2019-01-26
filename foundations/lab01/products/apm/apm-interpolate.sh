bosh int \
    apm.yml \
    -l ../../../../tilegen/apmPostgres/1.6.0-build.41/errand-vars.yml \
    -l ../../../../tilegen/apmPostgres/1.6.0-build.41/resource-vars.yml \
    -l ../../../../tilegen/apmPostgres/1.6.0-build.41/product-default-vars.yml \
    -l apm-vars.yml \
    --var-errs
