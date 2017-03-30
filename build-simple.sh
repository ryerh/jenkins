#!/bin/bash
#
# Build jenkins image with docker excutable
#
set -ex

cat << 'EOF' | docker build -t jenkins-docker -
FROM jenkins:alpine
USER root
RUN apk add --no-cache docker
EOF
