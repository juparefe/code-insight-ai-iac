output "lambda_role_arn" {
  description = "ARN of the Lambda execution role"
  value       = aws_iam_role.lambda.arn
}

output "lambda_role_name" {
  description = "Name of the Lambda execution role"
  value       = aws_iam_role.lambda.name
}

output "github_actions_frontend_role_arn" {
  description = "ARN of the role GitHub Actions assumes to deploy the frontend (use as the AWS_FRONTEND_DEPLOY_ROLE_ARN secret)"
  value       = aws_iam_role.github_actions_frontend.arn
}