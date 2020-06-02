#!/bin/bash

# sources 
export WEAVIATE_HELM_CHART_VERSION=gcpm11

# targets
export TARGET_VERSION=0.22.1
export TARGET_IMAGE_VERSION="$(echo $TARGET_VERSION | cut -d'.' -f1).$(echo $TARGET_VERSION | cut -d'.' -f2)"
echo "Version:"
echo "$TARGET_IMAGE_VERSION ($TARGET_VERSION)"
export TARGET_REPO_BASE="gcr.io/$GCP_PROJECT/weaviate-on-gke"
export TARGET_REGISTRY=gcr.io
export TARGET_REPO_BASE_WITHOUT_REGISTRY="$GCP_PROJECT/weaviate-on-gke"
