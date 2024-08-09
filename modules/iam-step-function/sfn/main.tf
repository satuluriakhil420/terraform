resource "aws_sfn_state_machine" "state_machines" {
  for_each = { for sm in var.state_machines : sm.name => sm }

  name       = each.value.name
  role_arn   = var.role_arn
  definition = each.value.definition
lifecycle {
  ignore_changes = all
}
}

