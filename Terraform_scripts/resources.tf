# Define a VPC using the Terraform AWS VPC module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name    = "my-vpc"
  cidr    = "10.0.0.0/16"
  azs     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]

  # Define public subnets
  public_subnets       = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}
