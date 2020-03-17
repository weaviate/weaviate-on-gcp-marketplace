#!/bin/bash

set -euo pipefail

source versions.sh.inc

cluster_id=$(openssl rand -base64 15 | tr -dc '[:alnum:]' | tr '[:upper:]' '[:lower:]')

gcloud container clusters create "test-$cluster_id" --zone=europe-west3-a \
  --num-nodes=3 --machine-type=n1-standard-2 --cluster-version=1.14

gcloud container clusters get-credentials "test-$cluster_id" --zone=europe-west3-a

kubectl apply -f "https://raw.githubusercontent.com/GoogleCloudPlatform/marketplace-k8s-app-tools/master/crd/app-crd.yaml"

# install mpedev
docker run \
  gcr.io/cloud-marketplace-tools/k8s/dev \
  cat /scripts/dev > mpdev
chmod +x "mpdev"

./mpdev verify "--deployer=gcr.io/semi-marketplace-dev/weaviate-enterprise/deployer:$TARGET_VERSION"

