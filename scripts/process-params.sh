#!/bin/bash -e

function usage() {
  cat <<USAGE
USAGE: $(basename "$0") -i {vsphere|gcp} -p {product_name}

  -i  one of vsphere, gcp
  -p  product name matches opsfile
USAGE
  bail
}

function bail {
  if [ ${#BASH_SOURCE[@]} -eq 1 ]; then
    exit 1  # executed directly
  else
    return # sourced
  fi
}

# Default to "dev" - can override with command line parameter
ENV=dev
PRODUCT=""
IAAS=""

while getopts ":p:i:e:" arg; do
  case "$arg" in
    p ) PRODUCT="$OPTARG" ;;
    i ) IAAS="$OPTARG" ;;
    e ) ENV="$OPTARG" ;;
    \? ) usage ;;
    : ) usage ;;
  esac
done

if [ "${PRODUCT}X" = "X" ]; then
  usage
fi

if [ "${IAAS}X" = "X" ]; then
  usage
fi

FOUNDATION_PATH="../environments/${IAAS}/${ENV}/config"
