resource "aws_s3_bucket" "demo" {
  bucket = var.bucket_name

  tags = {
    Name      = var.bucket_name
    ManagedBy = "Terraform"
    Project   = "terraform-lifecycle"
  }

  lifecycle {
    prevent_destroy = true
  }
}