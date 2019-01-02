bosh int \
    cf.yml \
    -l ../../../../tilegen/cf/2.2.10/errand-vars.yml \
    -l ../../../../tilegen/cf/2.2.10/resource-vars.yml \
    -l ../../../../tilegen/cf/2.2.10/product-default-vars.yml \
    -l cf-vars.yml \
    --var-errs
