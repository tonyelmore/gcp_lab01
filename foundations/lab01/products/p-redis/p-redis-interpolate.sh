bosh int \
    p-redis.yml \
    -l ../../../../tilegen/p-redis/1.14.3/errand-vars.yml \
    -l ../../../../tilegen/p-redis/1.14.3/resource-vars.yml \
    -l ../../../../tilegen/p-redis/1.14.3/product-default-vars.yml \
    -l p-redis-vars.yml \
    --var-errs
