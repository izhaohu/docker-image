FROM izhaohucom/protogen AS builder

FROM node:12.18.3-buster

COPY --from=builder \
    /usr/local/bin/protoc \
    /usr/local/bin/

RUN apt-get update && apt-get install -y --no-install-recommends rsync && rm -rf /var/lib/apt/lists/*

ARG PROTOC_GEN_GRPC_WEB_VERSION=1.0.7

RUN wget -qO /usr/local/bin/protoc-gen-grpc-web https://github.com/grpc/grpc-web/releases/download/$PROTOC_GEN_GRPC_WEB_VERSION/protoc-gen-grpc-web-$PROTOC_GEN_GRPC_WEB_VERSION-linux-x86_64 \
    && chmod +x /usr/local/bin/protoc-gen-grpc-web
