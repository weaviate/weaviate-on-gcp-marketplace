#!/bin/bash 

set -euo pipefail

# the target tag will be used for every image, as is required from gcp marketplace
target_tag=0.22.1
target_registry=gcr.io
target_repo_base="$GCP_PROJECT/weaviate-on-gke"

function main() {
  ## weaviate image
  weaviate_source_registry=docker.io
  weaviate_source_tag=0.22.1
  weaviate_source_repo=semitechnologies/weaviate
  weaviate_target_repo="$target_repo_base/weaviate"

  repush "$weaviate_source_registry" "$weaviate_source_repo" "$weaviate_source_tag" "$weaviate_target_repo"
}

function repush() {
  set -e

  local s_registry="${1}"
  local s_repo="${2}"
  local s_tag="${3}"
  local t_repo="${4}"

  local source="$s_registry/$s_repo:$s_tag"
  local target="$target_registry/$t_repo:$target_tag"

  docker pull "$source"
  docker tag "$source" "$target"
  docker push "$target"
}

main "$@"
