<h1>Weaviate GCP Marketplace Deployment <img alt='Weaviate logo' src='https://raw.githubusercontent.com/semi-technologies/weaviate/19de0956c69b66c5552447e84d016f4fe29d12c9/docs/assets/weaviate-logo.png' width='52' align='right' /></h1>

[![Build Status](https://api.travis-ci.org/semi-technologies/weaviate-on-gcp-marketplace.svg?branch=master)](https://travis-ci.org/semi-technologies/weaviate-on-gcp-marketplace/branches)

## For Users

You can install the Weaviate Marketplace deployment directly from the [Google Cloud Marketplace](https://console.cloud.google.com/marketplace/details/semi-marketplace-public/weaviate).

Additional instructions can be found in the [documentation](https://www.semi.technology/documentation/weaviate/current/getting-started/installation.html#cloud-deployment).

## For Developers

Below are some resources to help developers extend and maintain this repisitory

### Resources as part of this application

* Our [Helm Chart](https://github.com/semi-technologies/weaviate-helm-gcp-marketplace) used in this Marketplace Application. Note that the helm chart is a fork of the common Helm chart, as it needs to integrate Marketplace-specific instructions.
* A [reference to the Helm Chart version](https://github.com/semi-technologies/weaviate-on-gcp-marketplace/blob/b44fd633fe9a8fd1ba330d342304ca410620db94/versions.sh.inc#L5) used in this application.
* This [application's `schema.yaml`](https://github.com/semi-technologies/weaviate-on-gcp-marketplace/blob/master/schema.yaml)

### GCP-Marketplace Documentation
* Build a [Helm-based Deployer Image](https://github.com/GoogleCloudPlatform/marketplace-k8s-app-tools/blob/master/docs/building-deployer-helm.md)
* [schema.yaml Properties Explanations](https://github.com/GoogleCloudPlatform/marketplace-k8s-app-tools/blob/master/docs/schema.md#properties) 
