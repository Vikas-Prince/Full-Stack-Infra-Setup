output "jenkins_master_public_ip" {
  description = "Public IP of Jenkins Master"
  value       = aws_instance.jenkins_master.public_ip
}

output "nexus_server_public_ip" {
  description = "Public IP of Nexus Server"
  value       = aws_instance.nexus_server.public_ip
}

output "sonarqube_server_public_ip" {
  description = "Public IP of SonarQube Server"
  value       = aws_instance.sonar_server.public_ip
}
