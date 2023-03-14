provider "aws" {
  region                   = "us-east-1"
  # shared_config_files      = ["/Users/rodrigo.delcastillo/.aws/config"]
  # shared_credentials_files = ["/Users/rodrigo.delcastillo/.aws/credentials"]
  # profile                  = "dev-practice"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}