output "bucket_name" {
  description = "The name of the S3 bucket"
  value = aws_s3_bucket.static_site.bucket
}

output "website_url" {
  description = "The URL of the static website"
  value       = aws_s3_bucket_website_configuration.static_site.website_endpoint
}
