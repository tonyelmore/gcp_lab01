bosh int \
    cf.yml \
    -l ../../../../tilegen/cf/2.3.5/errand-vars.yml \
    -l ../../../../tilegen/cf/2.3.5/resource-vars.yml \
    -l ../../../../tilegen/cf/2.3.5/product-default-vars.yml \
    -l cf-vars.yml \
    --var-errs
