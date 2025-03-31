variable "ecs_task_execution_role_name" {
  description = "Name of the ECS task execution role"
  type        = string
}

variable "ecs_task_role_name" {
  description = "Name of the ECS task role"
  type        = string
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  type        = string
}

variable "rds_instance_arn" {
  description = "ARN of the RDS instance"
  type        = string
}

variable "rds_secret_arn" {
  description = "ARN of the Secrets Manager secret storing RDS credentials"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "rds_instance_id" {
  description = "RDS Instance ID"
  type        = string
}

variable "db_username" {
  description = "Database username for IAM authentication"
  type        = string
}
