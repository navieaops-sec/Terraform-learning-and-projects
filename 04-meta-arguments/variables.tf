variable "primary_region" {
  description = "Primary AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "secondary_region" {
  description = "Secondary AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_count" {
  description = "Number of buckets to create using count"
  type        = number
  default     = 2
}

variable "bucket_names" {
  description = "Bucket names used with for_each"
  type        = set(string)

  default = [
    "logs",
    "backup"
  ]
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "terraform-meta-arguments"
}

variable "secondary_account_role_arn" {
  description = "IAM role ARN used to access the secondary AWS account"
  type        = string
}