terraform {
  required_version = ">= 1.14.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# ---------------------------------------------------------
# PRIMARY AWS ACCOUNT / REGION
# ---------------------------------------------------------

provider "aws" {
  region = var.primary_region
}

# ---------------------------------------------------------
# SECONDARY REGION
# Same AWS account, different region
# ---------------------------------------------------------

provider "aws" {
  alias  = "secondary"
  region = var.secondary_region
}

# ---------------------------------------------------------
# SECOND AWS ACCOUNT
#
# This provider represents another AWS account.
#
# The role_arn should point to a role that exists in the
# second account and can be assumed by the first account.
# ---------------------------------------------------------

provider "aws" {
  alias = "secondary_account"

  region = var.primary_region

  assume_role {
    role_arn = var.secondary_account_role_arn
  }
}