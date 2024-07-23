variable "region" {
  description = "AWS region"
}

variable "role_name" {
  description = "Name of the IAM role"
}

variable "tags" {
  description = "Tags for the IAM role"
  type        = map(string)
}
