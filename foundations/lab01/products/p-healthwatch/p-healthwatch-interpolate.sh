bosh int \
    p-healthwatch.yml \
    -l ../../../../tilegen/p-healthwatch/1.4.4-build.1/errand-vars.yml \
    -l ../../../../tilegen/p-healthwatch/1.4.4-build.1/resource-vars.yml \
    -l ../../../../tilegen/p-healthwatch/1.4.4-build.1/product-default-vars.yml \
    -l p-healthwatch-vars.yml \
    --var-errs
