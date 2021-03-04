#!/bin/bash

# Prereqs and docker
sudo apt-get update &&
    sudo apt-get install -yqq \
        curl \
        git \
        apt-transport-https \
        ca-certificates \
        gnupg-agent \
        software-properties-common 1>&2 >/dev/null

# Install Docker repository and keys
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 1>&2 >/dev/null

sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable" &&
    sudo apt-get update &&
    sudo apt-get install docker-ce docker-ce-cli containerd.io -yqq 1>&2 >/dev/null

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
    sudo chmod +x /usr/local/bin/docker-compose &&
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose 1>&2 >/dev/null

#docker sudo
sudo groupadd docker 1>&2 >/dev/null
sudo usermod -aG docker $USER 1>&2 >/dev/null
#sudo newgrp docker 1>&2 >/dev/null
#sudo su ubuntu

# login to docker
cat $HOME/wirehole/docker-hub.txt | sudo docker login --username sachgbhatiya --password-stdin 1>&2 >/dev/null

# wirehole
docker-compose up 1>&2 >/dev/null