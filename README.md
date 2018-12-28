# GCP Installation

Here is a list of steps that I performed... with no explanation of what the step does or the results of the execution of the step

* Clone `control plane` repo (https://github.com/pivotal/control-plane.git)
* Create Service Account (with proper auth)
* Configure Terraform Vars
  * This is a file that will be committed in Git
* Pave the IaaS
* Run `gcp/deploy-om-director.sh` from control-plane repo 
* Run `gcp/update-concourse-cloud-config.sh` from control-plane repo
* Upload Xenial stemcell to bosh (see doc in control-plane)
* Clone `concourse-bosh-deployment`
* Run `deploy-concourse` from control-plane repo (read doc in control-plane first ... need to set env variables before running)

## New Files and Git

You will create several new configuration files to lay down the control plane and also to terraform up the environment.  There are secrets in these files.  However, the files are within the directory structure of cloned repos.  Good news is that the repo has a `.gitignore` that will ignore the new files.  Bad news is... these have to be kept around somewhere?

So the question becomes "where?".  Should a new jumpbox be created where all this work is executed from?

### Questions

* Find again how to get the service account key from gcp

### Blobstore

To use GCP blobstore for holding installation.zip or state.yml - the bucket must be enabled for versioning

https://cloud.google.com/storage/docs/using-object-versioning#enable

gsutil versioning set on gs://[BUCKET_NAME]

### Setting JSON in credhub as a value
credhub set -n /concourse/main/opsman_service_account_json -t value -v "$(cat sa-aelmore-dc48ffcab2d2.json)"

## Required Credhub values
pivnet_token
gcp-lab01-cert                  (see generateCerts.sh)
* credhub set -n /concourse/main/opsman_service_account_json -t value -v "$(cat control-plane/sa-aelmore-dc48ffcab2d2.json)"
* credhub set -n concourse/main/telmore-github-creds -t ssh -u ~/.ssh/tonyelmore_github.pub -p ~/.ssh/tonyelmore_github
