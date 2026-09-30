output "bucket_name" {
  description = "Name of the lifecycle demo bucket"
  value       = aws_s3_bucket.demo.bucket
}

output "bucket_arn" {
  description = "ARN of the lifecycle demo bucket"
  value       = aws_s3_bucket.demo.arn
}