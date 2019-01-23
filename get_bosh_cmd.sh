export OM_PASSWORD=opsmanpassword
export OM_USERNAME=opsman
export OM_TARGET=pcf.lab01.telmore.io

BOSH_COMMAND_LINE=$(om -k curl -s -p /api/v0/deployed/director/credentials/bosh_commandline_credentials | jq -r .credential)
echo $BOSH_COMMAND_LINE | tr -d '\n' | pbcopy
echo $BOSH_COMMAND_LINE
echo Has been copied to the clipboard

EXPORT_CMD=""
export_var="export"
delim=";"

IFS=' ' read -r -a array <<< "$BOSH_COMMAND_LINE"
for index in "${!array[@]}"; do
  if [ $index != 4 ]
  then
    EXPORT_CMD="$EXPORT_CMD $export_var ${array[index]} $delim"
  fi
done

EXPORT_CMD=${EXPORT_CMD// ;/;}

echo $EXPORT_CMD | pbcopy
echo $EXPORT_CMD
echo Has also been copied to the clipboard

echo Logging into OpsMan
gcloud compute --project "sa-aelmore" ssh --zone "us-west1-b" "ops-manager-vm-us-west1" 
