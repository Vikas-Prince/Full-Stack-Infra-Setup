aws_region                = "ap-south-1"  # Or your region for production
eks_public_subnet_1       = "10.0.1.0/24"
eks_public_subnet_name_1  = "eks-public-subnet-1-prod"
eks_public_subnet_1_region = "ap-south-1a"

eks_public_subnet_2       = "10.0.2.0/24"
eks_public_subnet_name_2  = "eks-public-subnet-2-prod"
eks_public_subnet_2_region = "ap-south-1b"

eks_private_subnet_1      = "10.0.3.0/24"
eks_private_subnet_name_1 = "eks-private-subnet-1-prod"
eks_private_subnet_1_region = "ap-south-1a"

eks_private_subnet_2      = "10.0.4.0/24"
eks_private_subnet_name_2 = "eks-private-subnet-2-prod"
eks_private_subnet_2_region = "ap-south-1b"

eks_private_subnet_3      = "10.0.5.0/24"
eks_private_subnet_name_3 = "eks-private-subnet-3-prod"
eks_private_subnet_3_region = "ap-south-1c"

eks_igw_name              = "eks-igw-prod"
elastic_ip_name           = "eks-elastic-ip-prod"
eks_nat_gateway_name      = "eks-nat-gateway-prod"

# eks dynamic variables
eks_cluster_name          = "eks-cluster-prod"
desired_size              = 3
min_size                  = 2
max_size                  = 5
max_unavailable           = 2
worker_instance_type      = "m5.large"
worker_nodes_name         = "eks-worker-nodes-prod"
