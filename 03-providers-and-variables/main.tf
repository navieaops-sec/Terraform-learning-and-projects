/*
  ============================================================
  MAIN TERRAFORM RESOURCES
  ============================================================

  This project uses an S3 bucket as the main AWS resource.

  Terraform demonstrates:
  - resource creation
  - variable references
  - local values
  - expressions
  - random provider
  - resource dependency
*/

# ============================================================
# RANDOM ID
# ============================================================
# Generates a random hexadecimal suffix.
#
# Example:
# a82f91c3

resource "random_id" "bucket_suffix" {

  byte_length = 4
}


# ============================================================
# S3 BUCKET
# ============================================================
# Main AWS resource of this project.
#
# The final bucket name is created dynamically using:
# bucket variable + environment + random suffix.

resource "aws_s3_bucket" "demo" {

  bucket = "${local.bucket_prefix}-${random_id.bucket_suffix.hex}"

  # Apply common tags defined in locals.tf

  tags = local.common_tags
}


# ============================================================
# S3 VERSIONING
# ============================================================
# Configures versioning for the same S3 bucket.
#
# Conditional expression:
#
# condition ? true_value : false_value
#
# true  -> Enabled
# false -> Suspended

resource "aws_s3_bucket_versioning" "demo" {

  bucket = aws_s3_bucket.demo.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}