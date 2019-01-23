productName="cf"
productVersion="2.3.5"
env=lab01

mkdir -p ../foundations/$env/products/$productName

bosh int $productName/$productVersion/product.yml \
    -o $productName/$productVersion/features/haproxy_forward_tls-disable.yml \
    -o $productName/$productVersion/resource/router_elb_names.yml \
    -o $productName/$productVersion/features/mysql_activity_logging-disable.yml \
    -o $productName/$productVersion/network/3-az-configuration.yml \
    > ../foundations/$env/products/$productName/$productName.yml

touch -a ../foundations/$env/products/$productName/$productName-vars.yml

SHELL_OUTPUT="../foundations/$env/products/$productName/$productName-interpolate.sh"

/bin/cat <<EOM >$SHELL_OUTPUT
bosh int \\
    $productName.yml \\
    -l ../../../../tilegen/$productName/$productVersion/errand-vars.yml \\
    -l ../../../../tilegen/$productName/$productVersion/resource-vars.yml \\
    -l ../../../../tilegen/$productName/$productVersion/product-default-vars.yml \\
    -l $productName-vars.yml \\
    --var-errs
EOM
