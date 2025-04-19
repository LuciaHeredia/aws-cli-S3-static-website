provider "aws" {
  region = var.aws_region
}

module "website" {
  source = "./static-site-s3"
  bucket_name = var.bucket_name
}
