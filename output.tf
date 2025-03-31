output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnets
}

output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = module.alb.alb_arn
}

output "ecs_cluster_id" {
  description = "ECS Cluster ID"
  value       = module.ecs.ecs_cluster_id
}

output "ecs_service_id" {
  description = "ECS Service ID"
  value       = module.ecs.ecs_service_id
}

output "rds_instance_arn" {
  description = "RDS Instance ARN"
  value       = module.rds.rds_instance_arn
}

output "s3_bucket_arn" {
  description = "S3 Bucket ARN"
  value       = module.s3.s3_bucket_arn
}

output "security_group_ids" {
  description = "Security Group IDs"
  value       = module.security_groups.security_group_ids
}
