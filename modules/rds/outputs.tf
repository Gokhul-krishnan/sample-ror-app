output "rds_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}

output "rds_identifier" {
  value = aws_db_instance.rds_instance.identifier
}

output "rds_secret_arn" {
  description = "ARN of the AWS Secrets Manager secret storing RDS credentials"
  value       = data.aws_secretsmanager_secret_version.rds_secret_version.secret_arn
}

output "rds_instance_arn" {
  value = aws_db_instance.rds_instance.arn
}
