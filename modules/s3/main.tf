resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucketname
  acl    = "private"
}

data "aws_s3_bucket" "existing" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_ownership_controls" "aws_s3_bucket_ownership_controls" {
  depends_on = [aws_s3_bucket.s3_bucket]

  bucket = data.aws_s3_bucket.existing.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "aws_s3_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.aws_s3_bucket_ownership_controls
  ]

  bucket = data.aws_s3_bucket.existing.id
  acl    = "private"
}
