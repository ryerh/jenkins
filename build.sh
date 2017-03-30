#!/bin/bash
#
# Build jenkins image with docker excutable
#
set -ex

DOCKER_VERSION="17.03"
JENKINS_BASE_IMAGE="jenkins:alpine"
BUILD_IMAGE_NAME="jenkins-docker"

if [[ -e docker/$DOCKER_VERSION ]]; then
  cd docker/$DOCKER_VERSION
else
  echo "Invalid Dockerfile"
  exit 1
fi

sed "s/FROM .*/FROM $JENKINS_BASE_IMAGE/" Dockerfile | \
  docker build -t $BUILD_IMAGE_NAME -
