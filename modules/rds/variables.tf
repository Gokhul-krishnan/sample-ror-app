variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "aws_region" {
  description = "AWS Region where RDS will be deployed"
  type        = string
}

variable "rds_secret_arn" {
  description = "ARN of the AWS Secrets Manager secret storing RDS credentials"
  type        = string
}

variable "db_identifier" {
  description = "RDS instance identifier"
  type        = string
}

variable "db_engine_version" {
  description = "PostgreSQL engine version"
  type        = string
  default     = "13"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_allocated_storage" {
  description = "Initial allocated storage in GB"
  type        = number
}

variable "db_max_allocated_storage" {
  description = "Maximum allocated storage in GB"
  type        = number
}

variable "multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
}

variable "db_username" {
  description = "Database master username"
  type        = string
}

variable "db_password" {
  description = "Database master password"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets for RDS"
  type        = list(string)
}

variable "db_sg_id" {
  description = "Security group ID for RDS"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Subnet group name for RDS"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS key ARN for RDS encryption"
  type        = string
}
