#!/bin/bash

set -e

source versions.sh.inc

rm -rf chart/weaviate-on-gke/charts && mkdir -p chart/weaviate-on-gke/charts

set -x
curl --fail -o chart/weaviate-on-gke/charts/weaviate.tgz -L "https://github.com/semi-technologies/weaviate-helm/releases/download/$WEAVIATE_HELM_CHART_VERSION/weaviate.tgz"
# Download configuration values
