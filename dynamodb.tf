resource "aws_dynamodb_table" "document_table" {
  name         = "DOCUMENTS"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "document_id"

  attribute {
    name = "document_id"
    type = "S"
  }

  attribute {
    name = "extension"
    type = "S"
  }

  attribute {
    name = "mime_type"
    type = "S"
  }

  global_secondary_index {
    name            = "DocumentIndex"
    hash_key        = "extension"
    range_key       = "mime_type"
    projection_type = "ALL"
  }

  tags = {
    Name = "ServerlessApp"
  }
}