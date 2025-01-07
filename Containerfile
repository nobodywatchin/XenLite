FROM ghcr.io/ublue-os/ccos:latest
## Other possible base images include:
# Fedora base image: quay.io/fedora/fedora-bootc:41
# CentOS base images: quay.io/centos-bootc/centos-bootc:stream10

COPY build.sh /tmp/build.sh

COPY etc /etc

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    bootc container lint
