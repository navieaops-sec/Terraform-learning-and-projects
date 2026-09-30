module "s3_bucket" {
  source = "./modules/s3-bucket"

  for_each = var.bucket_names

  bucket_name = each.value
  environment = var.environment
}