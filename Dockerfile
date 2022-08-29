FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

COPY install_docker.sh /opt/install_docker.sh

RUN bash /opt/install_docker.sh

RUN COMPOSE_VERSION="$(curl --silent "https://api.github.com/repos/docker/compose/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')" \
    && sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose" \
    && chmod +x /usr/local/bin/docker-compose
