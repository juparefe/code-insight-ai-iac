data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "frontend" {
  bucket = "${var.project_name}-${var.environment}-frontend-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "${var.project_name}-${var.environment}-frontend"
    Project     = var.project_name
    Environment = var.environment
  }
}