resource "aws_api_gateway_rest_api" "document_apigw" {
  name        = "document_apigw"
  description = "Document API Gateway"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "document" {
  rest_api_id = aws_api_gateway_rest_api.document_apigw.id
  parent_id   = aws_api_gateway_rest_api.document_apigw.root_resource_id
  path_part   = "document"
}

resource "aws_api_gateway_method" "createdocument" {
  rest_api_id   = aws_api_gateway_rest_api.document_apigw.id
  resource_id   = aws_api_gateway_resource.document.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "document-lambda" {
  rest_api_id = aws_api_gateway_rest_api.document_apigw.id
  resource_id = aws_api_gateway_resource.document.id
  http_method = aws_api_gateway_method.createdocument.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.DocumentHandler.invoke_arn
}

resource "aws_lambda_permission" "apigw-DocumentHandler" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.DocumentHandler.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.document_apigw.execution_arn}/*/POST/document"
}

resource "aws_api_gateway_deployment" "prod" {
  depends_on = [
    aws_api_gateway_integration.document-lambda
  ]
  rest_api_id = aws_api_gateway_rest_api.document_apigw.id
}


resource "aws_api_gateway_stage" "prod" {
  deployment_id = aws_api_gateway_deployment.prod.id
  rest_api_id   = aws_api_gateway_rest_api.document_apigw.id
  stage_name    = "prod"
}