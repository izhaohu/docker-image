FROM registry.cn-shanghai.aliyuncs.com/vsi-open/alpine-glibc

RUN apk add --no-cache curl git make openssh-client rsync jq

RUN cd /tmp \
    && curl -sSL https://download.docker.com/linux/static/stable/x86_64/docker-19.03.12.tgz | tar zxf - && mv docker/docker /usr/local/bin/docker \
    && curl -sSL https://storage.googleapis.com/kubernetes-release/release/v1.18.2/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl \
    && mkdir ~/.kube \
    && rm -rf /tmp/* /var/cache/apk/*
