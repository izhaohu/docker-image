FROM golang:1.15.0-alpine AS builder

RUN apk add --no-cache alpine-sdk

ENV \
    CGO_ENABLED=0 \
    GO111MODULE=on

RUN cd /tmp \
    && go get -u github.com/izhaohu/migrate

FROM mysql:5.7.31

RUN apt-get update && apt-get install -y --no-install-recommends git curl rsync jq && rm -rf /var/lib/apt/lists/*

COPY --from=builder \
    /go/bin/migrate \
    /usr/local/bin/
