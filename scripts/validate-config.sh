#!/bin/bash -e

source process-params.sh

echo "Validating configuration for product ${PRODUCT}"

bosh interpolate ${FOUNDATION_PATH}/templates/${PRODUCT}.yml \
  --vars-file ${FOUNDATION_PATH}/defaults/${PRODUCT}.yml \
  --vars-file ${FOUNDATION_PATH}/vars/${PRODUCT}.yml \
  --vars-file ${FOUNDATION_PATH}/secrets/${PRODUCT}.yml \
  --var-errs \
  --var-errs-unused
