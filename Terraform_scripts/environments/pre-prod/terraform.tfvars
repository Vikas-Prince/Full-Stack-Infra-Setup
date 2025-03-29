ci_cd_public_subnet_1       = "10.0.1.0/24"
ci_cd_public_subnet_name_1  = "ci-cd-public-subnet-1-pre-prod"
ci_cd_public_subnet_1_region = "ap-south-1a"

ci_cd_public_subnet_2       = "10.0.2.0/24"
ci_cd_public_subnet_name_2  = "ci-cd-public-subnet-2-pre-prod"
ci_cd_public_subnet_2_region = "ap-south-1b"

ci_cd_private_subnet_1      = "10.0.3.0/24"
ci_cd_private_subnet_name_1 = "ci-cd-private-subnet-1-pre-prod"
ci_cd_private_subnet_1_region = "ap-south-1a"

ci_cd_private_subnet_2      = "10.0.4.0/24"
ci_cd_private_subnet_name_2 = "ci-cd-private-subnet-2-pre-prod"
ci_cd_private_subnet_2_region = "ap-south-1b"

ci_cd_private_subnet_3      = "10.0.5.0/24"
ci_cd_private_subnet_name_3 = "ci-cd-private-subnet-3-pre-prod"
ci_cd_private_subnet_3_region = "ap-south-1c"

ci_cd_igw_name              = "ci-cd-igw-pre-prod"
elastic_ip_name           = "ci-cd-elastic-ip-pre-prod"
ci_cd_nat_gateway_name      = "ci-cd-nat-gateway-pre-prod"

eks_cluster_name          = "eks-cluster-pre-prod"
worker_instance_type      = "t3.medium"
worker_nodes_name         = "eks-worker-nodes-pre-prod"
desired_size              = 2
min_size                  = 1
max_size                  = 3
max_unavailable           = 1

# CI resources
jenkins_master_ami = "ami-076c6dbba59aa92e6"
jenkins_slave_ami  = "ami-076c6dbba59aa92e6"
nexus_ami         = "ami-076c6dbba59aa92e6"
sonar_ami         = "ami-076c6dbba59aa92e6"
instance_type = "t3.medium"
key_name = "Jenkins"

slave_desired_size = 2
slave_max_size = 3
slave_min_size = 1

jenkins_master_tag = "jenkins-master-pre-prod"
jenkins_slave_tag  = "jenkins-slave-pre-prod"
nexus_server_tag   = "nexus-server-pre-prod"
sonar_server_tag   = "sonar-server-pre-prod"

