#!/usr/bin/env bash
short_sha=$(git rev-parse --short HEAD)
echo ${github_token} | \
     ${registry} -u ${github_user} --password-stdin
docker build . --cache-from ${repository}:latest \
    -f ${dockerfile} \
    -t ${repository}:${tag} \
    --build-arg=GIT_COMMIT=${short_sha} \
    --label commit=${short_sha} \
    --label org.opencontainers.image.source=${source}
docker push ${repository}:${tag}
