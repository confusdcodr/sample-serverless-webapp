provider "aws" {
  region  = "us-east-1"
  version = "~> 1.56"
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = "${var.bucket_name}"
  tags   = {
    Name        = "serverless-demo"
    Environment = "demo"
    Project     = "serverless-demo"
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.bucket_name}/*"
    }
  ]
}
POLICY
}
