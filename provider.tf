provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "api-testing123"
    key    = "./terraform.tfstate"
    region = "us-east-1"
  }
}