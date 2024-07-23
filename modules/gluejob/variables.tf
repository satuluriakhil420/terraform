variable "iam_role_arn" {
  description = "The ARN of the IAM role"
  type        = string
}

variable "glue_job_script_locations" {
  type    = list(string)
}
