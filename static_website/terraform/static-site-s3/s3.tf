resource "aws_s3_bucket" "static_site" {
  bucket = var.bucket_name
  acl = "public-read"
  policy = data.aws_iam_policy_document.website_policy.json
  
  tags = {
    Name = "StaticWebsite"
  }
}

resource "aws_s3_bucket_website_configuration" "static_site" {
  bucket = aws_s3_bucket.static_site.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}
