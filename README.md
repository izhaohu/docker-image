# Docker Images

![build](https://img.shields.io/github/workflow/status/izhaohu/docker-image/build/master?style=for-the-badge)

## Step

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
     ↓      ↓
    node  flutter
```

## Badge

| repository        | version                                                                                                | layer                                                                                                            | size                                                                                                            |
| ----------------- | ------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| alpine            | ![alpine](https://img.shields.io/docker/v/izhaohucom/alpine?style=for-the-badge)                       | ![alpine](https://img.shields.io/microbadger/layers/izhaohucom/alpine?style=for-the-badge)                       | ![alpine](https://img.shields.io/docker/image-size/izhaohucom/alpine?style=for-the-badge)                       |
| alpine-glibc      | ![alpine-glibc](https://img.shields.io/docker/v/izhaohucom/alpine-glibc?style=for-the-badge)           | ![alpine-glibc](https://img.shields.io/microbadger/layers/izhaohucom/alpine-glibc?style=for-the-badge)           | ![alpine-glibc](https://img.shields.io/docker/image-size/izhaohucom/alpine-glibc?style=for-the-badge)           |
| alpine-glibc-grpc | ![alpine-glibc-grpc](https://img.shields.io/docker/v/izhaohucom/alpine-glibc-grpc?style=for-the-badge) | ![alpine-glibc-grpc](https://img.shields.io/microbadger/layers/izhaohucom/alpine-glibc-grpc?style=for-the-badge) | ![alpine-glibc-grpc](https://img.shields.io/docker/image-size/izhaohucom/alpine-glibc-grpc?style=for-the-badge) |
| ci-bot            | ![ci-bot](https://img.shields.io/docker/v/izhaohucom/ci-bot?style=for-the-badge)                       | ![ci-bot](https://img.shields.io/microbadger/layers/izhaohucom/ci-bot?style=for-the-badge)                       | ![ci-bot](https://img.shields.io/docker/image-size/izhaohucom/ci-bot?style=for-the-badge)                       |
| ci-mysql          | ![ci-mysql](https://img.shields.io/docker/v/izhaohucom/ci-mysql?style=for-the-badge)                   | ![ci-mysql](https://img.shields.io/microbadger/layers/izhaohucom/ci-mysql?style=for-the-badge)                   | ![ci-mysql](https://img.shields.io/docker/image-size/izhaohucom/ci-mysql?style=for-the-badge)                   |
| ci-tidb           | ![ci-tidb](https://img.shields.io/docker/v/izhaohucom/ci-tidb?style=for-the-badge)                     | ![ci-tidb](https://img.shields.io/microbadger/layers/izhaohucom/ci-tidb?style=for-the-badge)                     | ![ci-tidb](https://img.shields.io/docker/image-size/izhaohucom/ci-tidb?style=for-the-badge)                     |
| flutter           | ![flutter](https://img.shields.io/docker/v/izhaohucom/flutter?style=for-the-badge)                     | ![flutter](https://img.shields.io/microbadger/layers/izhaohucom/flutter?style=for-the-badge)                     | ![flutter](https://img.shields.io/docker/image-size/izhaohucom/flutter?style=for-the-badge)                     |
| go-dev            | ![go-dev](https://img.shields.io/docker/v/izhaohucom/go-dev?style=for-the-badge)                       | ![go-dev](https://img.shields.io/microbadger/layers/izhaohucom/go-dev?style=for-the-badge)                       | ![go-dev](https://img.shields.io/docker/image-size/izhaohucom/go-dev?style=for-the-badge)                       |
| node              | ![node](https://img.shields.io/docker/v/izhaohucom/node?style=for-the-badge)                           | ![node](https://img.shields.io/microbadger/layers/izhaohucom/node?style=for-the-badge)                           | ![node](https://img.shields.io/docker/image-size/izhaohucom/node?style=for-the-badge)                           |
| protogen          | ![protogen](https://img.shields.io/docker/v/izhaohucom/protogen?style=for-the-badge)                   | ![protogen](https://img.shields.io/microbadger/layers/izhaohucom/protogen?style=for-the-badge)                   | ![protogen](https://img.shields.io/docker/image-size/izhaohucom/protogen?style=for-the-badge)                   |

## License

**APACHE LICENSE, VERSION 2.0**
