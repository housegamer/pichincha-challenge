variable "region" {
  default = "us-east-1"
}
variable "ami" {
  description = "ID of ubuntu AMI"
  type        = string
  default     = "ami-0557a15b87f6559cf"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type = string
  default = ""
}

variable "az" {
  description = "Subnet CIDR Block"
  type = map
  default = {
    "us-east-1a" = 1
    "us-east-1b" = 2
  }
}