# =========================================================
# 1. LOCAL VALUES
# =========================================================

locals {

  # -------------------------------------------------------
  # String function
  # lower() converts text to lowercase.
  # -------------------------------------------------------

  normalized_environment = lower(var.environment)

  # -------------------------------------------------------
  # String function
  # upper() converts text to uppercase.
  # -------------------------------------------------------

  environment_label = upper(var.environment)

  # -------------------------------------------------------
  # String function
  # join() combines multiple strings.
  # -------------------------------------------------------

  project_identifier = join(
    "-",
    [
      "navya",
      lower(var.environment),
      "terraform"
    ]
  )

  # -------------------------------------------------------
  # Function
  # length() returns number of items.
  # -------------------------------------------------------

  bucket_count = length(var.bucket_names)

  # -------------------------------------------------------
  # Conditional expression
  #
  # condition ? true_value : false_value
  # -------------------------------------------------------

  deployment_status = var.environment_enabled ? "enabled" : "disabled"

  # -------------------------------------------------------
  # Function
  # contains() checks whether a list contains a value.
  # -------------------------------------------------------

  is_dev_environment = contains(
    ["dev", "uat"],
    lower(var.environment)
  )
}


# =========================================================
# 2. S3 BUCKETS USING FOR_EACH
# =========================================================

resource "aws_s3_bucket" "demo" {

  # -------------------------------------------------------
  # for_each creates one resource for every bucket name.
  # -------------------------------------------------------

  for_each = toset(var.bucket_names)

  bucket = each.value

  tags = {
    Name        = each.value
    Environment = local.normalized_environment
    Project     = "terraform-expressions"
    ManagedBy   = "Terraform"
  }
}


# =========================================================
# 3. S3 BUCKET USING CONDITIONAL EXPRESSION
# =========================================================
resource "aws_s3_bucket" "conditional" {
  bucket = var.environment_enabled ? "navya-conditional-enabled-2026" : "navya-conditional-disabled-2026"

  tags = {
    Name        = "Conditional Bucket"
    Environment = var.environment
    Status      = local.deployment_status
    ManagedBy   = "Terraform"
  }
}