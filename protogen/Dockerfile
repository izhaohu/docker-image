FROM golang:1.15.0-alpine AS builder

RUN apk add --no-cache alpine-sdk upx

ARG PROTOC_VERSION=3.12.4
ARG PROTOC_GO_VERSION=1.3.5
ARG PROTOC_VALIDATE=0.4.1
ARG PROTOTOOL_VERSION=1.10.0

ENV \
    CGO_ENABLED=0 \
    GO111MODULE=on

RUN cd /tmp && mkdir -p protobuf-src \
    && wget -qO- https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/protobuf-all-$PROTOC_VERSION.tar.gz | tar zxf - -C protobuf-src --strip-components 1 \
    && wget -qO- https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip | unzip -q - && chmod +x bin/protoc && mv bin/protoc $GOPATH/bin/protoc \
    && wget -qO- https://github.com/uber/prototool/releases/download/v$PROTOTOOL_VERSION/prototool-Linux-x86_64.tar.gz | tar zxf - && mv prototool/bin/prototool $GOPATH/bin/prototool \
    && go get -u github.com/golang/protobuf/protoc-gen-go@v$PROTOC_GO_VERSION \
    && go get -d github.com/envoyproxy/protoc-gen-validate@v$PROTOC_VALIDATE \
    && make build -C `go env GOMODCACHE`/github.com/envoyproxy/protoc-gen-validate@v$PROTOC_VALIDATE \
    && upx /go/bin/*

FROM python:3.7.9-buster

COPY --from=builder \
    /go/bin/protoc \
    /go/bin/protoc-gen-go \
    /go/bin/protoc-gen-validate \
    /go/bin/prototool \
    /usr/local/bin/

COPY --from=builder \
    /tmp/include/google \
    /usr/include/google

COPY --from=builder \
    /tmp/protobuf-src \
    /opt/protobuf-src

ARG DART_VERSION=2.8.1
ARG PROTOC_GEN_GRPC_DOC_VERSION=1.3.2
ARG PROTOC_GEN_GRPC_WEB_VERSION=1.0.7

ENV \
    PUB_HOSTED_URL=https://pub.flutter-io.cn \
    FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn \
    PATH=$PATH:/usr/lib/dart/bin:/root/.pub-cache/bin \
    PROTOTOOL_PROTOC_BIN_PATH=/usr/local/bin/protoc \
    PROTOTOOL_PROTOC_WKT_PATH=/usr/include

RUN cd /tmp \
    && sed -i 's|deb.debian.org|mirrors.aliyun.com|g' /etc/apt/sources.list \
    && sed -i 's|security.debian.org|mirrors.aliyun.com|g' /etc/apt/sources.list \
    && apt-get update && apt-get install -y --no-install-recommends git curl rsync upx jq && rm -rf /var/lib/apt/lists/* \
    && wget -qO dart.deb https://storage.googleapis.com/dart-archive/channels/stable/release/$DART_VERSION/linux_packages/dart_$DART_VERSION-1_amd64.deb \
    && dpkg -i dart.deb \
    && cd /opt/protobuf-src && pub global activate protoc_plugin && cd /tmp \
    && wget -qO /usr/local/bin/protoc-gen-grpc-web https://github.com/grpc/grpc-web/releases/download/$PROTOC_GEN_GRPC_WEB_VERSION/protoc-gen-grpc-web-$PROTOC_GEN_GRPC_WEB_VERSION-linux-x86_64 \
    && chmod +x /usr/local/bin/protoc-gen-grpc-web \
    && wget -qO /tmp/protoc-gen-doc.tgz https://github.com/pseudomuto/protoc-gen-doc/releases/download/v$PROTOC_GEN_GRPC_DOC_VERSION/protoc-gen-doc-$PROTOC_GEN_GRPC_DOC_VERSION.linux-amd64.go1.12.6.tar.gz \
    && tar zxvf /tmp/protoc-gen-doc.tgz -C /usr/local/bin --strip-components 1 \
    && upx /usr/local/bin/protoc-gen-grpc-web /usr/local/bin/protoc-gen-doc \
    && pip3 install grpcio grpcio-tools \
    && ln -sf /bin/bash /bin/sh \
    && rm -rf /tmp/*
