resource "aws_launch_template" "pichincha_challenge_ec2_template" {
  image_id      = var.ami
  instance_type = "t2.micro"
  user_data     = filebase64("./scripts/instance-init.sh")
  iam_instance_profile {
    name = aws_iam_role.pichincha_challenge_role.name
  }

  network_interfaces {
    security_groups = [aws_security_group.pichincha_challenge_sg.id]
    subnet_id       = aws_subnet.pichincha_challenge_sn.us-east-1a.id
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
  launch_template {
    id = aws_launch_template.pichincha_challenge_ec2_template.id
  }

  tags = {
    "Name" = "pichincha-challenge-ec2-server"
  }
}