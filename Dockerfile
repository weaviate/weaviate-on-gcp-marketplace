FROM gcr.io/cloud-marketplace-tools/k8s/deployer_helm/onbuild

COPY ./smoke-test/chart/ /tmp/test
RUN mkdir -p /data-test/chart
RUN cd /tmp/test && tar -czf /data-test/chart/test.tar.gz weaviate-smoke-test/
COPY ./smoke-test/schema.yaml /data-test/

