resource "aws_ecr_repository" "pichincha_challenge_ecr" {
  name         = "pichincha-challenge"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}