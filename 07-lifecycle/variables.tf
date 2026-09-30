variable "aws_region" {
  description = "AWS region where the S3 bucket will be created"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "Name of the lifecycle demo S3 bucket"
  type        = string
}