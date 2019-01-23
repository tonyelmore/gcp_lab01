gcloud compute instances add-metadata 1671356997529447059 --metadata=ssh-keys="ubuntu:$(cat ~/.ssh/lab01-gcp-opsman.pub)",block-project-ssh-keys="true" --zone us-west1-b
