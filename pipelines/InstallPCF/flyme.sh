fly -t gcp \
	set-pipeline \
	-p install-lab01 \
	-c pipeline_final.yml \
	-l ../../foundations/lab01/pipeline-params.yml
	-l ../../common-config/opsman.yml
