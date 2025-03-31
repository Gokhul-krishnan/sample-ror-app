output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "ecs_sg_id" {
  value = aws_security_group.ecs_sg.id
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}

output "security_group_ids" {
  value = [
    aws_security_group.alb_sg.id,
    aws_security_group.ecs_sg.id,
    aws_security_group.rds_sg.id
  ]
}
