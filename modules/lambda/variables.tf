variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "lambda_role_arn" {
  description = "Lambda execution role ARN"
  type        = string
}

variable "security_group_id" {
  description = "Lambda security group ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs where Lambda will run"
  type        = list(string)
}

variable "lambda_package_path" {
  description = "Path to the Lambda deployment package"
  type        = string
}

variable "environment_variables" {
  description = "Environment variables to pass to the Lambda function"
  type        = map(string)
  default     = {}
}

variable "analysis_jobs_queue_arn" {
  description = "ARN of the SQS queue used for asynchronous analysis jobs"
  type        = string
}