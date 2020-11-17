FROM izhaohucom/protogen AS protogen

FROM cirrusci/flutter:1.20.4

ENV HOME=/root

COPY --from=protogen \
    /usr/local/bin/protoc \
    /usr/local/bin/

COPY --from=protogen \
    /opt/protobuf-src \
    /tmp/protobuf-src

COPY \
    init.gradle \
    gradle.properties \
    $HOME/.gradle/

ENV \
    PATH=$PATH:$HOME/.pub-cache/bin \
    PUB_HOSTED_URL=https://pub.flutter-io.cn \
    FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn \
    GRADLE_OPTS="-Dorg.gradle.parallel=true -Dorg.gradle.daemon=false"

RUN sdkmanager "platforms;android-28" "build-tools;28.0.3" "platforms;android-29" "build-tools;29.0.3" 1>/dev/null \
    && GRADLE_VERSION=5.6.2 && GRADLE_PATH=$HOME/.gradle/wrapper/dists/gradle-$GRADLE_VERSION-all/9st6wgf78h16so49nn74lgtbb \
    && mkdir -p $GRADLE_PATH && cd $GRADLE_PATH \
    && wget -q https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-all.zip \
    && cd /tmp/protobuf-src && pub global activate protoc_plugin 19.1.0 \
    && rm -rf /tmp/*
