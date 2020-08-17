FROM golang:1.15.0-alpine AS builder

ENV \
    CGO_ENABLED=0 \
    GO111MODULE=on \
    GOPROXY="https://goproxy.cn,direct"

RUN apk add --no-cache git && go get -u github.com/libgo/migrate

FROM mysql:5.7

RUN apt-get update && apt-get install -y git curl jq && rm -rf /var/lib/apt/lists/*

COPY --from=builder \
    /go/bin/migrate \
    /usr/local/bin/
