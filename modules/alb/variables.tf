variable "alb_name" {
  description = "Name of the ALB"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g: dev, staging, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets for ALB"
  type        = list(string)
}

variable "security_groups" {
  description = "Security groups associated with ALB"
  type        = list(string)
}
