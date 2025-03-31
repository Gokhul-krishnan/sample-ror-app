variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

# VPC
variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

# ALB
variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

# ECS
variable "ecs_cluster_name" {
  description = "ECS Cluster Name"
  type        = string
}

variable "ecs_service_name" {
  description = "ECS Service Name"
  type        = string
}

variable "ecs_desired_count" {
  description = "Desired task count for ECS"
  type        = number
  default     = 2
}

variable "environment" {
  description = "Deployment environment (e.g: dev, staging, prod)"
  type        = string
}

variable "ecs_task_role_arn" {
  type        = string
  default     = ""
}

variable "alb_target_group_arn" {
  type        = string
  default     = ""
}

variable "container_image" {
  description = "List of Docker images to be used in ECS"
  type        = list(string)
}

# RDS (Using AWS Secrets Manager)
variable "db_identifier" {
  description = "The DB instance identifier"
  type        = string
}

variable "db_instance_class" {
  description = "The instance type of the RDS database"
  type        = string
}

variable "db_allocated_storage" {
  description = "The allocated storage in GB"
  type        = number
}

variable "db_max_allocated_storage" {
  description = "The maximum storage allocation"
  type        = number
}

#variable "db_password" {
#  description = "The database password (retrieved from Secrets Manager)"
#  type        = string
#}

variable "db_subnet_group_name" {
  description = "Subnet group for RDS"
  type        = string
}

variable "db_sg_id" {
  description = "Security Group ID for RDS"
  type        = string
  default     = ""
}

variable "multi_az" {
  description = "Whether to enable Multi-AZ deployment"
  type        = bool
  default     = false
}

variable "kms_key_arn" {
  description = "KMS Key ARN for RDS encryption"
  type        = string
  default     = ""
}

variable "rds_secret_arn" {
  description = "ARN of the AWS Secrets Manager secret storing RDS credentials"
  type        = string
}

variable "db_engine" {
  description = "The database engine (e.g., mysql, postgres)"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "The database engine version (e.g., 5.7.22)"
  type        = string
  default     = "17.2-R1"
}

# S3
variable "s3_bucket_name" {
  description = "S3 Bucket Name"
  type        = string
}

# Security Groups
variable "security_group_name" {
  description = "Security group name"
  type        = string
}

# iam
variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "db_username" {
  description = "Database username for RDS"
  type        = string
}

variable "rds_instance_id" {
  type = string
  default     = ""
}


variable "memory" {
  type = number
  description = "Memory for the ECS task"
}

variable "cpu" {
  type = number
  description = "CPU units for the ECS task"
}

variable "task_role_arn" {
  type = string
  description = "ARN of the IAM Task Role for ECS"
  default     = ""
}

variable "execution_role_arn" {
  type = string
  description = "ARN of the IAM Execution Role for ECS"
  default     = ""
}

variable "ecs_sg_id" {
  type = string
  description = "Security group ID for the ECS service"
  default     = ""
}

variable "db_host" {
  type = string
  description = "Database hostname"
}

variable "db_name" {
  type = string
  description = "Database name"
}

variable "s3_bucket" {
  type = string
  description = "S3 bucket name for ECS"
}

variable "task_family" {
  type = string
  description = "ECS Task Definition family"
  default     = "ror-app-task-family"
}

variable "container_name" {
  type = string
  description = "ECS Container Name"
}

#variable "container_image" {
#  type = string
#  description = "Docker image to be used in ECS"
#}

variable "aws_profile" {
  type = string
  description = "AWS CLI profile to use"
  default = "default"
}
