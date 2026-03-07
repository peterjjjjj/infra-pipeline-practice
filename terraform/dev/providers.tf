terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }

  # backend "s3" {
  #   bucket  = "TERRAFORM-S3-BUCKET"
  #   key     = "dev/terraform.tfstate"
  #   region  = aws_region
  #   encrypt = true
  # }
}

provider "aws" {
  region = var.aws_region
}
