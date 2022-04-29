resource "aws_lambda_function" "DocumentHandler" {
  function_name = "DocumentHandler"
  filename      = "../lambda/document_lambda.zip"
  handler       = "document.lambda_Handler"
  runtime       = "python3.10"
  environment {
    variables = {
      REGION         = var.aws_region
      DOCUMENT_TABLE = aws_dynamodb_table.document_table.name
    }
  }
  source_code_hash = filebase64sha256("../lambda/document_lambda.zip")
  role             = aws_iam_role.DocumentLambdaRole.arn
  timeout          = "60"
  memory_size      = "128"
}
