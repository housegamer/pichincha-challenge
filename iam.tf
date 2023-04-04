resource "aws_iam_role_policy" "pichincha_challenge_role_policy" {
  name = "temp_admin_instance_profile_policy"
  role = aws_iam_role.pichincha_challenge_role.id

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:*",
                "ec2:*",
                "ecr:*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
})
}

resource "aws_iam_role" "pichincha_challenge_role" {
  name = "temp_admin_instance_profile_role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  })
}