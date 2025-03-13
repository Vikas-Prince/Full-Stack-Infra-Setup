output "public_subnets"{
    value = [
        aws_subnet.eks-public-subnet-1a.id,
        aws_subnet.eks-public-subnet-1b.id
    ]
}


output "worker_private_subnets"{
    value = [
        aws_subnet.worker-private-subnet-1a.id,
        aws_subnet.worker-private-subnet-1b.id,
        aws_subnet.worker-private-subnet-1c.id
    ]
}
