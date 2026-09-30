# ---------------------------------------------------------
# AWS Region
# ---------------------------------------------------------
variable "aws_region" {
  description = "AWS region where the environment bucket will be created"
  type        = string
  default     = "ap-south-1"
}

# ---------------------------------------------------------
# Bucket Prefix
# ---------------------------------------------------------
# The workspace name will be added automatically.
#
# Example:
# navya-environment-dev-2026
# navya-environment-uat-2026
# navya-environment-prod-2026
# ---------------------------------------------------------
variable "bucket_prefix" {
  description = "Prefix used for environment-specific S3 bucket names"
  type        = string
  default     = "navya-environment"
}
