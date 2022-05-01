terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.12.1"
    }
  }
}

provider "aws" {
  # Configuration options
  shared_credentials_files = ["$HOME/.aws/credentials"]
  profile                  = "default"
  region                   = var.aws_region
}