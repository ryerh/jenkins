#!/bin/bash
#
# Build jenkins image with docker excutable
#
set -ex

docker run $@ \
  -it \
  -p 8080:8080 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --name jenkins-docker-simple \
  jenkins-docker \
  tini -- /usr/local/bin/jenkins.sh
