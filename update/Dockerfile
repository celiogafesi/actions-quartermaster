FROM lachlanevenson/k8s-helm:v2.16.1

RUN apk add bash wget
RUN wget https://get.helm.sh/helm-v3.4.0-linux-amd64.tar.gz
RUN tar zxvf helm-v3.4.0-linux-amd64.tar.gz
RUN mv linux-amd64/helm /usr/local/bin/helm3
RUN chmod 755 /usr/local/bin/helm3
RUN rm -rf linux-amd64
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
