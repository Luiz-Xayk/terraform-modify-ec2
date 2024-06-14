resource "aws_cloudwatch_event_rule" "schedule_rule" {
  name        = "modify-instance-schedule"
  description = "Schedule rule to modify EC2 instance"
  schedule_expression = "cron(0 10 * * ? *)" # Altere para a expressão CRON desejada
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.schedule_rule.name
  target_id = "lambda-function"
  arn       = aws_lambda_function.modify_instance.arn

  input = jsonencode({
    instanceRegion = "your-instance-region",
    instanceId     = "instance-id",
    instanceType   = "instance-type"
  })
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.modify_instance.arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.schedule_rule.arn
}
