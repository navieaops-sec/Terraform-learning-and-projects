/*
  ============================================================
  PROVIDER CONFIGURATION
  ============================================================

  This file defines:
  1. Terraform CLI version constraint
  2. AWS provider
  3. Random provider
  4. AWS provider alias

  Provider versions are controlled using version constraints.
*/

terraform {
  required_version = ">= 1.14.0, < 2.0.0"

  required_providers {

    # AWS provider - used to create AWS resources
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    # Random provider - used to generate a unique bucket suffix
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
  }
}


# ============================================================
# PRIMARY AWS PROVIDER
# ============================================================

provider "aws" {
  region = var.aws_region
}


# ============================================================
# SECONDARY AWS PROVIDER
# ============================================================
# Demonstrates provider aliasing.
# No resource is created using this provider in this project.

provider "aws" {
  alias  = "secondary"
  region = var.secondary_region
}


# ============================================================
# RANDOM PROVIDER
# ============================================================

provider "random" {}