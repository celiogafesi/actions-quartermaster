FROM lachlanevenson/k8s-helm:v2.16.9

RUN apk add bash curl

COPY --from=lachlanevenson/k8s-helm:v3.3.4 /usr/local/bin/helm /usr/local/bin/helm3
COPY entrypoint.sh /entrypoint.sh
        
RUN curl -L "https://github.com/instrumenta/kubeval/releases/download/0.15.0/kubeval-linux-amd64.tar.gz" -o /tmp/kubeval-linux-amd64.tar.gz
RUN tar xvf /tmp/kubeval-linux-amd64.tar.gz -C /tmp
RUN chmod +x /tmp/kubeval
RUN mv /tmp/kubeval /usr/local/bin/

ENTRYPOINT ["/entrypoint.sh"]
