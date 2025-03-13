# Name of the EKS Cluster Control Plane
variable "eks_cluster_name" {
  description = "The name for the EKS Cluster control plane. This is the main entry point to your EKS Cluster."
  type        = string
  default     = "eks-cluster"
}

variable "eks_public_subnets"{
  description = "The ID of the public subnets."
  type        = list(string)
}

variable "worker_private_subnets" {
  description = "The ID of the private subnets."
  type = list(string)
}


# Desired Instances for EKS Worker Nodes
variable "desired_size" {
  description = "The desired number of instances for the EKS worker nodes."
  type        = number
  default = 2
}

# Minimum Instances for EKS Worker Nodes
variable "min_size" {
  description = "Minimum number of instances"
  type        = number
  default = 1
}

# Maximum  Instances for EKS Worker Nodes
variable "max_size" {
  description = "Maximum number of instances for the EKS worker Nodes"
  type        = number
  default = 3
}

# Maximum Instances should be available during upgrades
variable "max_unavailable" {
    description = "Maximum number of instances that can be unavailable during upgrades."
    type        = number
    default = 1
}

# Instance type for EKS Worker Nodes
variable "worker_instance_type" {
  description = "The EC2 instance type to use for the worker nodes in the EKS Node Group. Example: 't3.medium'."
  type        = string
  default     = "t2.micro"
}

# Name of the worker nodes in the EKS cluster
variable "worker_nodes_name" {
  description = "The name of the worker nodes in the EKS Node Group. Used for identification and tagging purposes."
  type        = string
  default     = "eks-worker-nodes"
}
