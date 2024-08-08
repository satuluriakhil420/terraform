resource "aws_glue_job" "glue_job" {
  count                     = length(var.glue_job_script_locations)
  name                      = element(var.glue_job_script_locations, count.index)
  role_arn                  = var.iam_role_arn
  command {
    script_location         = " "
  }

lifecycle {
    ignore_changes = [
      # Ignore changes to the description attribute
      "description",
      "script_location"
    ]
  }

}



output "glue_job_names" {
  value = aws_glue_job.glue_job[*].name
}
