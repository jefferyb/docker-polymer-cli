###################################################################################
# Dockerfile to build a Polymer Dev Environment container images with Polymer-CLI
# Based on node:slim
#
# To build, do:
#   $ docker build -t jefferyb/polymer-cli .
#
###################################################################################

# Set the base image to node:slim
FROM node:slim

MAINTAINER Jeffery Bagirimvano <jeffery.rukundo@gmail.com>

ENV POLYMER_CLI_HOME /home/polymer
ARG user=polymer
ARG group=polymer

RUN useradd -d "$POLYMER_CLI_HOME" -U -m -s /bin/bash ${user}

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    apt-get clean && \
    npm install -g gulp bower polymer-cli --unsafe-perm 
RUN npm install -g generator-polymer-init-custom-build

USER ${user}

EXPOSE 8081

RUN mkdir -p /home/${user}/app

VOLUME /home/${user}/app

WORKDIR /home/${user}/app

CMD bash
