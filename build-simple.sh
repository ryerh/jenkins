#!/bin/bash
#
# Build jenkins image with docker excutable
#
set -x

cat << 'EOF' | docker build -t jenkins-docker-simple -
FROM jenkins:alpine
USER root
RUN apk add --no-cache docker
EOF
