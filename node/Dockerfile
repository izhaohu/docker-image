FROM izhaohucom/protogen AS builder

FROM node:12.18.4-buster

COPY --from=builder \
    /usr/local/bin/protoc \
    /usr/local/bin/protoc-gen-grpc-web \
    /usr/local/bin/

RUN apt-get update && apt-get install -y --no-install-recommends rsync && rm -rf /var/lib/apt/lists/*
