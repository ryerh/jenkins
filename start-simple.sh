#!/bin/bash
#
# Build jenkins image with docker excutable
#
set -x

docker run --rm \
  -p 8080:8080 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins-docker-simple
