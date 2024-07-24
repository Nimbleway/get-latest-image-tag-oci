#!/bin/bash
 
IMAGE=$(oci artifacts container image list --compartment-id $COMPARTMENT_ID --repository-name $REPO_NAME --sort-by TIMECREATED --sort-order DESC | jq -r '.data.items[]."display-name"' | grep -v -E ':latest$|:chrome$|:hackium$' | head -n 1)
echo $IMAGE
if [ -z "$IMAGE" ]; then
  IMAGE="$REPO_NAME:latest"
  echo "could not find an image with a tag other than latest, chrome or hackium, using latest"
fi
if [[ ! "$IMAGE" =~ $REPO_NAME ]]; then
  IMAGE="$REPO_NAME:latest"
  echo "could not find an image with a tag other than latest, chrome or hackium, using latest"
fi

echo "image=$(echo $IMAGE)" >> $GITHUB_OUTPUT