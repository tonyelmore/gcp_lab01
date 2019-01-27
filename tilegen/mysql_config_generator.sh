product_slug="pivotal-mysql"
product_version="2.5.3"
product_glob="*.pivotal"

pivnet_token=$(credhub get -n /concourse/main/pivnet_token -j | jq -r .value)

tile-config-generator generate \
    --base-directory=. \
    --include-errands \
    --token=$pivnet_token \
    --product-slug=$product_slug \
    --product-version=$product_version \
    --product-glob=$product_glob
