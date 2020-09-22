<h1>Weaviate GCP Marketplace Application <img alt='Weaviate logo' src='https://raw.githubusercontent.com/semi-technologies/weaviate/19de0956c69b66c5552447e84d016f4fe29d12c9/docs/assets/weaviate-logo.png' width='52' align='right' /></h1>

[![Build Status](https://api.travis-ci.org/semi-technologies/weaviate-on-gcp-marketplace.svg?branch=master)](https://travis-ci.org/semi-technologies/weaviate-on-gcp-marketplace/branches)

## For Users

You can install the Weaviate Marketplace deployment directly from the [Google Cloud Marketplace](https://console.cloud.google.com/marketplace/details/semi-marketplace-public/weaviate).

Additional instructions can be found in the [documentation](https://www.semi.technology/documentation/weaviate/current/getting-started/installation.html#cloud-deployment).

## For Contributors to this application

Below are some resources to help developers extend and maintain this repository

### Resources as part of this application

* Our [Helm Chart](https://github.com/semi-technologies/weaviate-helm-gcp-marketplace) used in this Marketplace Application. Note that the helm chart is a fork of the common Helm chart, as it needs to integrate Marketplace-specific instructions.
* A [reference to the Helm Chart version](https://github.com/semi-technologies/weaviate-on-gcp-marketplace/blob/b44fd633fe9a8fd1ba330d342304ca410620db94/versions.sh.inc#L5) used in this application.
* A [reference to the Weaviate version](https://github.com/semi-technologies/weaviate-on-gcp-marketplace/blob/0da2e180ed8c596ec7f919cb44e5b5436fd6d560/versions.sh.inc#L8) used.
* A [reference to the the Contextionary version](https://github.com/semi-technologies/weaviate-on-gcp-marketplace/blob/0da2e180ed8c596ec7f919cb44e5b5436fd6d560/versions.sh.inc#L16) used.
* This [application's `schema.yaml`](https://github.com/semi-technologies/weaviate-on-gcp-marketplace/blob/master/schema.yaml)

### GCP-Marketplace Documentation
* Build a [Helm-based Deployer Image](https://github.com/GoogleCloudPlatform/marketplace-k8s-app-tools/blob/master/docs/building-deployer-helm.md)
* [schema.yaml Properties Explanations](https://github.com/GoogleCloudPlatform/marketplace-k8s-app-tools/blob/master/docs/schema.md#properties) 

### How to make a release

1. Update [the target version here](https://github.com/semi-technologies/weaviate-on-gcp-marketplace/blob/0932836f43fa1cf9f3ff15ea9bf699d92986c1a1/versions.sh.inc#L9). This version will be used to tag all images. Note that no matter what you change each version must be higher than the last, so it is not at all uncommon for the Application version to be higher than the underlying Weaviate version. For example, imagine you start with Weaviate version `0.22.16` and Application version `0.22.16`. Now you add a new field to the `schema.yaml` and want to deploy your application, you must increase the Application version to at least `0.22.17`, however, the underlying Weaviate version has not changed and is still `0.22.16`
2. Set the same version you set in step 1 in [this field in the `schema.yaml`](https://github.com/semi-technologies/weaviate-on-gcp-marketplace/blob/0932836f43fa1cf9f3ff15ea9bf699d92986c1a1/schema.yaml#L9) If there is a mismatch between this version and the image versions (from Step 1) the GCP marketplace UI will not accept the new version
3. Wait for the Travis pipeline run to complete (and succeed).
4. Log into the [GCP Marketplace Partner UI](https://console.cloud.google.com/partner/solutions?project=semi-marketplace-public&angularJsUrl=%2Fpartner%2Fsolutions%3Fproject%3Dsemi-marketplace-public) and select this application.
5. Click on "Update"
6. Under the "Versions" section, click on "Edit"
7. Click the `0.22` Tag (or a later one if the underlying Weaviate version is no longer 0.22)
8. Wait for "Checking sync status of images, this may take a minute" to complete
9. Click "Update Images"
10. Click "Save" on all dialogs until you are back at the main menu
11. Click "Submit for Review"

### Run the setup locally
1. Run pipeline so images are pushed
2. Setup and configure any GKE Kubernetes Cluster
3. Install custom resource, so cluster supports Applications: 
  ```
  kubectl apply -f "https://raw.githubusercontent.com/GoogleCloudPlatform/marketplace-k8s-app-tools/master/crd/app-crd.yaml"

  ```
4. Deploy application with 
   ```
   mpdev install \
    --deployer=gcr.io/semi-marketplace-dev/weaviate-on-gke/deployer:0.22.17 \
    --parameters='{"name": "test-deployment", "namespace": "test-ns",
      "weaviate.marketplace.planSelectionEnum": "Weaviate Open Source",
      "contextionaryLanguage": "English"}'
   ```


