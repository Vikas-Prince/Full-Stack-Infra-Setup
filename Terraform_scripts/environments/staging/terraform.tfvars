aws_region                = "ap-south-1" # Or your region for staging
eks_public_subnet_1       = "10.0.1.0/24"
eks_public_subnet_name_1  = "eks-public-subnet-1-staging"
eks_public_subnet_1_region = "ap-south-1a"

eks_public_subnet_2       = "10.0.2.0/24"
eks_public_subnet_name_2  = "eks-public-subnet-2-staging"
eks_public_subnet_2_region = "ap-south-1b"

eks_private_subnet_1      = "10.0.3.0/24"
eks_private_subnet_name_1 = "eks-private-subnet-1-staging"
eks_private_subnet_1_region = "ap-south-1a"

eks_private_subnet_2      = "10.0.4.0/24"
eks_private_subnet_name_2 = "eks-private-subnet-2-staging"
eks_private_subnet_2_region = "ap-south-1b"

eks_private_subnet_3      = "10.0.5.0/24"
eks_private_subnet_name_3 = "eks-private-subnet-3-staging"
eks_private_subnet_3_region = "ap-south-1c"

eks_igw_name              = "eks-igw-staging"
elastic_ip_name           = "eks-elastic-ip-staging"
eks_nat_gateway_name      = "eks-nat-gateway-staging"

eks_cluster_name          = "eks-cluster-staging"
worker_instance_type      = "t3.medium"
worker_nodes_name         = "eks-worker-nodes-staging"
desired_size              = 2
min_size                  = 1
max_size                  = 3
max_unavailable           = 1
