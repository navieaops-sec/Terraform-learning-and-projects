# ---------------------------------------------------------
# S3 bucket name
# ---------------------------------------------------------
output "bucket_name" {
  description = "S3 bucket created for the current environment"

  value = aws_s3_bucket.environment.bucket
}

# ---------------------------------------------------------
# Current workspace
# ---------------------------------------------------------
output "environment" {
  description = "Current Terraform workspace/environment"

  value = terraform.workspace
}

# ---------------------------------------------------------
# S3 bucket ARN
# ---------------------------------------------------------
output "bucket_arn" {
  description = "ARN of the environment S3 bucket"

  value = aws_s3_bucket.environment.arn
}