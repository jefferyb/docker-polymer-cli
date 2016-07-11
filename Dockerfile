############################################################
# Dockerfile to build Polymer-CLI container images
# Based on node:4-slim
############################################################

# Set the base image to node:4-slim
FROM node:4-slim

# File Author / Maintainer
MAINTAINER Jeffery Bagirimvano <jeffery.rukundo@gmail.com>

# ENV for Polymer-CLI
ENV POLYMER_CLI_HOME /home/polymer
ARG user=polymer
ARG group=polymer
ARG uid=1000
ARG gid=1000

# Polymer is run with user `polymer`, uid = 1000
# If you bind mount a volume from the host or a data container, 
# ensure you use the same uid
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$POLYMER_CLI_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

# app folder under the polymer home directory is a volume, so configuration and build history 
# can be persisted and survive image upgrades
VOLUME /home/polymer/app


# Update the repository sources list
RUN apt-get update

################## BEGIN INSTALLATION ######################
# Install git, bower and polymer-cli

RUN apt-get install -y --no-install-recommends \
		git \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& npm install -g \
		bower \
		polymer-cli

# Switch the default user to polymer
USER ${user}

##################### INSTALLATION END #####################

# Expose the default port
EXPOSE 8080

# Sets the working directory
RUN mkdir -p /home/polymer/app
WORKDIR /home/polymer/app

# Set the default command
CMD polymer serve --hostname "0.0.0.0" --port 8080
