FROM registry.cn-shanghai.aliyuncs.com/vsi-open/protogen AS builder

FROM node:12

COPY --from=builder \
    /usr/local/bin/protoc \
    /usr/local/bin/

ARG PROTOC_GEN_GRPC_WEB_VERSION=1.0.6

RUN wget https://github.com/grpc/grpc-web/releases/download/$PROTOC_GEN_GRPC_WEB_VERSION/protoc-gen-grpc-web-$PROTOC_GEN_GRPC_WEB_VERSION-linux-x86_64 -qO /usr/local/bin/protoc-gen-grpc-web \
    && chmod +x /usr/local/bin/protoc-gen-grpc-web \
    && apt-get update && apt-get install -y rsync \
    && rm -rf /var/lib/apt/lists/*
