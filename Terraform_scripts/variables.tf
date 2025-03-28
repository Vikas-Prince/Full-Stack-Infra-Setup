# variables.tf

# Public Subnets
variable "ci_cd_public_subnet_1" {
  description = "The first public subnet for ci_cd"
  type        = string
}

variable "ci_cd_public_subnet_name_1" {
  description = "The name of the first public subnet for ci_cd"
  type        = string
}

variable "ci_cd_public_subnet_1_region" {
  description = "The region of the first public subnet for ci_cd"
  type        = string
}

variable "ci_cd_public_subnet_2" {
  description = "The second public subnet for ci_cd"
  type        = string
}

variable "ci_cd_public_subnet_name_2" {
  description = "The name of the second public subnet for ci_cd"
  type        = string
}

variable "ci_cd_public_subnet_2_region" {
  description = "The region of the second public subnet for ci_cd"
  type        = string
}

# Private Subnets
variable "ci_cd_private_subnet_1" {
  description = "The first private subnet for ci_cd"
  type        = string
}

variable "ci_cd_private_subnet_name_1" {
  description = "The name of the first private subnet for ci_cd"
  type        = string
}

variable "ci_cd_private_subnet_1_region" {
  description = "The region of the first private subnet for ci_cd"
  type        = string
}

variable "ci_cd_private_subnet_2" {
  description = "The second private subnet for ci_cd"
  type        = string
}

variable "ci_cd_private_subnet_name_2" {
  description = "The name of the second private subnet for ci_cd"
  type        = string
}

variable "ci_cd_private_subnet_2_region" {
  description = "The region of the second private subnet for ci_cd"
  type        = string
}

variable "ci_cd_private_subnet_3" {
  description = "The third private subnet for ci_cd"
  type        = string
}

variable "ci_cd_private_subnet_name_3" {
  description = "The name of the third private subnet for ci_cd"
  type        = string
}

variable "ci_cd_private_subnet_3_region" {
  description = "The region of the third private subnet for ci_cd"
  type        = string
}

# Other Resources
variable "ci_cd_igw_name" {
  description = "The name of the Internet Gateway for ci_cd"
  type        = string
}

variable "elastic_ip_name" {
  description = "The name of the Elastic IP"
  type        = string
}

variable "ci_cd_nat_gateway_name" {
  description = "The name of the NAT Gateway for ci_cd"
  type        = string
}



# ci_cd Cluster Name
variable "eks_cluster_name" {
  description = "The name of the ci_cd cluster."
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


# AMI IDs for EC2 Instances
variable "jenkins_master_ami" {
  description = "AMI ID for Jenkins Master instance"
  type        = string
}

variable "jenkins_slave_ami" {
  description = "AMI ID for Jenkins Slave instances used in Auto Scaling Group"
  type        = string
}

variable "nexus_ami" {
  description = "AMI ID for Nexus Repository Manager"
  type        = string
}

variable "sonar_ami" {
  description = "AMI ID for SonarQube Server"
  type        = string
}

# EC2 Instance Type (Default: t3.medium for balanced performance)
variable "instance_type" {
  description = "EC2 instance type for Jenkins, Nexus, and SonarQube"
  type        = string
  default     = "t3.medium"
}

# SSH Key Pair for EC2 Access
variable "key_name" {
  description = "SSH key name for EC2 instances"
  type        = string
}


# Desired Instances for Jenkins slave Nodes
variable "slave_desired_size" {
  description = "The desired number of instances for the EKS worker nodes."
  type        = number
  default = 2
}

# Minimum Instances for Jenkins slave Nodes
variable "slave_min_size" {
  description = "Minimum number of instances"
  type        = number
  default = 1
}

# Maximum  Instances for Jenkins slave Nodes
variable "slave_max_size" {
  description = "Maximum number of instances for the EKS worker Nodes"
  type        = number
  default = 3
}

