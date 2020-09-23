#!/usr/local/bin/bash

repo_path="yks0000"
image_name="nginx-slim"
# shellcheck disable=SC2002
base_version=$(cat Dockerfile | grep FROM | awk -F':' '{print $2}')
version=${base_version}-$(cat VERSION)

docker tag ${image_name}:"${version}" docker.pkg.github.com/yks0000/nginx-slim/${image_name}:"${version}"
docker push docker.pkg.github.com/yks0000/nginx-slim/${image_name}:"${version}"