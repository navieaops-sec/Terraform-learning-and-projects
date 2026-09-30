output "bucket_names" {
  description = "Names of S3 buckets created by the module"

  value = {
    for name, bucket in module.s3_bucket :
    name => bucket.bucket_name
  }
}

output "bucket_arns" {
  description = "ARNs of S3 buckets created by the module"

  value = {
    for name, bucket in module.s3_bucket :
    name => bucket.bucket_arn
  }
}