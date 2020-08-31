#!/usr/bin/env bash

set -e

echo -e "\033[32m[ Login ]\033[0m"
docker login -u "${DOCKER_USERNAME}" -p "${DOCKER_PASSWORD}"

VERSION=v1.18.8
echo -e "\033[32m[ '${VERSION}' ]\033[0m"

wget -O /usr/local/bin/kubeadm https://storage.googleapis.com/kubernetes-release/release/$VERSION/bin/linux/amd64/kubeadm
chmod +x /usr/local/bin/kubeadm

repositories=$(kubeadm config images list --kubernetes-version=$VERSION)

for repository in "${repositories[@]}"; do
  echo -e "\033[34m[ '${repository}' ]\033[0m"
  docker pull k8s.gcr.io/"${repository}"
  docker tag k8s.gcr.io/"${repository}" izhaohucom/"${repository}"
  docker push izhaohucom/"${repository}"
done
