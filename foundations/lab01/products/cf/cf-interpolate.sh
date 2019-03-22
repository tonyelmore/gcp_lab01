bosh int \
    cf.yml \
    -l ../../../../tilegen/products/cf/2.4.4/errand-vars.yml \
    -l ../../../../tilegen/products/cf/2.4.4/resource-vars.yml \
    -l ../../../../tilegen/products/cf/2.4.4/product-default-vars.yml \
    -l cf-vars.yml \
    --var-errs
