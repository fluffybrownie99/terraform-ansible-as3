terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
  }
  required_version = ">= 1.3.0"
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-west-2"
    dynamodb_table = "mytable"
  }
}

provider "aws" {
  region = "us-west-2"
}