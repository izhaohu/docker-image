FROM pingcap/tidb:v4.0.8

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone

ENTRYPOINT ["/tidb-server", "-L", "warn"]
