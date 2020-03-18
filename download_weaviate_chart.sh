#!/bin/bash

set -e

source versions.sh.inc

rm -rf chart/weaviate-enterprise/charts && mkdir -p chart/weaviate-enterprise/charts

set -x
curl --fail -o chart/weaviate-enterprise/charts/weaviate.tgz -L "https://github.com/semi-technologies/weaviate-helm-gcp-marketplace/releases/download/$WEAVIATE_HELM_CHART_VERSION/weaviate.tgz"
# Download configuration values
