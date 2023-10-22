provider "aws" {
  region = var.aws_default_region
  assume_role {
    role_arn = var.aws_iam_role_arn_admin
  }
  default_tags {
    tags = var.default_tags
  }
}

provider "aws" {
  region = "us-west-1"
  alias  = "aws-principal-uw1"
  assume_role {
    role_arn = var.aws_iam_role_arn_admin
  }
  default_tags {
    tags = var.default_tags
  }
}

provider "aws" {
  region = "us-west-2"
  alias  = "aws-principal-uw2"
  assume_role {
    role_arn = var.aws_iam_role_arn_admin
  }
  default_tags {
    tags = var.default_tags
  }
}

provider "aws" {
  region = "us-west-1"
  alias  = "aws-tf-states-uw1"
  assume_role {
    role_arn = var.aws_iam_role_arn_state_manager
  }
  default_tags {
    tags = var.default_tags
  }
}
