#!/bin/bash -e
: ${PIVNET_TOKEN?"Need to set PIVNET_TOKEN"}

source process-params.sh

echo "Generating configuration for product ${PRODUCT}"

versionfile="${FOUNDATION_PATH}/versions/${PRODUCT}.yml"
if [ ! -f ${versionfile} ]; then
  echo "Must create ${versionfile}"
  exit 1
fi
version=$(bosh interpolate ${versionfile} --path /product-version)
glob=$(bosh interpolate ${versionfile} --path /pivnet-file-glob)
slug=$(bosh interpolate ${versionfile} --path /pivnet-product-slug)
productName=$(bosh interpolate ${versionfile} --path /internal-product-name?)

if [ ${productName} = "null" ]; then
  productName=${PRODUCT}
fi

tmpdir=products/${PRODUCT}-config
mkdir -p ${tmpdir}
om config-template --output-directory=${tmpdir} --pivnet-api-token ${PIVNET_TOKEN} --pivnet-product-slug  ${slug} --product-version ${version} --product-file-glob ${glob}
wrkdir=$(find ${tmpdir}/${productName} -name "${version}*")
if [ ! -f ${wrkdir}/product.yml ]; then
  echo "Something wrong with configuration as expecting ${wrkdir}/product.yml to exist"
  exit 1
fi

ops_files="opsfiles/${PRODUCT}-operations"
touch ${ops_files}

ops_files_args=("")
while IFS= read -r var
do
  ops_files_args+=("-o ${wrkdir}/${var}")
done < "$ops_files"
bosh int ${wrkdir}/product.yml ${ops_files_args[@]} > ${FOUNDATION_PATH}/templates/${PRODUCT}.yml


rm -rf ${FOUNDATION_PATH}/defaults/${PRODUCT}.yml
touch ${FOUNDATION_PATH}/defaults/${PRODUCT}.yml
if [ -f ${wrkdir}/product-default-vars.yml ]; then
  cat ${wrkdir}/product-default-vars.yml >> ${FOUNDATION_PATH}/defaults/${PRODUCT}.yml
fi
if [ -f ${wrkdir}/errand-vars.yml ]; then
  cat ${wrkdir}/errand-vars.yml >> ${FOUNDATION_PATH}/defaults/${PRODUCT}.yml
fi
if [ -f ${wrkdir}/resource-vars.yml ]; then
  cat ${wrkdir}/resource-vars.yml >> ${FOUNDATION_PATH}/defaults/${PRODUCT}.yml
fi

touch ${FOUNDATION_PATH}/vars/${PRODUCT}.yml
touch ${FOUNDATION_PATH}/secrets/${PRODUCT}.yml
