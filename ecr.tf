resource "aws_ecr_repository" "Pichincha_Challenge" {
  name = "pichincha-challenge"
  
  image_scanning_configuration {
    scan_on_push = true
  }
}