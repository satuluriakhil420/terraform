resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucketname
  acl    = "private"
}

resource "aws_s3_bucket_ownership_controls" "aws_s3_bucket_ownership_controls" {
  depends_on = [aws_s3_bucket.s3_bucket]

  bucket = var.bucketname

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "aws_s3_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.aws_s3_bucket_ownership_controls
  ]

  bucket = var.bucketname
  acl    = "private"
}
lifecycle {
  ignore_changes = all
}
