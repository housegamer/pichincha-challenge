resource "aws_s3_bucket" "tf-state-bucket" {
  bucket = "tf-state-bucket123"
  acl    = "private"
}