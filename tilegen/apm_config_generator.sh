pivnet_token=$(credhub get -n /concourse/main/pivnet_token -j | jq -r .value)
tile-config-generator generate \
    --base-directory=. \
    --include-errands \
    --token=$pivnet_token \
    --product-slug=apm \
    --product-version=1.6.0 \
    --product-glob=*.pivotal