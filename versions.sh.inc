#!/bin/bash

# sources 
export WEAVIATE_HELM_CHART_VERSION=v9.1.0

# targets
export TARGET_VERSION=0.22
export TARGET_REPO_BASE="gcr.io/$GCP_PROJECT/weaviate-on-gke"
export TARGET_REGISTRY=gcr.io
export TARGET_REPO_BASE_WITHOUT_REGISTRY="$GCP_PROJECT/weaviate-on-gke"
