resource "aws_iam_policy" "ec2_policy" {
  name        = "EC2_modify_policy"
  description = "Policy to allow EC2 instance modification"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:DescribeInstances",
          "ec2:CopySnapshot",
          "ec2:Describe*",
          "ec2:CreateTags",
          "ec2:*",
          "ec2:CreateSnapshot"
        ]
        Resource = "*"
      }
    ]
  })
}
