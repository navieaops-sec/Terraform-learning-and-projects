output "bucket_arns_splat" {
  description = "ARNs of all buckets using a splat expression"
  value       = values(aws_s3_bucket.demo)[*].arn
}

output "bucket_ids_splat" {
  description = "IDs of all buckets using a splat expression"
  value       = values(aws_s3_bucket.demo)[*].id
}