#!/bin/bash 

set -euo pipefail

source versions.sh.inc

# the target tag will be used for every image, as is required from gcp marketplace
target_tag="$TARGET_IMAGE_VERSION"     # short version, e.g. 0.22
target_tag_full="$TARGET_VERSION"      # long version, e.g. 0.22.7
weaviate_source_tag="$TARGET_VERSION"  # source must always match long version
target_repo_base="$TARGET_REPO_BASE"

function main() {
  ## weaviate image
  weaviate_source_registry=docker.io
  weaviate_source_tag="$weaviate_source_tag"
  weaviate_source_repo=semitechnologies/weaviate
  weaviate_target_repo="$target_repo_base"

  repush "$weaviate_source_registry" "$weaviate_source_repo" "$weaviate_source_tag" "$weaviate_target_repo"

  ## contextionary once for each language
  languages="en nl de it cs"
  for lang in $languages; do
    c11y_source_registry=docker.io
    c11y_source_tag="${lang}0.13.0-v0.4.7"
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

  build_and_push_smoke_tests
}

function repush() {
  set -e

  local s_registry="${1}"
  local s_repo="${2}"
  local s_tag="${3}"
  local t_repo="${4}"

  local source="$s_registry/$s_repo:$s_tag"
  local target="$t_repo:$target_tag"
  local target_full="$t_repo:$target_tag_full"

  docker pull "$source"
  docker tag "$source" "$target"
  docker tag "$source" "$target_full"
  docker push "$target"
  docker push "$target_full"
}

function build_and_push_smoke_tests() {
  test_image_full="$target_repo_base/smoketest:$target_tag_full"
  test_image="$target_repo_base/smoketest:$target_tag"
  ( cd smoke-test/ && docker build -t "$test_image" -t "$test_image_full" .)
  docker push "$test_image"
  docker push "$test_image_full"
}

main "$@"
