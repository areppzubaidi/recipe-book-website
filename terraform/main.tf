# Configure Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure AWS provider
provider "aws" {
  region = var.aws_region
}

# Create security group for web server
resource "aws_security_group" "web_sg" {
  name        = "recipe-book-web-sg"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "recipe-book-web-sg"
  }
}

# Create EC2 instance with the correct AMI
resource "aws_instance" "recipe_book_server" {
  ami                    = "ami-0659642169bf1b4b2"  # Ubuntu 22.04 LTS in ap-southeast-1
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "recipe-book-server"
  }

  # User data to install Docker
  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update -y
    apt-get install -y docker-ce
    systemctl enable docker
    systemctl start docker
    usermod -aG docker ubuntu
    echo "Docker installed successfully"
  EOF
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.recipe_book_server.public_ip
}

output "public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.recipe_book_server.public_dns
}

output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "ssh -i ~/.ssh/recipe-book-key.pem ubuntu@${aws_instance.recipe_book_server.public_ip}"
}
