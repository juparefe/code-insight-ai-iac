output "vpc_id" {
  description = "ID of the project VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.networking.private_subnet_ids
}

output "function_name" {
  description = "Lambda function name"
  value       = module.lambda.function_name
}

output "function_arn" {
  description = "Lambda function ARN"
  value       = module.lambda.function_arn
}

output "api_endpoint" {
  description = "API Gateway endpoint"
  value       = module.api_gateway.api_endpoint
}

output "api_id" {
  description = "API Gateway API ID"
  value       = module.api_gateway.api_id
}

output "analysis_jobs_queue_url" {
  value = module.sqs.analysis_jobs_queue_url
}

output "analysis_jobs_table_name" {
  description = "DynamoDB analysis jobs table name"
  value       = module.dynamodb.analysis_jobs_table_name
}

output "analysis_jobs_table_arn" {
  description = "DynamoDB analysis jobs table ARN"
  value       = module.dynamodb.analysis_jobs_table_arn
}

output "frontend_bucket_name" {
  description = "S3 bucket name for the frontend"
  value       = module.frontend.frontend_bucket_name
}

output "frontend_cloudfront_distribution_id" {
  description = "CloudFront distribution ID for the frontend"
  value       = module.frontend.frontend_cloudfront_distribution_id
}

output "frontend_cloudfront_domain_name" {
  description = "CloudFront domain name for the frontend"
  value       = module.frontend.frontend_cloudfront_domain_name
}

output "github_actions_frontend_role_arn" {
  description = "Role ARN for the frontend deploy pipeline (GitHub secret AWS_FRONTEND_DEPLOY_ROLE_ARN)"
  value       = module.iam.github_actions_frontend_role_arn
}