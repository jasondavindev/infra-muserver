provider "aws" {
  version = "~>2.8"
  region = "sa-east-1"
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
