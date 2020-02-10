#!/bin/bash

# sources 
export WEAVIATE_HELM_CHART_VERSION=v9.0.0

# targets
export TARGET_VERSION=0.22.1
export TARGET_REPO_BASE="gcr.io/$GCP_PROJECT/weaviate-on-gke"
