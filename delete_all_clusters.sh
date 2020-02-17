#!/bin/bash

set -euo pipefail

# this command might be runnign as part of the failed-build clean up, so we
# don't know which project we're in. Explicitly log into the dev stage project
# as that's the only one where we would ever create clusters.
export GCP_PROJECT=semi-marketplace-dev
./login_gcp.sh sa-keyfile-dev.json

gcloud container clusters list --uri |\
  while read -r uri; do
    gcloud container clusters delete "$uri" --zone=europe-west3-a --quiet
  done;
