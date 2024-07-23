output "myrole_arn" {
  description = "The ARN of myrole"
  value       = aws_iam_role.myrole.arn
}
