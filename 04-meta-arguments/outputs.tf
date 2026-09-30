output "count_buckets" {
  description = "Buckets created using count"

  value = [
    for bucket in aws_s3_bucket.count_demo :
    bucket.bucket
  ]
}


output "foreach_buckets" {
  description = "Buckets created using for_each"

  value = [
    for bucket in aws_s3_bucket.foreach_demo :
    bucket.bucket
  ]
}


output "secondary_region_bucket" {
  description = "Bucket created in secondary region"

  value = aws_s3_bucket.secondary_region.bucket
}


output "dependent_bucket" {
  description = "Bucket created using depends_on"

  value = aws_s3_bucket.dependent_demo.bucket
}


output "lifecycle_bucket" {
  description = "Bucket using lifecycle rules"

  value = aws_s3_bucket.lifecycle_demo.bucket
}