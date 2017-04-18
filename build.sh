#!/bin/bash
#
# Build jenkins image with docker excutable
#
set -ex

cat << 'EOF' | docker build -t jenkins-docker -
FROM jenkinsci/blueocean

ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 17.04.0-ce
ENV DOCKER_SHA256 c52cff62c4368a978b52e3d03819054d87bcd00d15514934ce2e0e09b99dd100

USER root

RUN set -x \
  && apk add --no-cache ca-certificates curl openssl py-pip \
  && curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
  && echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
  && tar -xzvf docker.tgz \
  && mv docker/* /usr/local/bin/ \
  && rmdir docker \
  && rm docker.tgz \
  && docker -v \
  && pip install docker-compose
EOF
