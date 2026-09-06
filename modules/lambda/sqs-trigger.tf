resource "aws_lambda_event_source_mapping" "analysis_jobs" {
  event_source_arn = var.analysis_jobs_queue_arn
  function_name    = aws_lambda_function.worker.arn

  batch_size = 1
}