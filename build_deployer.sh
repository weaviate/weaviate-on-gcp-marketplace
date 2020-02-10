#!/bin/bash

source versions.sh.inc

export REGISTRY=gcr.io/$GCP_PROJECT
export APP_NAME=weaviate-on-gke
docker build --tag "$TARGET_REPO_BASE/deployer" .
docker push "$TARGET_REPO_BASE/deployer"
