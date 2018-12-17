#!/bin/bash -e

rm pipeline_final.yml

cp base_pipeline.yml /tmp/working_pipeline.yml

active_products=$(bosh int products.yml --path=/active_products)

for file in $active_products; do
  echo "processing tile: $file" 
  bosh int /tmp/working_pipeline.yml \
    -o template.yml \
    -l "productTiles/$file" \
    > /tmp/tmp.yml
  cp /tmp/tmp.yml /tmp/working_pipeline.yml
  rm /tmp/tmp.yml
done

mv /tmp/working_pipeline.yml pipeline_final.yml