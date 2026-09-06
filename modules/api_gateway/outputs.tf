output "api_endpoint" {
  description = "Base invoke URL for the API Gateway stage (append /api/v1/repositories/analyze for app routes)"
  value       = aws_api_gateway_stage.this.invoke_url
}

output "api_id" {
  description = "API Gateway REST API ID"
  value       = aws_api_gateway_rest_api.this.id
}
