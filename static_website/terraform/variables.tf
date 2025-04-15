variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy in"
  type        = string
  default     = "us-east-2"
}
