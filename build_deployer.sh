#!/bin/bash

source versions.sh.inc

export REGISTRY=gcr.io/$GCP_PROJECT
export APP_NAME=weaviate-on-gke
docker build \
  --tag "$TARGET_REPO_BASE/deployer" \
  --tag "$TARGET_REPO_BASE/deployer:$TARGET_VERSION" \
  --tag "$TARGET_REPO_BASE/deployer:$TARGET_IMAGE_VERSION" \
  .

echo "Pushing latest"
docker push "$TARGET_REPO_BASE/deployer:latest"
echo "Pushing full target"
docker push "$TARGET_REPO_BASE/deployer:$TARGET_VERSION"
echo "Pushing short target"
docker push "$TARGET_REPO_BASE/deployer:$TARGET_IMAGE_VERSION"
