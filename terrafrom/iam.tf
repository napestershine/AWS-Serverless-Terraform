resource "aws_iam_role" "DocumentLambdaRole" {
  name               = "DocumentLambdaRole"
  assume_role_policy = <<EOF
  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
  EOF
}

data "template_file" "documentlambdapolicy" {
  template = file("${path.module}/policy.json")
}

resource "aws_iam_policy" "DocumentLambdaPolicy" {
  name        = "DocumentLambdaPolicy"
  path        = "/"
  description = "IAM policy for document lambda function"
  policy      = data.template_file.documentlambdapolicy.rendered
}

resource "aws_iam_role_policy_attachment" "DocumentLambdaRolePolicy" {
  role       = aws_iam_role.DocumentLambdaRole.name
  policy_arn = aws_iam_policy.DocumentLambdaPolicy.arn
}
