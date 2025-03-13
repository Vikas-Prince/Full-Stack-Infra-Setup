
# Creating an IAM role for the EKS control plane
resource "aws_iam_role" "eks-cluster-role-test" {
  name = "eks-cluster-role-new"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      }
    ]
  })

  tags = {
    tag-key = "Eks-cluster-role"
  }
}

# Attaching AmazonEKSClusterPolicy to the EKS cluster role
resource "aws_iam_role_policy_attachment" "eks-role-policy"{
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.eks-cluster-role-test.name
}

# Creating EKS Cluster control plane with VPC configuration
resource "aws_eks_cluster" "eks-control-plane"{
    name = var.eks_cluster_name
    role_arn = aws_iam_role.eks-cluster-role-test.arn

    vpc_config{
        subnet_ids = var.eks_public_subnets
        
    }

    depends_on = [ aws_iam_role_policy_attachment.eks-role-policy ]
}

# Creating IAM role for EKS worker nodes
resource "aws_iam_role" "eks-worker-role"{
    name = "eks-worker-role"

    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect = "Allow"
      },
    ]
    })
}

# Attaching policies to the EKS worker role
resource "aws_iam_role_policy_attachment" "eks-worker-policy"{
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role = aws_iam_role.eks-worker-role.name
}

# Attaching AmazonEC2ContainerRegistryReadOnly policy to the worker role
resource "aws_iam_role_policy_attachment" "eks-ec2-container-policy"{
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role = aws_iam_role.eks-worker-role.name
}

# Attaching AmazonEKS_CNI_Policy to the worker role
resource "aws_iam_role_policy_attachment" "eks-worker-cni-policy"{
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role = aws_iam_role.eks-worker-role.name
}

# Creating EKS Node Group with worker node instances
resource "aws_eks_node_group" "eks-node-group"{
    cluster_name    = aws_eks_cluster.eks-control-plane.name
    node_group_name = var.worker_nodes_name
    node_role_arn = aws_iam_role.eks-worker-role.arn
    subnet_ids = var.worker_private_subnets

    instance_types = [var.worker_instance_type]

    tags = {
        Name = var.worker_nodes_name
    }
    scaling_config {
      desired_size = var.desired_size
      max_size = var.max_size
      min_size = var.min_size
    }
    update_config {
      max_unavailable = var.max_unavailable
    }

    depends_on = [ 
        aws_iam_role_policy_attachment.eks-worker-policy,
        aws_iam_role_policy_attachment.eks-ec2-container-policy,
        aws_iam_role_policy_attachment.eks-worker-cni-policy
     ]
}
