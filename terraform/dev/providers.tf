terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }

  backend "s3" {
    bucket  = "infra-practice-s3"
    key     = "dev/terraform.tfstate"
    region  = "us-west-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.aws_region
}
