resource "aws_sfn_state_machine" "my_state_machine" {
  name     = var.state_machine_name
  role_arn = var.role_arn

  definition = jsonencode({
    Comment = "A Hello World example of the Amazon States Language using an AWS Lambda Function",
    StartAt = "HelloWorld",
    States = {
      HelloWorld = {
        Type     = "Pass",
        Result   = "Hello, World!",
        End      = true
      }
    }
  })
}
