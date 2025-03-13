# variables.tf

# Public Subnets
variable "eks_public_subnet_1" {
  description = "The first public subnet for EKS"
  type        = string
}

variable "eks_public_subnet_name_1" {
  description = "The name of the first public subnet for EKS"
  type        = string
}

variable "eks_public_subnet_1_region" {
  description = "The region of the first public subnet for EKS"
  type        = string
}

variable "eks_public_subnet_2" {
  description = "The second public subnet for EKS"
  type        = string
}

variable "eks_public_subnet_name_2" {
  description = "The name of the second public subnet for EKS"
  type        = string
}

variable "eks_public_subnet_2_region" {
  description = "The region of the second public subnet for EKS"
  type        = string
}

# Private Subnets
variable "eks_private_subnet_1" {
  description = "The first private subnet for EKS"
  type        = string
}

variable "eks_private_subnet_name_1" {
  description = "The name of the first private subnet for EKS"
  type        = string
}

variable "eks_private_subnet_1_region" {
  description = "The region of the first private subnet for EKS"
  type        = string
}

variable "eks_private_subnet_2" {
  description = "The second private subnet for EKS"
  type        = string
}

variable "eks_private_subnet_name_2" {
  description = "The name of the second private subnet for EKS"
  type        = string
}

variable "eks_private_subnet_2_region" {
  description = "The region of the second private subnet for EKS"
  type        = string
}

variable "eks_private_subnet_3" {
  description = "The third private subnet for EKS"
  type        = string
}

variable "eks_private_subnet_name_3" {
  description = "The name of the third private subnet for EKS"
  type        = string
}

variable "eks_private_subnet_3_region" {
  description = "The region of the third private subnet for EKS"
  type        = string
}

# Other Resources
variable "eks_igw_name" {
  description = "The name of the Internet Gateway for EKS"
  type        = string
}

variable "elastic_ip_name" {
  description = "The name of the Elastic IP"
  type        = string
}

variable "eks_nat_gateway_name" {
  description = "The name of the NAT Gateway for EKS"
  type        = string
}



# EKS Cluster Name
variable "eks_cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

# Worker Nodes Name
variable "worker_nodes_name" {
  description = "The name to assign to the worker nodes."
  type        = string
}

# Worker Node Instance Type
variable "worker_instance_type" {
  description = "The EC2 instance type for the worker nodes."
  type        = string
}

# Desired Size of Worker Nodes
variable "desired_size" {
  description = "The desired size (number of worker nodes) for the worker node group."
  type        = number
}

# Minimum Size of Worker Nodes
variable "min_size" {
  description = "The minimum size (number of worker nodes) for the worker node group."
  type        = number
}

# Maximum Size of Worker Nodes
variable "max_size" {
  description = "The maximum size (number of worker nodes) for the worker node group."
  type        = number
}

# Maximum Unavailable Worker Nodes
variable "max_unavailable" {
  description = "The maximum number of unavailable worker nodes during scaling."
  type        = number
}

