output "bucket_region" {
  description = "AWS region of bucket"
  value = try(var.aws_region, "")
}

output "bucket_name" {
  description = "The name of the S3 bucket"
  value = try(var.bucket_name, null)
}
