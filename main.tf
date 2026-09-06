module "networking" {
  source = "./modules/networking"

  project_name = var.project_name
  environment  = var.environment
}

module "iam" {
  source = "./modules/iam"

  project_name            = var.project_name
  environment             = var.environment
  analysis_jobs_queue_arn = module.sqs.analysis_jobs_queue_arn
}

module "security" {
  source = "./modules/security"

  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.networking.vpc_id
}

module "lambda" {
  source = "./modules/lambda"

  project_name = var.project_name
  environment  = var.environment

  lambda_package_path = var.lambda_package_path
  lambda_role_arn     = module.iam.lambda_role_arn
  security_group_id   = module.security.lambda_security_group_id
  private_subnet_ids  = module.networking.private_subnet_ids

  environment_variables = {
    ANALYSIS_JOBS_QUEUE_URL = module.sqs.analysis_jobs_queue_url
  }
}

module "api_gateway" {
  source = "./modules/api_gateway"

  project_name = var.project_name
  environment  = var.environment

  lambda_function_name             = module.lambda.function_name
  lambda_invoke_arn                = module.lambda.invoke_arn
  integration_timeout_milliseconds = var.api_integration_timeout_milliseconds
}

module "sqs" {
  source = "./modules/sqs"

  project_name = var.project_name
  environment  = var.environment
}