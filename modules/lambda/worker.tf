resource "aws_lambda_function" "worker" {
  function_name = "${var.project_name}-${var.environment}-worker"

  role    = var.lambda_role_arn
  runtime = "nodejs22.x"
  handler = "dist/lambda-worker.handler"

  filename         = var.lambda_package_path
  source_code_hash = filebase64sha256(var.lambda_package_path)

  timeout     = 120
  memory_size = 1024

  vpc_config {
    subnet_ids         = var.private_subnet_ids
    security_group_ids = [var.security_group_id]
  }

  environment {
    variables = var.environment_variables
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-worker"
  }
}