output "analysis_jobs_queue_url" {
  value = aws_sqs_queue.analysis_jobs.url
}

output "analysis_jobs_queue_arn" {
  value = aws_sqs_queue.analysis_jobs.arn
}