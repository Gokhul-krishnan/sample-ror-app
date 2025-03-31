variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "ecs_task_role_arn" {
  description = "ARN of the ECS Task Role"
  type        = string
}
