FROM izhaohucom/alpine-glibc

RUN apk add --no-cache alpine-sdk openssh-client rsync jq

RUN cd /tmp \
    && wget -qO- https://download.docker.com/linux/static/stable/x86_64/docker-19.03.12.tgz | tar zxf - && mv docker/docker /usr/local/bin/docker \
    && wget -qO /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.18.2/bin/linux/amd64/kubectl && chmod +x /usr/local/bin/kubectl \
    && mkdir ~/.kube \
    && rm -rf /tmp/*
