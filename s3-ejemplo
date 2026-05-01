terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

#

locals {
  bucket_name = "public-bucket-${data.aws_caller_identity.current.account_id}-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"
}

data "aws_caller_identity" "current" {}

#

resource "aws_s3_bucket" "public_bucket" {
  bucket = local.bucket_name
}

resource "aws_s3_bucket_acl" "public_bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.public_bucket]

  bucket = aws_s3_bucket.public_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_ownership_controls" "public_bucket" {
  bucket = aws_s3_bucket.public_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "public_bucket" {
  bucket = aws_s3_bucket.public_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_bucket" {
  bucket = aws_s3_bucket.public_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.public_bucket.arn}/*"
      },
      {
        Sid       = "ListBucket"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:ListBucket"
        Resource  = aws_s3_bucket.public_bucket.arn
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.public_bucket]
}

# Comprobaciones

output "bucket_name" {
  value       = aws_s3_bucket.public_bucket.id
  description = "Nombre del bucket S3"
}

output "bucket_arn" {
  value       = aws_s3_bucket.public_bucket.arn
  description = "ARN del bucket S3"
}

output "bucket_url" {
  value       = "https://${aws_s3_bucket.public_bucket.id}.s3.amazonaws.com"
  description = "URL pública del bucket"
}
