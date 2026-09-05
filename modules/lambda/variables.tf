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