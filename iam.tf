resource "aws_iam_role" "role_App" {
  name = "role-App"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            Action = "stst:AssumeRole"
            Effect = "Allow"
            Principal= {
                Service = "lambda.amazonaws.com"
            }
        }
    ]
  })
}

resource "aws_iam_policy" "policy_App" {
  name = "policy-App"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            Action = "lambda:InvokeFunction"
            Effect = "Allow"
            Resource = aws_lambda_function.lambda_func_App.arn
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "role_policy_attach_App" {
  policy_arn = aws_iam_policy.policy_App.arn
  role = aws_iam_role.role_App.name
}