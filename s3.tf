resource "aws_s3_bucket" "documents" {
  bucket = "documents-serverless-demo-api-app"

  tags = {
    Name        = "Serverless"
    Environment = "prod"
  }
}

resource "aws_s3_bucket_acl" "documents" {
  bucket = aws_s3_bucket.documents.id
  acl    = "private"
}
