

# Jenkins Master Instance
resource "aws_instance" "jenkins_master" {
  ami                    = var.jenkins_master_ami
  instance_type          = var.instance_type
  subnet_id              = var.ec2_subnet_public[0]
  vpc_security_group_ids = [var.jenkins_sgp]
  key_name               = var.key_name
  

  tags = {
    Name = var.jenkins_master_tag
  }
}

# Jenkins Slave Launch Template
resource "aws_launch_template" "jenkins_slave_lt" {
  name          = var.jenkins_slave_lt_name
  image_id      = var.jenkins_slave_ami
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = false  # Keeping slaves private
    security_groups             = [var.jenkins_slave_sg]
  }

  iam_instance_profile{
      arn = var.instance_profile
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.jenkins_slave_lt_name
    }
  }
}

# Jenkins Slave Auto Scaling Group
resource "aws_autoscaling_group" "jenkins_slave_asg" {
  name                = var.jenkins_slave_asg_name
  max_size           = var.slave_max_size
  min_size           = var.slave_min_size
  desired_capacity   = var.slave_desired_size
  vpc_zone_identifier = var.ec2_subnet_private

  launch_template {
    id      = aws_launch_template.jenkins_slave_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = var.jenkins_slave_asg_name
    propagate_at_launch = true
  }
}

# Nexus Server
resource "aws_instance" "nexus_server" {
  ami                    = var.nexus_ami
  instance_type          = var.instance_type
  subnet_id              = var.ec2_subnet_public[1]
  vpc_security_group_ids = [var.nexus_sg]
  key_name               = var.key_name

  tags = {
    Name = var.nexus_server_tag
  }
}

# SonarQube Server
resource "aws_instance" "sonar_server" {
  ami                    = var.sonar_ami
  instance_type          = var.instance_type
  subnet_id              = var.ec2_subnet_public[1]
  vpc_security_group_ids = [var.sonar_sg]
  key_name               = var.key_name

  tags = {
    Name = var.nexus_server_tag
  }
}
