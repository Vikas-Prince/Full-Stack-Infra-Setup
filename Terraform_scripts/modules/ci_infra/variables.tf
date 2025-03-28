# 🌐 VPC Configuration  
variable "vpc_id" {
  description = "VPC ID from the VPC module output"
  type        = string
}

# AMI IDs for Each Instance  
variable "jenkins_master_ami" {
  description = "AMI ID for Jenkins Master"
  type        = string
}

variable "jenkins_slave_ami" {
  description = "AMI ID for Jenkins Slaves (Auto Scaling Group)"
  type        = string
}

variable "nexus_ami" {
  description = "AMI ID for Nexus Repository"
  type        = string
}

variable "sonar_ami" {
  description = "AMI ID for SonarQube"
  type        = string
}

# Instance Type (Default: t3.medium for optimal performance)  
variable "instance_type" {
  description = "EC2 instance type for Jenkins, Nexus, and SonarQube"
  type        = string
  default     = "t3.medium"
}

# Network Configuration  
variable "ec2_subnet_public" {
  description = "Public subnet IDs for externally accessible instances"
  type        = list(string)
}

variable "ec2_subnet_private" {
  description = "Private subnet IDs for Jenkins Slaves"
  type        = list(string)
}

# 🔑 SSH Key Pair  
variable "key_name" {
  description = "SSH key name for EC2 access"
  type        = string
}

# 🔐 IAM Instance Profile for SSM  
variable "instance_profile" {
  description = "IAM instance profile for SSM connectivity"
  type        = string
}

# 🔒 Security Group IDs  
variable "jenkins_sgp" {
  description = "Security Group ID for Jenkins Master"
  type        = string
}

variable "jenkins_slave_sg" {
  description = "Security Group ID for Jenkins Slaves"
  type        = string
}

variable "nexus_sg" {
  description = "Security Group ID for Nexus Repository"
  type        = string
}

variable "sonar_sg" {
  description = "Security Group ID for SonarQube Server"
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
