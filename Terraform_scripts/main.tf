
# VPC module for staging or production environment
module "vpc" {
  source = "./modules/vpc"

  # Pass the required variables
  eks_public_subnet_1        = var.eks_public_subnet_1
  eks_public_subnet_name_1   = var.eks_public_subnet_name_1
  eks_public_subnet_1_region = var.eks_public_subnet_1_region

  eks_public_subnet_2        = var.eks_public_subnet_2
  eks_public_subnet_name_2   = var.eks_public_subnet_name_2
  eks_public_subnet_2_region = var.eks_public_subnet_2_region

  eks_private_subnet_1        = var.eks_private_subnet_1
  eks_private_subnet_name_1   = var.eks_private_subnet_name_1
  eks_private_subnet_1_region = var.eks_private_subnet_1_region

  eks_private_subnet_2        = var.eks_private_subnet_2
  eks_private_subnet_name_2   = var.eks_private_subnet_name_2
  eks_private_subnet_2_region = var.eks_private_subnet_2_region

  eks_private_subnet_3        = var.eks_private_subnet_3
  eks_private_subnet_name_3   = var.eks_private_subnet_name_3
  eks_private_subnet_3_region = var.eks_private_subnet_3_region

  eks_igw_name         = var.eks_igw_name
  elastic_ip_name      = var.elastic_ip_name
  eks_nat_gateway_name = var.eks_nat_gateway_name

}

# EKS module for staging or production environment
module "aws_eks_cluster" {
  source = "./modules/eks"

  eks_cluster_name   = var.eks_cluster_name
  eks_public_subnets = module.vpc.public_subnets

  worker_nodes_name      = var.worker_nodes_name
  worker_instance_type   = var.worker_instance_type
  worker_private_subnets = module.vpc.worker_private_subnets

  desired_size    = var.desired_size
  min_size        = var.min_size
  max_size        = var.max_size
  max_unavailable = var.max_unavailable
}

