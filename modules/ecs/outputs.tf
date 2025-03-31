output "ecs_cluster_id" {
  description = "ECS Cluster ID"
  value       = aws_ecs_cluster.ecs_cluster.id
}

output "ecs_service_id" {
  description = "ECS Service ID"
  value       = aws_ecs_service.ecs_service.id
}

output "ecs_task_definition_arn" {
  description = "ECS Task Definition ARN"
  value       = aws_ecs_task_definition.ecs_task.arn
}
