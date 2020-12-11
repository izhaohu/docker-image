FROM izhaohucom/alpine-glibc

ARG DOCKER_VERSION=19.03.14
ARG K8S_VERSION=1.18.10

RUN apk add --no-cache alpine-sdk openssh-client rsync upx jq

RUN cd /tmp && mkdir ~/.kube \
    && wget -qO- https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | tar zxf - && mv docker/docker /usr/local/bin/docker \
    && wget -qO /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v$K8S_VERSION/bin/linux/amd64/kubectl && chmod +x /usr/local/bin/kubectl \
    && upx /usr/local/bin/docker /usr/local/bin/kubectl \
    && rm -rf /tmp/*
