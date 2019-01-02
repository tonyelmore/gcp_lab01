pivnet_token=$(credhub get -n /concourse/main/pivnet_token -j | jq -r .value)
tile-config-generator generate \
    --base-directory=. \
    --include-errands \
    --token=$pivnet_token \
    --product-slug=elastic-runtime \
    --product-version=2.2.10 \
    --product-glob=cf*.pivotal
