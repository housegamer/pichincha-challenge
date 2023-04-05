resource "aws_launch_template" "pichincha_challenge_ec2_template" {
  image_id      = var.ami
  instance_type = "t2.micro"
  user_data     = filebase64("./scripts/instance-init.sh")
  for_each = var.az
  iam_instance_profile {
    name = aws_iam_role.pichincha_challenge_role.name
  }

  network_interfaces {
    security_groups = [aws_security_group.pichincha_challenge_sg.id]
    subnet_id       = each.key
  }

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 8
    }
  }
  tags = {
    Name = "pichincha-challenge-rest-api"
    name = "pichincha challenge"
  }
}

resource "aws_instance" "pichincha_challenge_ec2_server" {
  for_each = var.az
  launch_template {
    id = aws_launch_template.pichincha_challenge_ec2_template[each.key].id
  }

  tags = {
    "Name" = "pichincha-challenge-ec2-server"
  }
}