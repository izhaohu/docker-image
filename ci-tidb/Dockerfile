FROM pingcap/tidb:v4.0.4

ENV TZ='Asia/Shanghai'

RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENTRYPOINT ["/tidb-server", "-L", "warn"]
