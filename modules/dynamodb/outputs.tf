output "analysis_jobs_table_name" {
  value = aws_dynamodb_table.analysis_jobs.name
}

output "analysis_jobs_table_arn" {
  value = aws_dynamodb_table.analysis_jobs.arn
}