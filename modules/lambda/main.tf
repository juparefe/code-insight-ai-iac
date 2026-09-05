resource "aws_lambda_function" "this" {
  function_name = "${var.project_name}-${var.environment}"
  role          = var.lambda_role_arn

  runtime = "nodejs22.x"
  handler = "index.handler"

  filename         = "${path.module}/lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda.zip")

  timeout     = 30
  memory_size = 512

  vpc_config {
    subnet_ids         = var.private_subnet_ids
    security_group_ids = [var.security_group_id]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}"
  }
}