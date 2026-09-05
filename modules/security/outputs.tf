output "lambda_security_group_id" {
  description = "Security group ID for Lambda"
  value       = aws_security_group.lambda.id
}