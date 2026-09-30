/*
============================================================
PROJECT 04 - META-ARGUMENTS
============================================================

This project demonstrates:

1. Multi-region providers
2. Multi-account provider configuration
3. count
4. for_each
5. depends_on
6. lifecycle
============================================================
*/


# ============================================================
# 1. COUNT
# ============================================================
#
# count creates multiple instances of the same resource.
#
# If bucket_count = 2:
#
# aws_s3_bucket.count_demo[0]
# aws_s3_bucket.count_demo[1]
#
# count.index starts from 0.
# ============================================================

resource "aws_s3_bucket" "count_demo" {
  count = var.bucket_count

  bucket = "navya-count-${var.environment}-${count.index}-2026"

  tags = {
    Name        = "count-${count.index}"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name
  }
}


# ============================================================
# 2. FOR_EACH
# ============================================================
#
# for_each creates resources from a collection.
#
# Our set contains:
#
# logs
# backup
#
# Terraform creates:
#
# aws_s3_bucket.foreach_demo["logs"]
# aws_s3_bucket.foreach_demo["backup"]
#
# each.key gives the current key.
# ============================================================

resource "aws_s3_bucket" "foreach_demo" {
  for_each = var.bucket_names

  bucket = "navya-${each.key}-${var.environment}-2026"

  tags = {
    Name        = "foreach-${each.key}"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name
  }
}


# ============================================================
# 3. MULTI-REGION
# ============================================================
#
# The provider alias "secondary" points to us-east-1.
#
# The resource below will therefore be created in:
#
# us-east-1
#
# even though the default provider is:
#
# ap-south-1
# ============================================================

resource "aws_s3_bucket" "secondary_region" {
  provider = aws.secondary

  bucket = "navya-secondary-region-${var.environment}-2026"

  tags = {
    Name        = "secondary-region"
    Environment = var.environment
    Region      = var.secondary_region
    ManagedBy   = "Terraform"
  }
}


# ============================================================
# 4. DEPENDS_ON
# ============================================================
#
# Terraform normally understands dependencies automatically
# when one resource references another.
#
# depends_on creates an EXPLICIT dependency.
#
# This bucket will wait until the count_demo resources are
# created.
# ============================================================

resource "aws_s3_bucket" "dependent_demo" {
  bucket = "navya-dependent-${var.environment}-2026"

  depends_on = [
    aws_s3_bucket.count_demo
  ]

  tags = {
    Name        = "explicit-dependency"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}


# ============================================================
# 5. LIFECYCLE
# ============================================================
#
# lifecycle controls how Terraform handles resource changes.
#
# create_before_destroy:
# Create replacement before destroying the old resource.
#
# ignore_changes:
# Terraform ignores changes to the specified attribute.
#
# IMPORTANT:
# We are NOT enabling prevent_destroy permanently here because
# it would block terraform destroy during our lab cleanup.
# ============================================================

resource "aws_s3_bucket" "lifecycle_demo" {
  bucket = "navya-lifecycle-${var.environment}-2026"

  tags = {
    Name        = "lifecycle-demo"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }

  lifecycle {
    create_before_destroy = true

    ignore_changes = [
      tags
    ]
  }
}