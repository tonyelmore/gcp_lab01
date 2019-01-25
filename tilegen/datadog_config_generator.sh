pivnet_token=$(credhub get -n /concourse/main/pivnet_token -j | jq -r .value)
tile-config-generator generate \
    --base-directory=. \
    --include-errands \
    --token=$pivnet_token \
    --product-slug=datadog \
    --product-version=2.5.0 \
    --product-glob=*.pivotal