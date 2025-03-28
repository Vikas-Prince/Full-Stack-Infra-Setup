

output "vpc_id" {
    value       = aws_vpc.ci_cd-vpc.id
}
output "ci_cd_public_subnets"{
    value = [
        aws_subnet.ci_cd-public-subnet-1a.id,
        aws_subnet.ci_cd-public-subnet-1b.id
    ]
}


output "ci_cd_private_subnets"{
    value = [
        aws_subnet.ci_cd-private-subnet-1a.id,
        aws_subnet.ci_cd-private-subnet-1b.id,
        aws_subnet.ci_cd-private-subnet-1c.id
    ]
}
