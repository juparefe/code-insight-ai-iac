variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "analysis_jobs_queue_arn" {
  type = string
}

variable "analysis_jobs_table_arn" {
  type = string
}

variable "frontend_bucket_arn" {
  description = "ARN of the frontend S3 bucket the GitHub Actions role deploys to"
  type        = string
}

variable "frontend_cloudfront_distribution_arn" {
  description = "ARN of the frontend CloudFront distribution the GitHub Actions role invalidates"
  type        = string
}