resource "aws_vpc" "ci_cd-vpc"{
    cidr_block = var.vpc_cidr_block
    instance_tenancy = "default"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = var.vpc_name
    }
}

# Creating public subnet 1a in the VPC
resource "aws_subnet" "ci_cd-public-subnet-1a"{
    vpc_id = aws_vpc.ci_cd-vpc.id
    cidr_block = var.ci_cd_public_subnet_1
    map_public_ip_on_launch = true
    availability_zone = var.ci_cd_public_subnet_1_region

    tags = {
        Name = var.ci_cd_public_subnet_name_1
    }
}

# Creating public subnet 1b in the VPC
resource "aws_subnet" "ci_cd-public-subnet-1b"{
    vpc_id = aws_vpc.ci_cd-vpc.id
    cidr_block = var.ci_cd_public_subnet_2
    map_public_ip_on_launch = true
    availability_zone = var.ci_cd_public_subnet_2_region

    tags= {
        Name = var.ci_cd_public_subnet_name_2
    }
}

# Creating private subnet 1a for worker nodes and ec2 instances (CI)
resource "aws_subnet" "ci_cd-private-subnet-1a"{
    vpc_id = aws_vpc.ci_cd-vpc.id
    cidr_block = var.ci_cd_private_subnet_1
    availability_zone = var.ci_cd_private_subnet_1_region

    tags = {
        Name = var.ci_cd_private_subnet_name_1
    }
}

# Creating private subnet 1b for worker nodes and ec2 instances (CI)
resource "aws_subnet" "ci_cd-private-subnet-1b"{
    vpc_id = aws_vpc.ci_cd-vpc.id
    cidr_block = var.ci_cd_private_subnet_2
    availability_zone = var.ci_cd_private_subnet_2_region

    tags = {
        Name = var.ci_cd_private_subnet_name_2
    }
}

# Creating private subnet 1c for worker nodes and ec2 instances (CI)
resource "aws_subnet" "ci_cd-private-subnet-1c"{
    vpc_id = aws_vpc.ci_cd-vpc.id
    cidr_block = var.ci_cd_private_subnet_3
    availability_zone = var.ci_cd_private_subnet_3_region

    tags ={
        Name = var.ci_cd_private_subnet_name_3
    }
}

# Creating an Internet Gateway for ci_cd VPC
resource "aws_internet_gateway" "ci_cd-internet-gateway"{
    vpc_id = aws_vpc.ci_cd-vpc.id
    
    tags = {
        Name = var.ci_cd_igw_name
    }
}

# Creating a route table to route traffic through the Internet Gateway
resource "aws_route_table" "ci_cd-route-table"{
    vpc_id = aws_vpc.ci_cd-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ci_cd-internet-gateway.id
    }
}

# Associating public subnet 1a with the route table
resource "aws_route_table_association" "routes"{
    subnet_id = aws_subnet.ci_cd-public-subnet-1a.id
    route_table_id = aws_route_table.ci_cd-route-table.id
}

# Associating public subnet 1b with the route table
resource "aws_route_table_association" "routes1"{
    subnet_id = aws_subnet.ci_cd-public-subnet-1b.id
    route_table_id = aws_route_table.ci_cd-route-table.id
}

# Creating an Elastic IP for the NAT Gateway
resource "aws_eip" "ci_cd-elastic_ip"{
    domain = "vpc"

    tags = {
        Name = var.elastic_ip_name
    }
}

# Creating NAT Gateway in public subnet 1a
resource "aws_nat_gateway" "ci_cd-nat-gateway"{
    allocation_id = aws_eip.ci_cd-elastic_ip.id
    subnet_id = aws_subnet.ci_cd-public-subnet-1a.id

    tags = {
        Name = var.ci_cd_nat_gateway_name
    }
}

# Creating a route table for private subnets to use the NAT Gateway
resource "aws_route_table" "ci_cd-private-route"{
    vpc_id = aws_vpc.ci_cd-vpc.id

    route{
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.ci_cd-nat-gateway.id
    }
}

# Associating private subnet 1a with the private route table
resource "aws_route_table_association" "ci_cd-routes1"{
    subnet_id = aws_subnet.ci_cd-private-subnet-1a.id
    route_table_id = aws_route_table.ci_cd-private-route.id
}

# Associating private subnet 1b with the private route table
resource "aws_route_table_association" "ci_cd-routes2"{
    subnet_id = aws_subnet.ci_cd-private-subnet-1b.id
    route_table_id = aws_route_table.ci_cd-private-route.id
}

# Associating private subnet 1c with the private route table
resource "aws_route_table_association" "ci_cd-routes3"{
    subnet_id = aws_subnet.ci_cd-private-subnet-1c.id
    route_table_id = aws_route_table.ci_cd-private-route.id
}
