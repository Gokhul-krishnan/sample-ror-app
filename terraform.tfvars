aws_account_id = "767397860288"
aws_region     = "us-east-1"

# VPC Configuration
project_name       = "ror-project"
availability_zones = ["us-east-1a", "us-east-1b"]
vpc_cidr           = "10.0.0.0/16"
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]

# ALB Configuration
alb_name = "ror-alb"

# ECS Configuration
ecs_cluster_name  = "ror-ecs-cluster"
ecs_service_name  = "ror-ecs-service"
ecs_desired_count = 2
environment       = "production"
container_image = [
  "767397860288.dkr.ecr.us-east-1.amazonaws.com/devops-ror-app",
  "767397860288.dkr.ecr.us-east-1.amazonaws.com/devops-ror-nginx"
]

# RDS Configuration (Using AWS Secrets Manager)
db_instance_class      = "db.t3.medium"   # Replaces `rds_instance_type`
rds_secret_arn         = "arn:aws:secretsmanager:us-east-1:767397860288:secret:rds-credentials-mAQVHx"
db_username            = "admin"  # Should match the Secrets Manager value
db_engine              = "postgres"
db_engine_version      = "17.2-R1"
db_allocated_storage   = 20
db_max_allocated_storage = 100   # New: Maximum storage limit
db_name                = "ror-database"
db_identifier          = "ror-db-instance"  # New: Unique identifier for the RDS instance
db_subnet_group_name   = "ror-db-subnet-group"  # Replaces `db_subnet_group`
multi_az               = true  # New: Enable Multi-AZ deployment
kms_key_arn            = "arn:aws:kms:us-east-1:767397860288:key/a58c6e2a-a0c5-4cd0-ab4c-870680b778df"  # New: Replace with actual KMS key ARN

# S3 Bucket
s3_bucket_name = "ror-app-bucket"

# Security Group
security_group_name = "ror-sg"
