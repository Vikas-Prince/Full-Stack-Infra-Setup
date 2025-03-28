# aws_region                = "ap-south-1" # Or your region for staging
ci_cd_public_subnet_1       = "10.0.1.0/24"
ci_cd_public_subnet_name_1  = "ci_cd-public-subnet-1-staging"
ci_cd_public_subnet_1_region = "ap-south-1a"

ci_cd_public_subnet_2       = "10.0.2.0/24"
ci_cd_public_subnet_name_2  = "ci_cd-public-subnet-2-staging"
ci_cd_public_subnet_2_region = "ap-south-1b"

ci_cd_private_subnet_1      = "10.0.3.0/24"
ci_cd_private_subnet_name_1 = "ci_cd-private-subnet-1-staging"
ci_cd_private_subnet_1_region = "ap-south-1a"

ci_cd_private_subnet_2      = "10.0.4.0/24"
ci_cd_private_subnet_name_2 = "ci_cd-private-subnet-2-staging"
ci_cd_private_subnet_2_region = "ap-south-1b"

ci_cd_private_subnet_3      = "10.0.5.0/24"
ci_cd_private_subnet_name_3 = "ci_cd-private-subnet-3-staging"
ci_cd_private_subnet_3_region = "ap-south-1c"

ci_cd_igw_name              = "ci_cd-igw-staging"
elastic_ip_name           = "ci_cd-elastic-ip-staging"
ci_cd_nat_gateway_name      = "ci_cd-nat-gateway-staging"

eks_cluster_name          = "ci_cd-cluster-staging"
worker_instance_type      = "t2.micro"
worker_nodes_name         = "ci_cd-worker-nodes-staging"
desired_size              = 1
min_size                  = 1
max_size                  = 1
max_unavailable           = 1


# AMI IDs for each server (Ensure the latest AMIs are used)
jenkins_master_ami = "ami-076c6dbba59aa92e6"
jenkins_slave_ami  = "ami-076c6dbba59aa92e6"
nexus_ami         = "ami-076c6dbba59aa92e6"
sonar_ami         = "ami-076c6dbba59aa92e6"
instance_type = "t2.micro"
key_name = "Jenkins"

slave_desired_size = 1
slave_max_size = 1
slave_min_size = 1
