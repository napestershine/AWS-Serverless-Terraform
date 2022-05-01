resource "aws_iam_user" "circleci" {
  name = var.user
  path = "/system/"
}

resource "aws_iam_access_key" "circleci" {
  user = aws_iam_user.circleci.name
}

#data "template_file" "circleci_policy" {
#  template = file("circleci_s3_access.tpl.json")
#  vars = {
#    s3_bucket_arn = aws_s3_bucket.app.arn
#  }
#}

#resource "local_file" "circle_credentials" {
#  filename = "tmp/circleci_credentials"
#  content  = "${aws_iam_access_key.circleci.id}\n${aws_iam_access_key.circleci.secret}"
#}

#resource "aws_iam_user_policy" "circleci" {
#  name   = "AllowCircleCI"
#  user   = aws_iam_user.circleci.name
#  policy = data.template_file.circleci_policy.rendered
#}

resource "aws_s3_bucket" "terraform_state" {
  bucket_prefix = "circle-ci-backend-"
  # Enable versioning so we can see the full revision history of our
  # state files
  force_destroy = true
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
