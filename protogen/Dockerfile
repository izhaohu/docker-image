FROM golang:1.15.0-alpine AS builder

RUN sed -i 's|http://dl-cdn.alpinelinux.org|https://mirrors.aliyun.com|g' /etc/apk/repositories \
    && apk add --no-cache build-base curl git make

ARG PROTOC_VERSION=3.12.4
ARG PROTO_GO_VERSION=1.3.5
ARG PROTOTOOL_VERSION=1.10.0

ENV CGO_ENABLED=0

RUN cd /tmp && mkdir -p protobuf-src \
    && curl -sSL https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/protobuf-all-$PROTOC_VERSION.tar.gz | tar zxf - -C protobuf-src --strip-components 1 \
    && curl -sSL https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip | unzip -q - && chmod +x bin/protoc && mv bin/protoc $GOPATH/bin/protoc \
    && curl -sSL https://github.com/uber/prototool/releases/download/v$PROTOTOOL_VERSION/prototool-Linux-x86_64.tar.gz | tar zxf - && mv prototool/bin/prototool $GOPATH/bin/prototool \
    && git clone -b v$PROTO_GO_VERSION --depth=1 https://github.com/golang/protobuf $GOPATH/src/github.com/golang/protobuf \
    && go install github.com/golang/protobuf/protoc-gen-go \
    && go get -d -u github.com/envoyproxy/protoc-gen-validate \
    && make build -C $GOPATH/src/github.com/envoyproxy/protoc-gen-validate

FROM python:3.7-slim

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
ARG PROTOC_GEN_GRPC_WEB_VERSION=1.0.7
ARG PROTOC_GEN_JAVA_GRPC_VERSION=1.29.0

ENV \
    PUB_HOSTED_URL=https://pub.flutter-io.cn \
    FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn \
    PATH=$PATH:/usr/lib/dart/bin:/root/.pub-cache/bin \
    PROTOTOOL_PROTOC_BIN_PATH=/usr/local/bin/protoc \
    PROTOTOOL_PROTOC_WKT_PATH=/usr/include

RUN cd /tmp \
    && sed 's/deb.debian.org/mirrors.aliyun.com/g' -i /etc/apt/sources.list \
    && sed 's/security.debian.org/mirrors.aliyun.com/g' -i /etc/apt/sources.list \
    && apt-get update && apt-get install -y git curl rsync jq \
    && curl -sSL https://storage.googleapis.com/dart-archive/channels/stable/release/$DART_VERSION/linux_packages/dart_$DART_VERSION-1_amd64.deb -o dart.deb \
    && dpkg -i dart.deb \
    && cd /opt/protobuf-src && pub global activate protoc_plugin && cd /tmp \
    && curl -sSL https://github.com/grpc/grpc-web/releases/download/$PROTOC_GEN_GRPC_WEB_VERSION/protoc-gen-grpc-web-$PROTOC_GEN_GRPC_WEB_VERSION-linux-x86_64 -o /usr/local/bin/protoc-gen-grpc-web \
    && chmod +x /usr/local/bin/protoc-gen-grpc-web \
    && curl -sSL https://github.com/pseudomuto/protoc-gen-doc/releases/download/v1.3.2/protoc-gen-doc-1.3.2.linux-amd64.go1.12.6.tar.gz -o protoc-gen-doc.tgz \
    && tar zxvf /tmp/protoc-gen-doc.tgz -C /usr/local/bin --strip-components 1 \
    && curl -sSL https://search.maven.org/remotecontent?filepath=io/grpc/protoc-gen-grpc-java/$PROTOC_GEN_JAVA_GRPC_VERSION/protoc-gen-grpc-java-$PROTOC_GEN_JAVA_GRPC_VERSION-linux-x86_64.exe -o /usr/local/bin/protoc-gen-grpc-java \
    && chmod +x /usr/local/bin/protoc-gen-grpc-java \
    && pip3 install grpcio grpcio-tools \
    && ln -sf /bin/bash /bin/sh \
    && rm -rf /var/lib/apt/lists/* /tmp/*
