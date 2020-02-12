#!/bin/bash 

set -euo pipefail

source versions.sh.inc

# the target tag will be used for every image, as is required from gcp marketplace
target_tag="$TARGET_IMAGE_VERSION"
target_repo_base="$TARGET_REPO_BASE"

function main() {
  ## weaviate image
  weaviate_source_registry=docker.io
  weaviate_source_tag=0.22.1
  weaviate_source_repo=semitechnologies/weaviate
  weaviate_target_repo="$target_repo_base"

  repush "$weaviate_source_registry" "$weaviate_source_repo" "$weaviate_source_tag" "$weaviate_target_repo"

  ## contextionary once for each language
  languages="en nl"
  for lang in $languages; do
    c11y_source_registry=docker.io
    c11y_source_tag="${lang}0.10.0-v0.4.7"
    c11y_source_repo="semitechnologies/contextionary"
    c11y_target_repo="$target_repo_base/contextionary-${lang}"

    repush "$c11y_source_registry" "$c11y_source_repo" "$c11y_source_tag" "$c11y_target_repo"
  done

  ## esvector
  esvector_source_registry=docker.io
  esvector_source_tag=7.1.0
  esvector_source_repo=semitechnologies/esvector
  esvector_target_repo="$target_repo_base/esvector"

  repush "$esvector_source_registry" "$esvector_source_repo" "$esvector_source_tag" "$esvector_target_repo"

  esvector_source_registry=docker.io
  esvector_source_tag=3.3.13-debian-9-r30
  esvector_source_repo=bitnami/etcd
  esvector_target_repo="$target_repo_base/etcd"

  repush "$esvector_source_registry" "$esvector_source_repo" "$esvector_source_tag" "$esvector_target_repo"
}

function repush() {
  set -e

  local s_registry="${1}"
  local s_repo="${2}"
  local s_tag="${3}"
  local t_repo="${4}"

  local source="$s_registry/$s_repo:$s_tag"
  local target="$t_repo:$target_tag"

  docker pull "$source"
  docker tag "$source" "$target"
  docker push "$target"
}

main "$@"
