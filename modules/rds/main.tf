# Fetch the existing RDS credentials from Secrets Manager using the provided ARN
data "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id = var.rds_secret_arn
}

# Create RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.private_subnets
}

# Create the RDS instance (using credentials from Secrets Manager)
resource "aws_db_instance" "rds_instance" {
  allocated_storage      = var.db_allocated_storage
  db_instance_class      = var.db_instance_class
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  engine                 = "postgres"
  engine_version         = var.db_engine_version
  db_name                = var.db_identifier
  username               = jsondecode(data.aws_secretsmanager_secret_version.rds_secret_version.secret_string)["username"]
  password               = jsondecode(data.aws_secretsmanager_secret_version.rds_secret_version.secret_string)["password"]
  multi_az               = var.multi_az
  storage_type           = "gp2"
  max_allocated_storage  = var.db_max_allocated_storage
  vpc_security_group_ids = [var.db_sg_id]
  kms_key_id             = var.kms_key_arn
}

