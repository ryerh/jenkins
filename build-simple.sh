#!/bin/bash
#
# Build jenkins image with docker excutable
#
set -ex

cat << 'EOF' | docker build -t jenkins-docker-simple -
FROM jenkinsci/blueocean

USER root

RUN set -ex \
  && apk add --no-cache docker py-pip \
  && pip install docker-compose
EOF
