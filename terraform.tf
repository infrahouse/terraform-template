terraform {
  required_version = "~> 1.5"
  backend "s3" {
    # Value of https://registry.terraform.io/modules/infrahouse/ci-cd/aws/latest#output_bucket_name
    bucket  = "<STATE BUCKET NAME>"
    key     = "terraform.state"
    region  = "us-west-1"
    encrypt = true
    # Value of https://registry.terraform.io/modules/infrahouse/ci-cd/aws/latest#output_state-manager-role
    role_arn = "<STATE MANAGER ROLE ARN>"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.11"
    }
  }
}
