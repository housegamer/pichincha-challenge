variable "region" {
  default = "us-east-1"
}
variable "ami" {
  description = "ID of ubuntu AMI"
  type        = string
  default     = "ami-0557a15b87f6559cf"
}

variable "vpc_cidr_block" {
  description = "Default VPC CIDR block"
  type = string
  default = "10.16.0.0/24"
}

variable "az" {
  description = "Default Availability Zone "
  type = map
  default = {
    "us-east-1a" = 1
    "us-east-1b" = 2
  }
}