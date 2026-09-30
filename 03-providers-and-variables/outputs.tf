/*
  ============================================================
  OUTPUT VALUES
  ============================================================

  Outputs display useful information after Terraform creates
  the infrastructure.

  These values can also be consumed by other Terraform
  configurations or modules.
*/

# S3 bucket name

output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.demo.bucket
}


# S3 bucket ARN

output "bucket_arn" {
  description = "ARN of the created S3 bucket"
  value       = aws_s3_bucket.demo.arn
}


# AWS region

output "bucket_region" {
  description = "AWS region where the bucket is created"
  value       = var.aws_region
}


# Deployment environment

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}