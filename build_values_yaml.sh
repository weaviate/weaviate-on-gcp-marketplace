#!/bin/bash

source versions.sh.inc

envsubst < chart/values.yaml.presubs > chart/values.yaml
