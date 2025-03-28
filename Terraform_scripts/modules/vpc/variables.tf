# VPC ID to reference in environment
variable "vpc_cidr_block" {
  description = "The VPC ID to which the resources will be deployed. This should be a valid VPC ID in your AWS account."
  type        = string
  default     = "10.0.0.0/16"  # Replace with your default VPC ID or leave empty to be passed as input
}

variable "vpc_name"{
  description = "The name of the VPC to be created"
  type        = string
  default = "anonymous vpc"
}

# Public Subnet 1 CIDR block for ci_cd Cluster
variable "ci_cd_public_subnet_1" {
  description = "CIDR block for the first public subnet where ci cd components will be deployed."
  type        = string
  default     = "10.0.1.0/24"
}

# Name of Public Subnet 1 (usually used for tagging)
variable "ci_cd_public_subnet_name_1" {
  description = "Name of the first public subnet for the ci cd. Used for identification and tagging purposes."
  type        = string
  default     = "ci-cd-public-subnet-1"
}

# Availability Zone (Region) for Public Subnet 1
variable "ci_cd_public_subnet_1_region" {
  description = "The AWS Availability Zone for the first public subnet."
  type        = string
  default     = "ap-south-1a"
}

# Public Subnet 2 CIDR block for ci_cd Cluster
variable "ci_cd_public_subnet_2" {
  description = "CIDR block for the second public subnet where ci cd components will be deployed."
  type        = string
  default     = "10.0.2.0/24"
}

# Name of Public Subnet 2 (usually used for tagging)
variable "ci_cd_public_subnet_name_2" {
  description = "Name of the second public subnet for the ci cd components. Used for identification and tagging purposes."
  type        = string
  default     = "ci-cd-public-subnet-2"
}

# Availability Zone (Region) for Public Subnet 2
variable "ci_cd_public_subnet_2_region" {
  description = "The AWS Availability Zone for the second public subnet."
  type        = string
  default     = "ap-south-1b"
}

# Private Subnet 1 CIDR block for ci_cd Cluster
variable "ci_cd_private_subnet_1" {
  description = "CIDR block for the first private subnet where ci cd components and other internal services will be deployed."
  type        = string
  default     = "10.0.3.0/24"
}

# Name of Private Subnet 1 (usually used for tagging)
variable "ci_cd_private_subnet_name_1" {
  description = "Name of the first private subnet for the ci cd components. Used for identification and tagging purposes."
  type        = string
  default     = "ci-cd-private-subnet-1"
}

# Availability Zone (Region) for Private Subnet 1
variable "ci_cd_private_subnet_1_region" {
  description = "The AWS Availability Zone (Region) for the first private subnet."
  type        = string
  default     = "ap-south-1a"
}

# Private Subnet 2 CIDR block for ci_cd Cluster
variable "ci_cd_private_subnet_2" {
  description = "CIDR block for the second private subnet where ci cd components and other internal services will be deployed."
  type        = string
  default     = "10.0.4.0/24"
}

# Name of Private Subnet 2 (usually used for tagging)
variable "ci_cd_private_subnet_name_2" {
  description = "Name of the second private subnet for the ci cd components. Used for identification and tagging purposes."
  type        = string
  default     = "ci-cd-private-subnet-2"
}

# Availability Zone (Region) for Private Subnet 2
variable "ci_cd_private_subnet_2_region" {
  description = "The AWS Availability Zone  for the second private subnet."
  type        = string
  default     = "ap-south-1b"
}

# Private Subnet 3 CIDR block for ci_cd Cluster
variable "ci_cd_private_subnet_3" {
  description = "CIDR block for the third private subnet where ci cd components and other internal services will be deployed."
  type        = string
  default     = "10.0.5.0/24"
}

# Name of Private Subnet 3 (usually used for tagging)
variable "ci_cd_private_subnet_name_3" {
  description = "Name of the third private subnet for the ci cd components. Used for identification and tagging purposes."
  type        = string
  default     = "ci-cd-private-subnet-3"
}

# Availability Zone (Region) for Private Subnet 3
variable "ci_cd_private_subnet_3_region" {
  description = "The AWS Availability Zone for the third private subnet."
  type        = string
  default     = "ap-south-1c"
}

# Name of the Internet Gateway (IGW) for the VPC
variable "ci_cd_igw_name" {
  description = "The name to assign to the Internet Gateway (IGW) in the VPC. IGWs allow communication between instances in the VPC and the internet."
  type        = string
  default     = "ci-cd-igw"
}

# Name of the Elastic IP to be created
variable "elastic_ip_name" {
  description = "The name to assign to the Elastic IP (EIP). EIP is typically used for NAT Gateway or other internet-facing resources."
  type        = string
  default     = "ci-cd-elastic-ip"
}

# Name of the NAT Gateway for routing internet traffic to private subnets
variable "ci_cd_nat_gateway_name" {
  description = "The name to assign to the NAT Gateway in the VPC. The NAT Gateway allows instances in private subnets to access the internet."
  type        = string
  default     = "ci-cd-nat-gateway"
}
