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
