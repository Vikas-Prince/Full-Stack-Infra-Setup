# VPC module for staging or production environment
module "vpc" {
  source = "./modules/vpc"

  # Public Subnets
  ci_cd_public_subnet_1        = var.ci_cd_public_subnet_1
  ci_cd_public_subnet_name_1   = var.ci_cd_public_subnet_name_1
  ci_cd_public_subnet_1_region = var.ci_cd_public_subnet_1_region

  ci_cd_public_subnet_2        = var.ci_cd_public_subnet_2
  ci_cd_public_subnet_name_2   = var.ci_cd_public_subnet_name_2
  ci_cd_public_subnet_2_region = var.ci_cd_public_subnet_2_region

  # Private Subnets
  ci_cd_private_subnet_1        = var.ci_cd_private_subnet_1
  ci_cd_private_subnet_name_1   = var.ci_cd_private_subnet_name_1
  ci_cd_private_subnet_1_region = var.ci_cd_private_subnet_1_region

  ci_cd_private_subnet_2        = var.ci_cd_private_subnet_2
  ci_cd_private_subnet_name_2   = var.ci_cd_private_subnet_name_2
  ci_cd_private_subnet_2_region = var.ci_cd_private_subnet_2_region

  ci_cd_private_subnet_3        = var.ci_cd_private_subnet_3
  ci_cd_private_subnet_name_3   = var.ci_cd_private_subnet_name_3
  ci_cd_private_subnet_3_region = var.ci_cd_private_subnet_3_region

  # Networking Components
  ci_cd_igw_name         = var.ci_cd_igw_name
  elastic_ip_name        = var.elastic_ip_name
  ci_cd_nat_gateway_name = var.ci_cd_nat_gateway_name
}

# EKS Cluster Module
module "aws_eks_cluster" {
  source = "./modules/eks"

  eks_cluster_name   = var.eks_cluster_name
  eks_public_subnets = module.vpc.ci_cd_public_subnets

  worker_nodes_name      = var.worker_nodes_name
  worker_instance_type   = var.worker_instance_type
  worker_private_subnets = module.vpc.ci_cd_private_subnets

  desired_size    = var.desired_size
  min_size        = var.min_size
  max_size        = var.max_size
  max_unavailable = var.max_unavailable
}

# Security Groups Module
module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

# session_manager Module
module "session_manager" {
  source             = "./modules/iam_ssm"
  vpc_id             = module.vpc.vpc_id
  slave-sgp          = module.security_groups.jenkins_slave_security_gp
  private_subnet_ids = module.vpc.ci_cd_private_subnets
}

# CI/CD Infrastructure Module
module "ci_infra" {
  source = "./modules/ci_infra"

  vpc_id = module.vpc.vpc_id

  # AMI IDs
  jenkins_master_ami = var.jenkins_master_ami
  jenkins_slave_ami  = var.jenkins_slave_ami
  nexus_ami         = var.nexus_ami
  sonar_ami         = var.sonar_ami

  instance_type = var.instance_type

  # Network Subnets
  ec2_subnet_private = module.vpc.ci_cd_private_subnets
  ec2_subnet_public  = module.vpc.ci_cd_public_subnets

  # Instance Names
  jenkins_master_tag = var.jenkins_master_tag
  nexus_server_tag = var.nexus_server_tag
  sonar_server_tag = var.sonar_server_tag

  # Security Groups
  jenkins_sgp      = module.security_groups.jenkins_security_gp
  jenkins_slave_sg = module.security_groups.jenkins_slave_security_gp
  nexus_sg        = module.security_groups.nexus_security_gp
  sonar_sg        = module.security_groups.sonar_security_gp

  # IAM Instance Profile
  instance_profile = module.session_manager.ssm_instance_profile

  #Jenkins autoscale
  slave_desired_size = var.slave_desired_size
  slave_min_size     = var.slave_min_size
  slave_max_size     = var.slave_max_size

  key_name = var.key_name
}
