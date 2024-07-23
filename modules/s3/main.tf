resource "aws_s3_bucket" "example" {
  bucket = var.bucketname
  acl    = "private"
}
