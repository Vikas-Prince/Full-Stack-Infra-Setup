variable "vpc_id"{
    description = "Fetching Vpc Id from vpc module"
    type = string
}

variable "private_subnet_ids"{
    description = "Private Subnets for the VPC"
    type = list(string)
}

variable "slave-sgp"{
    description = "Security Groups for the ssm to communicate"
    type = string
}