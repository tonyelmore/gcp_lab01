fly -t mgmtplane \
	set-pipeline \
	-p gcplab01 \
	-c pipeline_final.yml \
	-l pcf-pipeline-params.yml \
	-l ../../lab02/config/opsman-params.yml