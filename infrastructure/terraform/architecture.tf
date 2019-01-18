provider "aws" {
  region  = "us-east-1"
  version = "~> 1.56"
}

variable "website_bucket" {
  type    = "string"
  default = "sample-serverless-webapp"
}

resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "${var.website_bucket}"
  tags   = {
    Name        = "serverless-demo"
    Environment = "demo"
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
      "Resource": "arn:aws:s3:::${var.website_bucket}/*"
    }
  ]
}
POLICY
}
