#!/bin/bash

set -xe

chmod +x "$0"

# install dependendcies
sudo apt update
sudo apt upgrade -y
sudo apt install awscli -y
sudo apt install docker.io -y

sudo mkdir ~/.aws && sudo touch ~/.aws/credentials
sudo chmod 666 ~/.aws/credentials && sudo chown ubuntu:ubuntu ~/.aws/credentials
echo "[dev-practice]
aws_access_key_id = AKIAWP4JOBLPVXMFPM4I
aws_secret_access_key = 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
region = us-east-1" >> ~/.aws/credentials 

export AWS_PROFILE=dev-practice

aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin 446427957983.dkr.ecr.us-east-1.amazonaws.com

sudo docker pull 446427957983.dkr.ecr.us-east-1.amazonaws.com/pichincha-challenge:$IMAGE_TAG

sudo docker run -p 80:8080 446427957983.dkr.ecr.us-east-1.amazonaws.com/pichincha-challenge:$IMAGE_TAG