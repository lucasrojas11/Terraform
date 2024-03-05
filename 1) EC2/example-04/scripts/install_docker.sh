#!/bin/bash

#Installation script for Docker and Docker Compose
#Reference: https://docs.docker.com/engine/install/ubuntu/

set -x

#We update the repositories
apt update 

#We install the necessary packages for apt to use HTTPS repositories
apt install -y \
    ca-certificates \
    curl \
    gnupg\
    lsb-release

#We add the official GPG key of Docker
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#We add the official Docker repository to our system
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#We update the package list
apt update

#We install the latest version of Docker and Docker Compose
apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

#We add the current user to the docker group
usermod -aG docker %USER

#We enable the Docker service to start automatically when the system boots
systemctl enable docker

#We start the Docker service
systemctl start docker

