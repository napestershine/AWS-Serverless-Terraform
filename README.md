# AWS Serverless Infrastructure with CircleCI

This is a demo project. Its not ready for production use. You can use it on your own risk.

## Setup 

1. Fork the reposirtoy
2. Clone repository on local.
3. Install aws-cli and configure it.
4. Install terraform.

## CI/CD

1. CI/CD is configured by CircleCI
2. Login or sign up in to CicleCI with github
3. Select repository and selected config.yaml 
4. Add enviornment variable for aws credentials

## What it does

1. Terraform creates the base infrastrcuture in AWS
2. Lambda function is used for serverless application
3. CicleCI is used for CI/CD


