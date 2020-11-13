FROM lachlanevenson/k8s-helm:v2.16.9

RUN apk add bash

COPY --from=lachlanevenson/k8s-helm:v3.3.4 /usr/local/bin/helm /usr/local/bin/helm3
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
