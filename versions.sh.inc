#!/bin/bash


# sources 
export WEAVIATE_HELM_CHART_VERSION=gcpm16

# targets
export SOURCE_VERSION=0.22.16
export TARGET_VERSION=0.22.17
export TARGET_IMAGE_VERSION="$(echo $TARGET_VERSION | cut -d'.' -f1).$(echo $TARGET_VERSION | cut -d'.' -f2)"
echo "Version:"
echo "$TARGET_IMAGE_VERSION ($TARGET_VERSION)"
export TARGET_REPO_BASE="gcr.io/$GCP_PROJECT/weaviate-on-gke"
export TARGET_REGISTRY=gcr.io
export TARGET_REPO_BASE_WITHOUT_REGISTRY="$GCP_PROJECT/weaviate-on-gke"
export CONTEXTIONARY_VERSION="0.16.0-v0.4.19"
