# ---------------------------------------------------------
# S3 bucket for the current environment
# ---------------------------------------------------------
resource "aws_s3_bucket" "environment" {

  # terraform.workspace returns the currently selected
  # workspace name.
  #
  # dev  -> navya-environment-dev-2026
  # uat  -> navya-environment-uat-2026
  # prod -> navya-environment-prod-2026
  #
  # This allows the same Terraform code to be reused
  # for multiple environments.
  bucket = "${var.bucket_prefix}-${terraform.workspace}-2026"

  # -------------------------------------------------------
  # Tags
  # -------------------------------------------------------
  tags = {
    Name        = "${var.bucket_prefix}-${terraform.workspace}-2026"
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
    Project     = "terraform-environments"
  }
}