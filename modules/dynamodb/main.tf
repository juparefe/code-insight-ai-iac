resource "aws_dynamodb_table" "analysis_jobs" {
  name         = "${var.project_name}-${var.environment}-analysis-jobs"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-analysis-jobs"
    Project     = var.project_name
    Environment = var.environment
  }
}