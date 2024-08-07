variable "state_machines" {
  description = "List of state machines"
  type = list(object({
    name       = string
    definition = string
  }))
}

variable "role_arn" {
  description = "ARN of the IAM role for Step Functions"
  type        = string
}
