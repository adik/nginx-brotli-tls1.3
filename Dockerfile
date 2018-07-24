#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:16.04

# Install utils
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y curl git vim wget less

# Install dependencies
RUN \
  apt-get install gpgv2 && \
  apt-get install -y autotools-dev debhelper po-debconf dh-systemd libexpat-dev libgd-dev libgeoip-dev \
            libhiredis-dev libluajit-5.1-dev libmhash-dev libpam0g-dev libpcre3-dev \
            libperl-dev libssl-dev libxslt1-dev quilt zlib1g-dev
#
# rm -rf /var/lib/apt/lists/*

# Add files.
#ADD my-private-key.pem /root/my-private-key.pem

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
