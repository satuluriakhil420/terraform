variable "iam_role_arn" {
  description = "The ARN of the IAM role"
  type        = string
}

variable "bucket_name" {
  description = "The Name of s3 destination bucker"
  type        = string
}

variable "crawlers" {
  description = "List of crawlers"
  type = list(object({
    name       = string
    s3_targets = list(string)
    db_name    = string
  }))
  default = [
    {
      name       = "ens360-dashboard-crawler-dev-01"
      s3_targets = [
        "s3://dashboard-sl-non-prod-345/Ensure360/dev/ens360-transformations-dev/sl/",
        "s3://dashboard-sl-non-prod-345/Ensure360/dev/ens360-transformations-dev/display_names/",
        "s3://dashboard-sl-non-prod-345/Ensure360/dev/ens360-transformations-dev/resident_care_type/",
        "s3://dashboard-sl-non-prod-345/Ensure360/dev/ens360-transformations-dev/sl/loc_hierarchy_alarms/",
        "s3://dashboard-sl-non-prod-345/Ensure360/dev/ens360-transformations-dev/sl/loc_hierarchy_outlier_alarms/",
        "s3://dashboard-sl-non-prod-345/Ensure360/dev/ens360-transformations-dev/onboarded_data/",
        "s3://dashboard-sl-non-prod-345/Ensure360/dev/ens360-transformations-dev/peer_groups/",
        "s3://dashboard-sl-non-prod-345/Ensure360/dev/ens360-transformations-dev/c1/",
        "s3://dashboard-sl-non-prod-345/rls/dev/personalized_email_rls/",
        "s3://dashboard-sl-non-prod-345/rls/dev/rls/"
      ]
      db_name = "ens360-dashboard-db-dev-01"
    }
  ]
}

