#!/usr/bin/env bash

set -e

NAME=$1

cd "./${NAME}"

echo -e "\033[34m[ Start '${NAME}' ]\033[0m"

docker build --force-rm --compress -t registry.cn-shanghai.aliyuncs.com/vsi-open/"${NAME}":latest .

echo -e "\033[32m[ Login Aliyun Docker ]\033[0m"
docker login -u "${ALIYUN_DOCKER_USERNAME}" -p "${ALIYUN_DOCKER_PASSWORD}" registry.cn-shanghai.aliyuncs.com
echo -e "\033[32m[ Publish Aliyun Docker ]\033[0m"
docker push registry.cn-shanghai.aliyuncs.com/vsi-open/"${NAME}":latest

echo -e "\033[34m[ End '${NAME}' ]\033[0m"

cd "../"
