# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
    backend "s3" {
        bucket  = "terraform-statefiles-aws-vpc-eks"
        key     = "./terraform.tfstate"
        region  = "-1"
        encrypt = true
        dynamodb_table = "terraform-statefiles-aws-vpc-eks-tg-state-lock"
    }
}
