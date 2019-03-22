pivnet_token=$(credhub get -n /concourse/main/pivnet_token -j | jq -r .value)
tile-config-generator generate \
    --base-directory=./products \
    --include-errands \
    --token=$pivnet_token \
    --product-slug=$SLUG \
    --product-version=$VERSION \
    --product-glob=$GLOB
