data "aws_iam_policy_document" "website_policy" {
  # gives everyone permissions to get objects within the bucket specified 
  statement {
    actions = [
      "s3:GetObject"
    ]
    principals {
      identifiers = ["*"]
      type = "AWS"
    }
    resources = [
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
  }
}