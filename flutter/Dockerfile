FROM izhaohucom/protogen AS protogen

FROM cirrusci/flutter:1.20.4

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
    PUB_HOSTED_URL=https://pub.flutter-io.cn \
    FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn \
    PATH=$PATH:$HOME/.pub-cache/bin \
    GRADLE_OPTS="-Dorg.gradle.parallel=true -Dorg.gradle.daemon=false"

RUN sdkmanager "platforms;android-28" "build-tools;28.0.3" "platforms;android-29" "build-tools;29.0.3" 1>/dev/null \
    && GRADLE_VERSION=6.1.1 \
    && sudo mkdir -p $HOME/.gradle/wrapper/dists/gradle-$GRADLE_VERSION-all/cfmwm155h49vnt3hynmlrsdst \
    && cd $HOME/.gradle/wrapper/dists/gradle-$GRADLE_VERSION-all/cfmwm155h49vnt3hynmlrsdst \
    && sudo wget -q https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-all.zip \
    && sudo chown -R cirrus:cirrus $HOME/.gradle \
    && cd /tmp/protobuf-src && pub global activate protoc_plugin \
    && sudo rm -rf /tmp/*
