#!/bin/bash
 
IMAGE=$(oci artifacts container image list --compartment-id $COMPARTMENT_ID --repository-name $REPO_NAME --sort-by TIMECREATED --sort-order DESC | jq -r '.data.items[]."display-name"' | grep -v -E ':latest$|:chrome$' | head -n 1)
echo $IMAGE
echo "image=$(echo $IMAGE)" >> $GITHUB_OUTPUT