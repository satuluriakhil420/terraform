module "iam" {
  source = "./iam"
}

module "gluejob" {
  source = "./gluejob"
  iam_role_arn = module.iam.myrole_arn
  glue_job_script_locations = local.glue_job_script_locations
}

module "gluecrawler" {
  source = "./gluecrawler"
  iam_role_arn = module.iam.myrole_arn
  bucket_name  = module.s3.bucket_name
}

module "s3" {
  source = "./s3"
}

data "aws_s3_bucket" "existing" {
  bucket = "dashboard-sl-non-prod-345"
  depends_on = [module.s3]
}

resource "aws_s3_bucket_ownership_controls" "example" {
  depends_on = [module.s3]

  bucket = data.aws_s3_bucket.existing.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    module.s3
  ]

  bucket = data.aws_s3_bucket.existing.id
  acl    = "private"
}

module "lambda_iam_role" {
  source = "./lambda/lambda_iam_role"

  region    = "us-east-1"
  role_name = "lambda"
  tags      = {
    Environment = "Dev"
    Project     = "Sentrics"
  }
}

module "lambda_function" {
  source = "./lambda/lambda_function"

  region                  = "us-east-1"
  lambda_function_name    = "ensure360-dashboard-qs-dev-dev-01"
  lambda_role_arn         = module.lambda_iam_role.role_arn
  lambda_source_file      = "./lambda.js"  
  lambda_output_path      = "./lambda_function_payload.zip"
  lambda_handler          = "lambda.handler"
  lambda_runtime          = "nodejs18.x"
  lambda_environment_vars = {
    environment = "dev"
  }
}


