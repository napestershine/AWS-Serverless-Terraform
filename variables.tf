variable "aws_region" {
  description = "AWS region to be used"
  default     = "us-east-1"
}

variable "user" {
  description = "AWS IAM user"
  default = "circleci"
}
