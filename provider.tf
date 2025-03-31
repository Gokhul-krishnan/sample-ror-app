provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile  # Define this in variables.tf
}
