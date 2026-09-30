output "bucket_name" {
  description = "S3 bucket name"

  value = aws_s3_bucket.demo.bucket
}

output "lifecycle_rule_count" {
  description = "Number of lifecycle rules configured"

  value = length(var.lifecycle_rules)
}