resource "aws_lambda_function" "DocumentHandler" {
  function_name = "DocumentHandler"

  filename = "../lambda/document"
}