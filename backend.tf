terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket         = "ror-terra-state-bucket"
    key            = "infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ror-terra-lock-table"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}
