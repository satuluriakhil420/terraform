resource "aws_iam_role" "sentrics_role" {
  name       = var.rolename

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "glue.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "s3_role_attachment" {
  role       = aws_iam_role.sentrics_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "glue_role_attachment" {
  role       = aws_iam_role.sentrics_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}
resource "aws_iam_role_policy_attachment" "gluenotebook_policy_attachment" {
  role       = aws_iam_role.sentrics_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceNotebookRole"
}

resource "aws_iam_role_policy_attachment" "glueconsole_policy_attachment" {
  role       = aws_iam_role.sentrics_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSGlueConsoleFullAccess"
}

resource "aws_iam_role_policy_attachment" "service_catalog_policy_attachment" {
  role       = aws_iam_role.sentrics_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSServiceCatalogAdminFullAccess"
}

resource "aws_iam_role_policy_attachment" "athena_policy_attachment" {
  role       = aws_iam_role.sentrics_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAthenaFullAccess"
}

resource "aws_iam_role_policy_attachment" "quicksight_policy_attachment" {
  role       = aws_iam_role.sentrics_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSQuicksightAthenaAccess"
}

