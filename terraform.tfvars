# Module input configuration should be placed here.
aws_default_region = "us-west-1"

# See https://registry.terraform.io/modules/infrahouse/ci-cd/aws/latest#output_state-manager-role
aws_iam_role_arn_state_manager = ""

# See https://registry.terraform.io/modules/infrahouse/ci-cd/aws/latest#output_admin-role
aws_iam_role_arn_admin = ""

# See https://registry.terraform.io/modules/infrahouse/ci-cd/aws/latest#output_github-role
aws_iam_role_arn_github = ""

default_tags = {
  "created_by" : "infrahouse/terraform-template" # GitHub repository that created a resource
}
