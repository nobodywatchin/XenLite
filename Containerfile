ARG MAJOR_VERSION="${MAJOR_VERSION:-stream10}"

FROM ghcr.io/ublue-os/config:latest@sha256:72c994ea9c6cccf726378afc84ca51598f6dfa93d545e5b7dafc42ce3c04ede9 AS config
FROM quay.io/centos-bootc/centos-bootc:$MAJOR_VERSION

## Other possible base images include:
# FROM ghcr.io/ublue-os/ccos:latest
# Fedora base image: quay.io/fedora/fedora-bootc:41
# CentOS base images: quay.io/centos-bootc/centos-bootc:stream10

COPY build.sh /tmp/build.sh

# COPY etc /etc

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    bootc container lint
