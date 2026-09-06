output "frontend_bucket_name" {
  description = "Frontend S3 bucket name"
  value       = aws_s3_bucket.frontend.bucket
}

output "frontend_cloudfront_distribution_id" {
  description = "Frontend CloudFront distribution ID"
  value       = aws_cloudfront_distribution.frontend.id
}

output "frontend_cloudfront_domain_name" {
  description = "Frontend CloudFront domain name"
  value       = aws_cloudfront_distribution.frontend.domain_name
}