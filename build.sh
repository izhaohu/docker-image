#!/usr/bin/env bash

set -e

echo -e "\033[34m[ Start ]\033[0m"

echo -e "\033[32m[ Login ]\033[0m"
docker login -u "${DOCKER_USERNAME}" -p "${DOCKER_PASSWORD}"

VERSION=v1.18.10
echo -e "\033[32m[ ${VERSION} ]\033[0m"

wget -qO ./kubeadm https://storage.googleapis.com/kubernetes-release/release/$VERSION/bin/linux/amd64/kubeadm
chmod +x ./kubeadm

repositories=$(./kubeadm config images list --kubernetes-version=$VERSION)

echo "${repository}"

while IFS='/' read -r user repository; do
  echo -e "\033[34m[ ${repository} ]\033[0m"
  echo -e "\033[32m[ Pull ]\033[0m"
  docker pull "${user}"/"${repository}"
  docker tag "${user}"/"${repository}" izhaohucom/"${repository}"
  echo -e "\033[32m[ Push ]\033[0m"
  docker push izhaohucom/"${repository}"
done <<<"${repositories}"

echo -e "\033[34m[ End ]\033[0m"
