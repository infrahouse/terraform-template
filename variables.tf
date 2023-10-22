variable "aws_default_region" {
  description = "The default AWS region."
  type        = string
}

variable "aws_iam_role_arn_state_manager" {
  description = "AWS IAM role ARN that can read/write to the Terraform state bucket."
  type        = string
}

variable "aws_iam_role_arn_admin" {
  description = "AWS IAM role ARN in the principal AWS account."
  type        = string
}

variable "aws_iam_role_arn_github" {
  description = "AWS IAM role ARN in the CI/CD AWS account. A GitHub Actions worker assumed this role."
  type        = string
}

variable "default_tags" {
  description = "A map with tags that will be applied to all resources created by the AWS provider."
  type        = map(string)
}
