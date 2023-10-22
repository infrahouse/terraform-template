# Terraform root repo

This is a template repo of a root Terraform module. To remind, the root module
is one that creates resources, not to be used by other Terraform modules.

The repository created from this template comes with a Terraform CI/CD configuration.

The CI/CD will need several AWS resources such as an S3 bucket for the Terraform state,
a DynamoDB table for the state locks and a few IAM roles. All the resources are compiled 
in a [CI/CD module](https://registry.terraform.io/modules/infrahouse/ci-cd/aws/latest).

The module operates with three AWS accounts that may pop up across its code.

* _AWS principal account_. This is the account where the roo module is going to create 
  all resources. The root module uses an IAM role in this account, referred as an "admin" role.
* _AWS CI/CD account_. This is a supporting account that holds resources related and/or used by
 the CI/CD workflow. First and foremost, it is an IAM role assumed by a GitHub Actions worker
 a.k.a. "github" role.
* _AWS TF States account_. This account holds the S3 bucket for the Terraform state, a DynamoDB 
 table for state locks, and an IAM role used to access the state. The role is known as a "state manager" role.
