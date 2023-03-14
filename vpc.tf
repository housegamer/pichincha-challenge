resource "aws_vpc" "pichincha_challenge_vpc" {
  cidr_block       = "10.16.0.0/24"
  instance_tenancy = "default"

  tags = {
    "Name" = "pichincha-challenge-vpc",
    "name" = "rest api server"
  }
}

resource "aws_subnet" "pichincha_challenge_sn" {
  vpc_id                  = aws_vpc.pichincha_challenge_vpc.id
  cidr_block = "10.16.0.128/25"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "pichincha-challenge-public-sn",
    "name" = "pichincha challenge sn"
  }
}