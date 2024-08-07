output "state_machine_arns" {
  value = { for sm in aws_sfn_state_machine.state_machines : sm.name => sm.arn }
}
