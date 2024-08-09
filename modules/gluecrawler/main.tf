resource "aws_glue_catalog_database" "glue_database" {
  for_each                  = toset([for crawler in var.crawlers : crawler.db_name])
  name                      = each.value
lifecycle {
  ignore_changes = all
}
}


resource "aws_glue_crawler" "glue_crawler" {
  for_each                  = { for crawler in var.crawlers : crawler.name => crawler }

  database_name             = aws_glue_catalog_database.glue_database[each.value.db_name].name
  name                      = each.value.name
  role                      = var.iam_role_arn

  dynamic "s3_target" {
    for_each                = each.value.s3_targets
    content {
      path                  = s3_target.value
    }
  }
lifecycle {
  ignore_changes = all
}
}

