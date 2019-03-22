bosh int \
    p-rabbitmq.yml \
    -l ../../../../tilegen/products/p-rabbitmq/1.14.8/errand-vars.yml \
    -l ../../../../tilegen/products/p-rabbitmq/1.14.8/resource-vars.yml \
    -l ../../../../tilegen/products/p-rabbitmq/1.14.8/product-default-vars.yml \
    -l p-rabbitmq-vars.yml \
    --var-errs
