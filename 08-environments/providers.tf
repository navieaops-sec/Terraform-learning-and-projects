# ---------------------------------------------------------
# Terraform configuration
# ---------------------------------------------------------
terraform {
  # Terraform CLI version required for this project
  required_version = ">= 1.14.0, < 2.0.0"

  # Provider requirements
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# ---------------------------------------------------------
# AWS Provider
# ---------------------------------------------------------
# AWS credentials are NOT hardcoded here.
# Terraform uses the AWS credential/provider chain.
#
# Example:
# AWS CLI credentials
# Environment variables
# IAM role
# OIDC
# etc.
# ---------------------------------------------------------
provider "aws" {
  region = var.aws_region
}