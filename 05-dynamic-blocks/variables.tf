variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "lifecycle_rules" {
  description = "List of S3 lifecycle rules"

  type = list(object({
    id     = string
    prefix = string
    days   = number
  }))
}