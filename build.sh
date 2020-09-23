#!/usr/bin/env bash

repo_path="yks0000"
image_name="nginx-slim"
# shellcheck disable=SC2002
base_version=$(cat Dockerfile | grep FROM | awk -F':' '{print $2}')
version=${base_version}-$(cat VERSION)


docker build -t ${image_name}:"${version}" -f Dockerfile .
docker tag ${image_name}:"${version}" ${repo_path}/${image_name}:"${version}"
docker tag ${image_name}:"${version}" ${repo_path}/${image_name}:latest

docker push ${repo_path}/${image_name}:"${version}"
docker push ${repo_path}/${image_name}:latest
# shellcheck disable=SC2181
if [[ "$?" == 0 ]];then
    echo "${repo_path}/${image_name}:${version}" > LATEST_RELEASE
else
    exit 1;
fi