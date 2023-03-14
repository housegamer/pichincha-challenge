#!/bin/bash

set -e

chmod +x "$0"

# install dependendcies
sudo apt update
sudo apt upgrade -y
sudo apt install awscli -y
sudo apt install docker.io -y

sudo mkdir ~/.aws && touch ~/.aws/credentials
echo "[dev-practice]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
region = us-east-1" >> ~/.aws/credentials 

export AWS_PROFILE=dev-practice

aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin 446427957983.dkr.ecr.us-east-1.amazonaws.com

sudo docker pull 446427957983.dkr.ecr.us-east-1.amazonaws.com/pichincha-challenge:latest

sudo docker run -p 80:8080 446427957983.dkr.ecr.us-east-1.amazonaws.com/pichincha-challenge:$IMAGE_TAG