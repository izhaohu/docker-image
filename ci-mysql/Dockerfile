FROM golang:1.15.7-alpine AS builder

RUN apk add --no-cache alpine-sdk upx

ENV \
    CGO_ENABLED=0 \
    GO111MODULE=on

RUN go get -u github.com/izhaohu/migrate \
    && upx /go/bin/*

FROM mysql:5.7.33

RUN apt-get update && apt-get install -y --no-install-recommends git curl rsync jq ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --from=builder \
    /go/bin/migrate \
    /usr/local/bin/
