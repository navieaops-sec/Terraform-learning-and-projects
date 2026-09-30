/*
  ============================================================
  LOCAL VALUES
  ============================================================

  Locals are reusable values calculated inside Terraform.

  This project uses:
  - common_tags for reusable resource tags
  - bucket_prefix for constructing the bucket name
  - lower() Terraform function to convert the bucket name
    and environment to lowercase
*/

locals {

  # Common tags applied to the S3 bucket

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }


  # Create a reusable bucket name prefix.
  #
  # lower() is a Terraform built-in function.
  # It converts the supplied string to lowercase.
  #
  # Example:
  # bucket_name = "Navya-Provider-Demo"
  # environment = "DEV"
  #
  # Result:
  # navya-provider-demo-dev

  bucket_prefix = lower("${var.bucket_name}-${var.environment}")
}