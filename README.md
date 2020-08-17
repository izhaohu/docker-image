# Docker Images


```
     ci-mysql
     ci-tidb

                     alpine
                       ↓
                  alpine-glibc
                     ↓  ↓
     alpine-glibc-grpc  ci-bot
                     ↓  ↓
     protogen  →    go-dev
        ↓
       node
```

```bash
docker pull registry-vpc.cn-shanghai.aliyuncs.com/vsi-open/ci-mysql
docker pull registry-vpc.cn-shanghai.aliyuncs.com/vsi-open/ci-tidb
docker pull registry-vpc.cn-shanghai.aliyuncs.com/vsi-open/alpine
docker pull registry-vpc.cn-shanghai.aliyuncs.com/vsi-open/alpine-glibc
docker pull registry-vpc.cn-shanghai.aliyuncs.com/vsi-open/alpine-glibc-grpc
docker pull registry-vpc.cn-shanghai.aliyuncs.com/vsi-open/ci-bot
docker pull registry-vpc.cn-shanghai.aliyuncs.com/vsi-open/protogen
docker pull registry-vpc.cn-shanghai.aliyuncs.com/vsi-open/go-dev
docker pull registry-vpc.cn-shanghai.aliyuncs.com/vsi-open/node

docker image prune
```
