resource "aws_internet_gateway" "pichincha_challenge_igw" {
  vpc_id = aws_vpc.pichincha_challenge_vpc.id

  tags = {
    Name = "pichincha-challenge-igw"
    name  = "pichincha challenage igw"
  }
}
