FROM ubuntu:16.04

RUN apt-get update \
	&& apt-get dist-upgrade -y

RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

RUN apt-get update \
    && apt-get install -y docker-compose

RUN apt-get purge -y apt-transport-https ca-certificates curl software-properties-common \
	&& apt-get --purge -y autoremove \
	&& apt-get autoclean \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
