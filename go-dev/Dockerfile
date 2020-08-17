FROM golang:1.15.0-buster as builder

RUN echo 'deb http://mirrors.aliyun.com/debian buster main\n\
deb http://mirrors.aliyun.com/debian-security buster/updates main\n\
deb http://mirrors.aliyun.com/debian buster-updates main'\
> /etc/apt/sources.list

RUN apt-get update && apt-get install -y

ENV \
    CGO_ENABLED=0 \
    GO111MODULE=on \
    GOPROXY="https://goproxy.cn,direct"

RUN cd /tmp \
    && go get -u github.com/mgechev/revive \
    && go get -u github.com/rakyll/statik \
    && go get -u github.com/libgo/migrate \
    && go get -u github.com/kyoh86/richgo

FROM registry.cn-shanghai.aliyuncs.com/vsi-open/protogen AS protogen

FROM registry.cn-shanghai.aliyuncs.com/vsi-open/ci-bot AS bot

FROM golang:1.15.0-buster

COPY --from=builder \
    /go/bin/revive \
    /go/bin/statik \
    /go/bin/migrate \
    /go/bin/richgo \
    /usr/local/bin/

COPY --from=protogen \
    /usr/local/bin/prototool \
    /usr/local/bin/protoc \
    /usr/local/bin/protoc-gen-go \
    /usr/local/bin/protoc-gen-validate \
    /usr/local/bin/

COPY --from=protogen \
    /usr/include/google \
    /usr/include/google

COPY --from=bot \
    /usr/local/bin/docker \
    /usr/local/bin/kubectl \
    /usr/local/bin/

ENV \
    CGO_ENABLED=0 \
    GOPROXY="https://goproxy.cn,direct" \
    GOPRIVATE="code.izhaohu.com" \
    PROTOTOOL_PROTOC_BIN_PATH=/usr/local/bin/protoc \
    PROTOTOOL_PROTOC_WKT_PATH=/usr/include

RUN echo 'deb http://mirrors.aliyun.com/debian buster main\n\
deb http://mirrors.aliyun.com/debian-security buster/updates main\n\
deb http://mirrors.aliyun.com/debian buster-updates main'\
> /etc/apt/sources.list

RUN cd /tmp \
    && apt-get update && apt-get install -y upx jq \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p ~/.kube ~/.ssh && chmod 700 ~/.ssh \
    && echo "Host *\n\tStrictHostKeyChecking no\n" > ~/.ssh/config \
    && echo "dash dash/sh boolean false" | debconf-set-selections && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash
