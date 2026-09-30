variable "aws_region" {
  description = "AWS region where the S3 buckets will be created"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "bucket_names" {
  description = "Names of S3 buckets to create using the reusable module"
  type        = set(string)
}