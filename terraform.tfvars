lambda_package_path = "../code-insight-ai-backend/lambda-package.zip"

# Quota "Maximum integration timeout" is approved at 120000, but API Gateway can
# take up to ~48h after approval to actually enforce it. Bump to 120000 once a
# `terraform apply` stops failing with "Timeout should be between 50 ms and 29000 ms".
api_integration_timeout_milliseconds = 90000
