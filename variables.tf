variable "aws_region" {
  description = "AWS region where the infrastructure will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for resource naming and tagging"
  type        = string
  default     = "code-insight-ai"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "lambda_package_path" {
  description = "Lambda deployment package path"
  type        = string
}

variable "api_integration_timeout_milliseconds" {
  description = "API Gateway -> Lambda integration timeout in ms. The 'Maximum integration timeout' quota is approved at 120000 but API Gateway may still enforce 29000 for up to ~48h after approval; keep 29000 until PutIntegration accepts the higher value."
  type        = number
  default     = 29000
}