resource "aws_glue_catalog_database" "example" {
  for_each                  = toset([for crawler in var.crawlers : crawler.db_name])
  name                      = each.value
}


resource "aws_glue_crawler" "example" {
  for_each                  = { for crawler in var.crawlers : crawler.name => crawler }

  database_name             = aws_glue_catalog_database.example[each.value.db_name].name
  name                      = each.value.name
  role                      = var.iam_role_arn

  dynamic "s3_target" {
    for_each                = each.value.s3_targets
    content {
      path                  = s3_target.value
    }
  }
}
