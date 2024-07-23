provider "aws" {
  region = var.region
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = var.lambda_source_file
  output_path = var.lambda_output_path
}

resource "aws_lambda_function" "test_lambda" {
  filename      = data.archive_file.lambda.output_path
  function_name = var.lambda_function_name
  role          = var.lambda_role_arn
  handler       = var.lambda_handler
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime       = var.lambda_runtime

  environment {
    variables = var.lambda_environment_vars
  }
}
