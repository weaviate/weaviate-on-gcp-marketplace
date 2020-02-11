#!/bin/bash

set -euo pipefail

gcloud auth activate-service-account --key-file "${1?"Provide path to keyfile as 1st arg"}"
gcloud auth configure-docker --quiet
gcloud config set project "$GCP_PROJECT"
