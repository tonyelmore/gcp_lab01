#### NOTE ####
# Do NOT use this as a template to start another product
# the slug and the internal name do not match - so this has been hacked

productName="apm"
tilegenName="apmPostgres"
productVersion="1.6.0-build.41"
env="lab01"

mkdir -p ../foundations/$env/products/$productName

bosh int $tilegenName/$productVersion/product.yml \
    -o $tilegenName/$productVersion/network/3-az-configuration.yml \
    > ../foundations/$env/products/$productName/$productName.yml

touch -a ../foundations/$env/products/$productName/$productName-vars.yml

SHELL_OUTPUT="../foundations/$env/products/$productName/$productName-interpolate.sh"

/bin/cat <<EOM >$SHELL_OUTPUT
bosh int \\
    $productName.yml \\
    -l ../../../../tilegen/$tilegenName/$productVersion/errand-vars.yml \\
    -l ../../../../tilegen/$tilegenName/$productVersion/resource-vars.yml \\
    -l ../../../../tilegen/$tilegenName/$productVersion/product-default-vars.yml \\
    -l $productName-vars.yml \\
    --var-errs
EOM
