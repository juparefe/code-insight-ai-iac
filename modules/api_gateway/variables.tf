variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
}

variable "lambda_invoke_arn" {
  description = "Lambda invoke ARN used as the API Gateway integration URI"
  type        = string
}

variable "integration_timeout_milliseconds" {
  description = "API Gateway -> Lambda integration timeout. Values above 29000 require the 'Integration timeout for Regional APIs' service quota to be raised for the account."
  type        = number
  default     = 90000
}
