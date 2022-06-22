#!/usr/bin/env bash
export DOCKER_BUILDKIT=1
short_sha=$(git rev-parse --short HEAD)
github_token=$1
github_user=$2
tag=$3
repository=${4:-"ghcr.io/huma-engineering/py-ppserver"}
registry=${5:-"ghcr.io"}
source=${6:-"https://github.com/huma-engineering/py-phoenix-server"}
dockerfile=${7:-"docker/ppserver/Dockerfile"}

echo ${github_token} | \
     ${registry} -u ${github_user} --password-stdin
docker build . --cache-from ${repository}:latest \
    -f ${dockerfile} \
    -t ${repository}:${tag} \
    --build-arg=GIT_COMMIT=${short_sha} \
    --label commit=${short_sha} \
    --label org.opencontainers.image.source=${source}
docker push ${repository}:${tag}
