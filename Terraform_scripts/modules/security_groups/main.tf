
# ✅ Security Group for Jenkins Master
resource "aws_security_group" "jenkins_master_sg" {
  name        = "jenkins-master-sg"
  description = "Allow inbound traffic for Jenkins Master"
  vpc_id      = var.vpc_id

  # Allow HTTP access for Jenkins UI
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Change this to restrict access
  }

  # Allow SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Change this to restrict access
  }

  # Allow Jenkins Slaves to connect on JNLP (TCP 50000)
  ingress {
    from_port   = 50000
    to_port     = 50000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict this to internal IP ranges
  }

  # Outbound rules (Allow all traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ✅ Security Group for Jenkins Slaves
resource "aws_security_group" "jenkins_slaves_sg" {
  name        = "jenkins-slaves-sg"
  description = "Allow communication between Jenkins Master and Slaves"
  vpc_id      = var.vpc_id

  # Allow inbound JNLP communication from Jenkins Master
  ingress {
    from_port   = 50000
    to_port     = 50000
    protocol    = "tcp"
    security_groups = [aws_security_group.jenkins_master_sg.id]
  }

  # Outbound rules (Allow all traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ✅ Security Group for Nexus Server
resource "aws_security_group" "nexus_sg" {
  name        = "nexus-server-sg"
  description = "Allow access to Nexus Repository Manager"
  vpc_id      = var.vpc_id

  # Allow HTTP access for Nexus Web UI
  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict access to specific IPs
  }

  # Allow SSH access for administration
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict as needed
  }

  # Outbound rules (Allow all traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ✅ Security Group for SonarQube
resource "aws_security_group" "sonar_sg" {
  name        = "sonar-server-sg"
  description = "Allow access to SonarQube Server"
  vpc_id      = var.vpc_id

  # Allow HTTP access for SonarQube Web UI
  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict access to specific IPs
  }

  # Allow SSH access for administration
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict as needed
  }

  # Outbound rules (Allow all traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
