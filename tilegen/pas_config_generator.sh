product_slug="elastic-runtime"
product_version="2.3.5"
product_glob="cf*.pivotal"

pivnet_token=$(credhub get -n /concourse/main/pivnet_token -j | jq -r .value)

tile-config-generator generate \
    --base-directory=. \
    --include-errands \
    --token=$pivnet_token \
    --product-slug=$product_slug \
    --product-version=$product_version \
    --product-glob=$product_glob
