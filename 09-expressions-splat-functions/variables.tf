variable "aws_region" {
  description = "AWS region for the project"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "Navya Terraform"
}

variable "bucket_names" {
  description = "List of bucket names"
  type        = list(string)
}

variable "environment_enabled" {
  description = "Whether the environment is enabled"
  type        = bool
  default     = true
}

variable "bucket_config" {
  description = "Map containing bucket configuration"
  type        = map(string)

  default = {
    logs   = "logs"
    backup = "backup"
  }
}