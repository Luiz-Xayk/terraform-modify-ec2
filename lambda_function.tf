data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda_function.js"
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_lambda_function" "modify_instance" {
  filename         = data.archive_file.lambda_zip.output_path
  function_name    = "modify-instance"
  role             = aws_iam_role.lambda_role.arn
  handler          = "index.handler"
  runtime          = "nodejs16.x"
  timeout          = 600
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = {
      INSTANCE_REGION = "your-instance-region"
      INSTANCE_ID     = "instance-id"
      INSTANCE_TYPE   = "instance-type"
    }
  }
}
