/*
============================================================
PROJECT 05 - DYNAMIC BLOCKS
============================================================

This project demonstrates:

1. Dynamic blocks
2. for_each inside dynamic blocks
3. Nested blocks
4. Complex variable types
5. S3 lifecycle configuration
============================================================
*/


# ============================================================
# S3 BUCKET
# ============================================================

resource "aws_s3_bucket" "demo" {

  bucket = var.bucket_name

  tags = {
    Name      = "dynamic-block-demo"
    ManagedBy = "Terraform"
    Project   = "dynamic-blocks"
  }
}


# ============================================================
# S3 LIFECYCLE CONFIGURATION
# ============================================================

resource "aws_s3_bucket_lifecycle_configuration" "demo" {

  bucket = aws_s3_bucket.demo.id


  # ==========================================================
  # DYNAMIC BLOCK
  # ==========================================================
  #
  # Instead of manually writing multiple rule blocks:
  #
  # rule { ... }
  #
  # rule { ... }
  #
  # dynamic creates them automatically.
  #
  # var.lifecycle_rules contains our list of objects.
  # ==========================================================

  dynamic "rule" {

    for_each = var.lifecycle_rules

    content {

      id     = rule.value.id
      status = "Enabled"


      # ------------------------------------------------------
      # FILTER
      # ------------------------------------------------------

      filter {
        prefix = rule.value.prefix
      }


      # ------------------------------------------------------
      # EXPIRATION
      # ------------------------------------------------------

      expiration {
        days = rule.value.days
      }
    }
  }
}