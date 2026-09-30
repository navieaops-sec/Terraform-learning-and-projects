/*
  ============================================================
  INPUT VARIABLES
  ============================================================

  Input variables allow us to make Terraform configuration
  reusable instead of hardcoding values directly inside
  resource blocks.

  This project demonstrates:
  - string variables
  - boolean variables
  - default values
  - variable descriptions
*/

# Primary AWS region

variable "aws_region" {
  description = "Primary AWS region"
  type        = string
  default     = "ap-south-1"
}


# Secondary AWS region

variable "secondary_region" {
  description = "Secondary AWS region"
  type        = string
  default     = "us-east-1"
}


# Base S3 bucket name

variable "bucket_name" {
  description = "Base name of the S3 bucket"
  type        = string
}


# Deployment environment

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}


# Project name

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "terraform-providers-variables"
}


# S3 versioning control

variable "enable_versioning" {
  description = "Enable S3 bucket versioning"
  type        = bool
  default     = true
}