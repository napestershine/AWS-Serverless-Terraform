output "api_endpoint" {
  value = aws_api_gateway_stage.prod.invoke_url
}

output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
}
