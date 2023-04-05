resource "aws_route_table" "pichincha_challenge_rtb" {
  vpc_id = aws_vpc.pichincha_challenge_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pichincha_challenge_igw.id
  }

  tags = {
    "Name" = "pichincha-challenge-rtb"
  }
}

resource "aws_route_table_association" "pichincha_challenge_rtb_association" {
  for_each = var.az
  subnet_id      = aws_subnet.pichincha_challenge_sn[each.key].id
  route_table_id = aws_route_table.pichincha_challenge_rtb.id
}