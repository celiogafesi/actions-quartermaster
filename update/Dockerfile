FROM alpine:3.12.0

RUN apk add bash

COPY --from=alpine/helm:2.16.9 /usr/bin/helm /usr/local/bin/helm
COPY --from=alpine/helm:3.3.4 /usr/bin/helm /usr/local/bin/helm3
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
