bosh int \
    pivotal-mysql.yml \
    -l ../../../../tilegen/products/pivotal-mysql/2.5.3-build.7/errand-vars.yml \
    -l ../../../../tilegen/products/pivotal-mysql/2.5.3-build.7/resource-vars.yml \
    -l ../../../../tilegen/products/pivotal-mysql/2.5.3-build.7/product-default-vars.yml \
    -l pivotal-mysql-vars.yml \
    --var-errs
