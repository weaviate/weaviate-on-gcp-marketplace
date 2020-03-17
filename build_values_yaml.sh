#!/bin/bash

source versions.sh.inc

envsubst < chart/weaviate-enterprise/values.yaml.presubs > chart/weaviate-enterprise/values.yaml
