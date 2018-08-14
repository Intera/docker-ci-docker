FROM ubuntu:18.04

RUN apt-get update \
	&& apt-get dist-upgrade -y

RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

RUN apt-get update \
    && apt-get install -y docker-ce

RUN curl -L --fail https://github.com/docker/compose/releases/download/1.22.0/run.sh -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

RUN apt-get purge -y apt-transport-https software-properties-common \
	&& apt-get --purge -y autoremove \
	&& apt-get autoclean \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
