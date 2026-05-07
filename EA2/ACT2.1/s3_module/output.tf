output "bucket_id" {
  description = "El nombre del bucket"
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "El ARN del bucket"
  value       = aws_s3_bucket.this.arn
}