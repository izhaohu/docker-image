#!/usr/bin/env bash

set -e

NAME=${1}
VERSION=${2:-latest}

cd "./${NAME}"

echo -e "\033[34m[ Start '${NAME}' ]\033[0m"

docker build --force-rm --compress -t izhaohucom/"${NAME}:${VERSION}" .

echo -e "\033[32m[ Login Docker ]\033[0m"
docker login -u "${DOCKER_USERNAME}" -p "${DOCKER_PASSWORD}"
echo -e "\033[32m[ Publish Docker ]\033[0m"
docker push izhaohucom/"${NAME}:${VERSION}"

echo -e "\033[34m[ End '${NAME}' ]\033[0m"

cd "../"
