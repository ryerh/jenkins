#!/bin/bash
#
# Build jenkins image with docker excutable
#
set -ex

mkdir -p /var/jenkins_home

docker run $@ \
  -it \
  -p 8080:8080 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/jenkins_home:/var/jenkins_home \
  --name jenkins-docker-simple \
  jenkins-docker \
  tini -- /usr/local/bin/jenkins.sh
