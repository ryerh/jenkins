#!/bin/bash
#
# Build jenkins image with docker excutable
#
set -ex

DOCKER_VERSION="17.03"
JENKINS_BASE_IMAGE="jenkinsci/blueocean"
BUILD_IMAGE_NAME="jenkins-docker"

if [[ ! -e docker/$DOCKER_VERSION ]]; then
  git submodule init
  git submodule update
fi

cd docker/$DOCKER_VERSION
sed "s/FROM .*/FROM $JENKINS_BASE_IMAGE\nUSER root/" Dockerfile > Dockerfile.tmp
docker build -t $BUILD_IMAGE_NAME -f Dockerfile.tmp .
rm -f Dockerfile.tmp
