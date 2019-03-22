productName="p-rabbitmq"
productVersion="1.14.8"
env="lab01"

mkdir -p ../foundations/$env/products/$productName

bosh int products/$productName/$productVersion/product.yml \
    -o products/$productName/$productVersion/network/3-az-configuration.yml \
    > ../foundations/$env/products/$productName/$productName.yml

touch -a ../foundations/$env/products/$productName/$productName-vars.yml

SHELL_OUTPUT="../foundations/$env/products/$productName/$productName-interpolate.sh"

/bin/cat <<EOM >$SHELL_OUTPUT
bosh int \\
    $productName.yml \\
    -l ../../../../tilegen/products/$productName/$productVersion/errand-vars.yml \\
    -l ../../../../tilegen/products/$productName/$productVersion/resource-vars.yml \\
    -l ../../../../tilegen/products/$productName/$productVersion/product-default-vars.yml \\
    -l $productName-vars.yml \\
    --var-errs
EOM
