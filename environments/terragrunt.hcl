locals {
  account_id = "444469924026" # change in each environment in assumed role's executions
}

generate "backend" {
  path      = "s3-backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
    backend "s3" {
        bucket  = "terraform-statefiles-aws-vpc-eks-${local.account_id}"
        key     = "${path_relative_to_include()}/terraform.tfstate"
        region  = "eu-west-1"
        encrypt = true
        dynamodb_table = "terraform-statefiles-aws-vpc-eks-tg-state-lock"
    }
}
EOF
}