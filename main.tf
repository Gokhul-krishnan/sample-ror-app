module "vpc" {
  source             = "./modules/vpc"
  project_name	     = var.project_name
  availability_zones = var.availability_zones
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source          = "./modules/alb"
  alb_name        = var.alb_name
  environment     = var.environment 
  security_groups = [module.security_groups.alb_sg_id]
  public_subnets  = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id
}

module "ecs" {
  source             = "./modules/ecs"
  memory              = var.memory
  cpu                 = var.cpu
  task_role_arn       = var.task_role_arn
  execution_role_arn  = var.execution_role_arn
  ecs_sg_id           = var.ecs_sg_id
  db_host             = var.db_host
  db_name             = var.db_name
  s3_bucket           = var.s3_bucket
  rds_secret_arn      = var.rds_secret_arn
  task_family         = var.task_family
  container_name      = var.container_name
  container_image     = var.container_image
  private_subnets     = var.private_subnets
  ecs_cluster_name   = var.ecs_cluster_name
#  environment        = var.environment
  ecs_service_name   = var.ecs_service_name
#  ecs_desired_count  = var.ecs_desired_count
  alb_target_group_arn = module.alb.target_group_arn
#  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
#  ecs_task_role_arn   = module.iam.ecs_task_role_arn
}

module "rds" {
  source           = "./modules/rds"
  aws_region               = var.aws_region
  aws_account_id           = "767397860288"
  db_identifier            = var.db_identifier
  db_instance_class        = var.db_instance_class
  db_allocated_storage     = var.db_allocated_storage
  db_max_allocated_storage = var.db_max_allocated_storage
  db_subnet_group_name     = var.db_subnet_group_name
  db_sg_id                 = var.db_sg_id
  private_subnets          = var.private_subnets
  multi_az                 = var.multi_az
  kms_key_arn              = var.kms_key_arn 
  rds_secret_arn           = var.rds_secret_arn
  db_username = jsondecode(data.aws_secretsmanager_secret_version.rds_secret_version.secret_string)["username"]
  db_password = jsondecode(data.aws_secretsmanager_secret_version.rds_secret_version.secret_string)["password"]
} 

# Fetch the RDS credentials from AWS Secrets Manager
#data "aws_secretsmanager_secret" "rds_secret" {
#  arn = var.rds_secret_arn
#}

data "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id = data.aws_secretsmanager_secret.rds_secret.id
}

module "s3" {
  source             = "./modules/s3"
  s3_bucket_name     = var.s3_bucket_name
  ecs_task_role_arn  = var.ecs_task_role_arn
  environment        = var.environment
}

module "iam" {
  source                       = "./modules/iam"
  aws_account_id               = var.aws_account_id
  db_username                  = var.db_username
  aws_region                   = var.aws_region
  ecs_task_execution_role_name = "ecs-task-execution-role"
  ecs_task_role_name           = "ecs-task-role"
  s3_bucket_arn                = module.s3.s3_bucket_arn
  rds_instance_arn             = module.rds.rds_instance_arn
  rds_secret_arn               = var.rds_secret_arn
  rds_instance_id              = var.rds_instance_id
}
