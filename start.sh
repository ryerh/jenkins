#!/bin/bash
#
# Build jenkins image with docker excutable
#
set -x

docker run $@ \
  -p 8080:8080 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins-docker \
  tini -- /usr/local/bin/jenkins.sh
