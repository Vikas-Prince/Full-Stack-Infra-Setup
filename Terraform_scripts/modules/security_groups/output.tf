output "jenkins_security_gp"{
    value = aws_security_group.jenkins_master_sg.id
}

output "jenkins_slave_security_gp"{
    value = aws_security_group.jenkins_slaves_sg.id
}

output "nexus_security_gp"{
    value = aws_security_group.nexus_sg.id
}

output "sonar_security_gp"{
    value = aws_security_group.sonar_sg.id
}