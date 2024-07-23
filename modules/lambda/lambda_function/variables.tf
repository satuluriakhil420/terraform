variable "region" {
  description = "AWS region"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
}

variable "lambda_role_arn" {
  description = "ARN of the IAM role for Lambda"
}

variable "lambda_source_file" {
  description = "Path to the Lambda function source code"
}

variable "lambda_output_path" {
  description = "Output path for Lambda function ZIP archive"
}

variable "lambda_handler" {
  description = "Lambda function handler"
}

variable "lambda_runtime" {
  description = "Lambda function runtime"
}

variable "lambda_environment_vars" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
}
