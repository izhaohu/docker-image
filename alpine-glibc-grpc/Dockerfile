FROM izhaohucom/alpine-glibc

ARG GRPC_HEALTH_PROBE_VERSION=v0.3.2

RUN wget -qO /bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/$GRPC_HEALTH_PROBE_VERSION/grpc_health_probe-linux-amd64 \
    && chmod +x /bin/grpc_health_probe
