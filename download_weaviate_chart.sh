#!/bin/bash

set -e

source versions.sh.inc

rm -rf chart/charts && mkdir -p chart/charts

curl -o chart/charts/weaviate.tgz "https://github.com/semi-technologies/weaviate-helm/releases/download/$WEAVIATE_HELM_CHART_VERSION/weaviate.tgz"
# Download configuration values
