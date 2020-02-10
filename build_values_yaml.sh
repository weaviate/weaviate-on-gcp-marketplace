#!/bin/bash

source versions.sh.inc

envsubst < chart/weaviate-on-gke/values.yaml.presubs > chart/weaviate-on-gke/values.yaml
