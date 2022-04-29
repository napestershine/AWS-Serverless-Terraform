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
