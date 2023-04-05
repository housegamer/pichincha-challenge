resource "aws_vpc" "pichincha_challenge_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    "Name" = "pichincha-challenge-vpc",
    "name" = "rest api server"
  }
}

resource "aws_subnet" "pichincha_challenge_sn" {
  vpc_id                  = aws_vpc.pichincha_challenge_vpc.id
  for_each                = var.az
  cidr_block              = cidrsubnet(aws_vpc.pichincha_challenge_vpc.cidr_block, 2, each.value)
  availability_zone       = each.key
  map_public_ip_on_launch = var.az == "us-east-1a" ? true : false

  tags = {
    "Name" = "pichincha-challenge-${each.key}",
    "name" = "pichincha challenge sn"
  }
}