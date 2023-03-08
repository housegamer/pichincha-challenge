resource "aws_s3_bucket" "pichincha_challenge" {
  bucket = "pichincha-challenge123"

	tags = {
		"Name" = "Pichincha Challenge"
	}
}