resource "aws_sqs_queue" "analysis_jobs" {
  name = "${var.project_name}-${var.environment}-analysis-jobs"

  visibility_timeout_seconds = 900

  message_retention_seconds = 86400

  tags = {
    Name        = "${var.project_name}-${var.environment}-analysis-jobs"
    Project     = var.project_name
    Environment = var.environment
  }
}