#!/bin/bash

set -xe

chmod +x "$0"

# install dependendcies
sudo apt update
sudo apt upgrade -y
sudo apt install awscli -y
sudo apt install docker.io -y

aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin 446427957983.dkr.ecr.us-east-1.amazonaws.com

sudo docker pull 446427957983.dkr.ecr.us-east-1.amazonaws.com/pichincha-challenge:$IMAGE_TAG

sudo docker run -p 80:8080 446427957983.dkr.ecr.us-east-1.amazonaws.com/pichincha-challenge:$IMAGE_TAG