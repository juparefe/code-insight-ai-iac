variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "analysis_jobs_queue_arn" {
  type = string
}

variable "analysis_jobs_table_arn" {
  type = string
}

variable "frontend_bucket_arn" {
  description = "ARN of the frontend S3 bucket the GitHub Actions role deploys to"
  type        = string
}

variable "frontend_cloudfront_distribution_arn" {
  description = "ARN of the frontend CloudFront distribution the GitHub Actions role invalidates"
  type        = string
}

variable "github_frontend_repo" {
  description = "GitHub owner/repo (matched against the OIDC 'repository' claim) allowed to assume the frontend deploy role"
  type        = string
  default     = "juparefe/code-insight-ai-frontend"
}

variable "github_frontend_ref" {
  description = "Git ref (matched against the OIDC 'ref' claim) allowed to assume the frontend deploy role"
  type        = string
  default     = "refs/heads/main"
}

variable "github_frontend_sub_pattern" {
  description = <<-EOT
    Pattern matched (StringLike) against the OIDC 'sub' claim. AWS requires a scoped
    condition on 'sub' or 'job_workflow_ref' for the GitHub provider. This account uses
    a customized subject claim that embeds immutable numeric IDs
    (e.g. repo:juparefe@82104792/code-insight-ai-frontend@1358509372:ref:refs/heads/main),
    so the IDs are wildcarded while owner, repo and branch stay pinned.
  EOT
  type        = string
  default     = "repo:juparefe@*/code-insight-ai-frontend@*:ref:refs/heads/main"
}