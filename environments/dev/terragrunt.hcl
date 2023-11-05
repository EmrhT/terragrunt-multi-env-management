terraform {
  source = "github.com/EmrhT/aws-vpc-network-terraform"
}

include "remote_state" {
  path = find_in_parent_folders()
}

locals {
  region = "eu-west-1"
}

inputs = {
  environment       = "Development"
  eks_cluster_name  = "Dev-EKS-Demo"
  node_group_name1   = "webapp-dev-01"
  node_group_name2   = "webapp-dev-02"
  node_role_name    = "NodeRole-dev"
  nodegroup_keypair = "webapp-dev-01-key"
  cluster_role      = "AWSEKSClusterRole-dev"
  cluster_version = "1.27"
  region_name       = local.region
  vpc_cidr_block    = "10.10.0.0/16"
  public_subnets = {
    "${local.region}a" = "10.10.0.0/24"
    "${local.region}b" = "10.10.2.0/24"
  }
  private_subnets = {
    "${local.region}a" = "10.10.1.0/24"
    "${local.region}b" = "10.10.3.0/24"
  }
  instance_types  = ["t3.small"]
  capacity_type = "SPOT"
  desired_size  = 5
  max_size  = 7
  min_size  = 1
}