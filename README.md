


# 🍳 Recipe Book Static Website - DevOps Project

[![Website](https://img.shields.io/badge/Website-Live-green)](http://13.215.50.74)
[![AWS](https://img.shields.io/badge/AWS-EC2-orange)](https://aws.amazon.com/ec2/)
[![Docker](https://img.shields.io/badge/Docker-Container-blue)](https://www.docker.com/)
[![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)](https://www.terraform.io/)
[![Ansible](https://img.shields.io/badge/Ansible-Automation-red)](https://www.ansible.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)

## 📋 Project Overview

A complete DevOps implementation of a static recipe book website deployed on AWS EC2 using Docker, Terraform, and Ansible. This project demonstrates the entire DevOps lifecycle from development to production deployment.

### 🎯 Key Features
- ✅ **Static Website** – Modern recipe book with responsive design
- ✅ **Docker Containerization** – Lightweight Nginx Alpine container
- ✅ **Infrastructure as Code** – AWS resources provisioned with Terraform
- ✅ **Configuration Management** – Automated deployment with Ansible
- ✅ **Cloud Deployment** – AWS EC2 (Singapore region, Free Tier)
- ✅ **Version Control** – Complete Git repository

### 🌐 Live Demo
**Access the live website:** [http://13.215.50.74](http://13.215.50.74)

---

## 📸 Screenshots

### Homepage
<img width="1168" height="937" alt="Screenshot 2026-03-27 at 7 31 38 PM" src="https://github.com/user-attachments/assets/40f83254-78d2-4541-b6fb-2bb4613ab4dd" />

*Main landing page with hero section and navigation*

### Recipe Cards
*Featured recipe cards with images and descriptions*

### AWS EC2 Console
<img width="1749" height="801" alt="Screenshot 2026-03-27 at 7 36 15 PM" src="https://github.com/user-attachments/assets/176830f6-64ad-4970-9579-8756ef6a148b" />

*EC2 instance running in Singapore region*

### Terraform Apply
<img width="727" height="865" alt="Screenshot 2026-03-27 at 7 35 35 PM" src="https://github.com/user-attachments/assets/55725f4d-b151-4ce4-bf9d-2652b652505a" />

*Terraform infrastructure provisioning*

---

## 🛠️ Technologies Used

| Category | Technology | Version | Purpose |
|----------|------------|---------|---------|
| **Frontend** | HTML5 | - | Website structure |
| | CSS3 | - | Styling and responsive design |
| | JavaScript | ES6 | Interactive features |
| **Container** | Docker | 24.0+ | Containerization |
| | Nginx Alpine | latest | Web server |
| **IaC** | Terraform | 1.5+ | Infrastructure provisioning |
| **CM** | Ansible | 2.14+ | Configuration management |
| **Cloud** | AWS EC2 | t2.micro | Cloud hosting |
| | AWS VPC | default | Networking |
| **OS** | Ubuntu | 22.04 LTS | Operating system |
| **Version Control** | Git | 2.40+ | Source control |
| | GitHub/GitLab | - | Remote repository |

---

## 📁 Project Structure

```
recipe-book-website/
│
├── website/                      # Static website files
│   ├── index.html               # Main HTML file
│   ├── styles.css               # CSS styling
│   ├── script.js                # JavaScript functionality
│   └── images/                  # Recipe images
│
├── docker/                       # Docker configuration
│   └── Dockerfile               # Multi-stage Docker build
│
├── terraform/                    # Infrastructure as Code
│   ├── main.tf                  # Main Terraform configuration
│   ├── variables.tf             # Input variables
│   └── outputs.tf               # Output values
│
├── ansible/                      # Configuration Management
│   ├── inventory.ini            # Host inventory
│   └── deploy-docker.yml        # Deployment playbook
│
├── .gitignore                    # Git ignore rules
├── README.md                     # Project documentation
└── LICENSE                       # MIT License
```

---

## 🚀 Quick Start

### Prerequisites

- [AWS Account](https://aws.amazon.com/) (Free Tier)
- [Terraform](https://www.terraform.io/downloads) (v1.5+)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) (v2.14+)
- [Docker](https://docs.docker.com/get-docker/) (v24.0+)
- [Git](https://git-scm.com/downloads) (v2.40+)
- [AWS CLI](https://aws.amazon.com/cli/) (configured with credentials)

### Step 1: Clone Repository

```bash
git clone https://github.com/areppzubaidi/recipe-book-website.git
cd recipe-book-website
```

### Step 2: Generate SSH Key Pair

```bash
ssh-keygen -t rsa -b 2048 -f ~/.ssh/recipe-book-key -N ""
chmod 400 ~/.ssh/recipe-book-key
```

### Step 3: Import SSH Key to AWS

```bash
aws ec2 import-key-pair \
    --key-name "recipe-book-key" \
    --public-key-material fileb://~/.ssh/recipe-book-key.pub \
    --region ap-southeast-1
```

### Step 4: Deploy Infrastructure with Terraform

```bash
cd terraform
terraform init
terraform plan
terraform apply -auto-approve
```

After `apply`, note the public IP output.

### Step 5: Update Ansible Inventory

```bash
cd ../ansible
cat > inventory.ini << EOF
[webserver]
recipe-book-server ansible_host=<EC2_PUBLIC_IP> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/recipe-book-key
EOF
```

### Step 6: Deploy Application with Ansible

```bash
ansible-playbook -i inventory.ini deploy-docker.yml
```

### Step 7: Access Website

Open your browser and navigate to `http://<EC2_PUBLIC_IP>`.

---

## 🔧 Management Commands

### SSH into EC2 Instance

```bash
ssh -i ~/.ssh/recipe-book-key ubuntu@<EC2_PUBLIC_IP>
```

### Check Docker Container Status

```bash
ssh -i ~/.ssh/recipe-book-key ubuntu@<EC2_PUBLIC_IP> "docker ps"
```

### View Container Logs

```bash
ssh -i ~/.ssh/recipe-book-key ubuntu@<EC2_PUBLIC_IP> "docker logs recipe-book"
```

### Restart Docker Container

```bash
ssh -i ~/.ssh/recipe-book-key ubuntu@<EC2_PUBLIC_IP> "docker restart recipe-book"
```

### Update Website Files

```bash
cd ansible
ansible-playbook -i inventory.ini deploy-docker.yml
```

### Destroy All Resources (Cleanup)

```bash
cd terraform
terraform destroy -auto-approve
```

---

## 📊 Deployment Details

| Resource | Specification | Status |
|----------|---------------|--------|
| **EC2 Instance** | t2.micro (Free Tier) | ✅ Running |
| **Region** | ap-southeast-1 (Singapore) | ✅ Active |
| **OS** | Ubuntu 22.04 LTS | ✅ Updated |
| **Docker Image** | Nginx Alpine (~12MB) | ✅ Built |
| **Container** | recipe-book | ✅ Running |
| **Ports** | 80 (HTTP), 22 (SSH) | ✅ Open |
| **Security Group** | recipe-book-web-sg | ✅ Configured |
| **SSH Key** | recipe-book-key | ✅ Imported |

---

## 💰 Cost Analysis (AWS Free Tier)

| Service | Free Tier Limit | Usage | Monthly Cost |
|---------|----------------|-------|--------------|
| EC2 t2.micro | 750 hours/month | 730 hours | $0.00 |
| Data Transfer | 15 GB/month | ~1 GB | $0.00 |
| EBS Storage | 30 GB/month | 8 GB | $0.00 |
| **Total** | | | **$0.00** |

---

## 🔒 Security Best Practices

1. **SSH Keys**: Never commit private keys to the repository.
2. **Security Groups**: Limit SSH access to your IP (use `0.0.0.0/0` only for testing).
3. **Terraform State**: Consider using a remote backend (S3 + DynamoDB) for team environments.
4. **Secrets Management**: Use environment variables or AWS Secrets Manager for sensitive data.
5. **Regular Updates**: Keep Ubuntu and Docker packages updated.

---

## 🚨 Troubleshooting

### Website Not Accessible

```bash
# Check container is running
ssh -i ~/.ssh/recipe-book-key ubuntu@<EC2_PUBLIC_IP> "docker ps"

# Check container logs
ssh -i ~/.ssh/recipe-book-key ubuntu@<EC2_PUBLIC_IP> "docker logs recipe-book"

# Restart container
ssh -i ~/.ssh/recipe-book-key ubuntu@<EC2_PUBLIC_IP> "docker restart recipe-book"
```

### SSH Connection Failed

```bash
# Verify key permissions
chmod 400 ~/.ssh/recipe-book-key

# Test connection
ssh -i ~/.ssh/recipe-book-key ubuntu@<EC2_PUBLIC_IP>

# Check security group rules
aws ec2 describe-security-groups --group-ids sg-xxxxxxxxx
```

### Terraform Apply Fails

```bash
# Refresh state
terraform refresh

# Destroy and recreate
terraform destroy -auto-approve
terraform apply -auto-approve
```

### Ansible Connection Failed

```bash
# Test connectivity
ansible -i inventory.ini -m ping all

# Install Python on remote host (if missing)
ssh -i ~/.ssh/recipe-book-key ubuntu@<EC2_PUBLIC_IP> "sudo apt-get update && sudo apt-get install -y python3"
```

---

## 📈 Future Enhancements

- [ ] **HTTPS**: Add SSL certificate with Let's Encrypt
- [ ] **Custom Domain**: Configure Route 53 with custom domain
- [ ] **CI/CD Pipeline**: GitLab CI/CD for automated deployments
- [ ] **Monitoring**: Set up CloudWatch and Prometheus metrics
- [ ] **Backup**: Automated EBS snapshots
- [ ] **Scaling**: Auto‑scaling group with load balancer
- [ ] **Database**: Add PostgreSQL for user recipes
- [ ] **Authentication**: User login and recipe saving
- [ ] **CDN**: CloudFront for global content delivery

---

## 📝 Learning Outcomes

This project demonstrates proficiency in:

1. **Frontend Development**: Building responsive websites
2. **Containerization**: Dockerfile optimization
3. **Infrastructure as Code**: Terraform provisioning
4. **Configuration Management**: Ansible automation
5. **Cloud Computing**: AWS EC2 deployment
6. **DevOps Practices**: CI/CD principles
7. **Version Control**: Git workflow

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **Unsplash** for recipe images
- **Google Fonts** for Poppins font
- **Docker** for containerization
- **HashiCorp** for Terraform
- **Red Hat** for Ansible
- **AWS** for cloud infrastructure

---

## 📧 Contact

**Author**: Arepp Zubaidi  
- **GitHub**: [@areppzubaidi](https://github.com/areppzubaidi)  
- **Project Link**: [https://github.com/areppzubaidi/recipe-book-website](https://github.com/areppzubaidi/recipe-book-website)  
- **Live Demo**: [http://13.215.50.74](http://13.215.50.74)

---

## ⭐ Show Your Support

If you found this project helpful, please give it a star on GitHub!

[![GitHub stars](https://img.shields.io/github/stars/areppzubaidi/recipe-book-website)](https://github.com/areppzubaidi/recipe-book-website/stargazers)

---

**Built with ❤️ as part of a complete DevOps implementation**
```

---

### 2. `docker/Dockerfile` – Optimised

```dockerfile
FROM nginx:alpine

# Copy static website files
COPY ./website /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Healthcheck (optional)
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1
```

---

### 3. Terraform Files

#### `terraform/variables.tf`

```hcl
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = "recipe-book-key"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block for SSH access (replace with your IP)"
  type        = string
  default     = "0.0.0.0/0"   # Change to your IP for security
}
```

#### `terraform/main.tf`

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Security Group
resource "aws_security_group" "web_sg" {
  name        = "recipe-book-web-sg"
  description = "Allow HTTP and SSH"

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from allowed CIDR"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
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

# EC2 Instance
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "recipe-book-server"
  }
}
```

#### `terraform/outputs.tf`

```hcl
output "public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.web.public_ip
}

output "public_dns" {
  description = "Public DNS of EC2 instance"
  value       = aws_instance.web.public_dns
}
```

---

### 4. Ansible Playbook

#### `ansible/deploy-docker.yml`

```yaml
---
- name: Deploy Recipe Book Website
  hosts: webserver
  become: yes
  vars:
    container_name: recipe-book
    image_name: recipe-book
    host_port: 80
    container_port: 80

  tasks:
    - name: Update apt cache
      apt:
        update_cache: yes
        cache_valid_time: 3600

    - name: Install Docker
      apt:
        name: docker.io
        state: present

    - name: Ensure Docker service is running
      systemd:
        name: docker
        state: started
        enabled: yes

    - name: Create directory for website files
      file:
        path: /tmp/recipe-book
        state: directory
        mode: '0755'

    - name: Copy website files to remote host
      synchronize:
        src: ../website/
        dest: /tmp/recipe-book/
        delete: yes
      delegate_to: localhost

    - name: Build Docker image
      docker_image:
        name: "{{ image_name }}"
        build:
          path: /tmp/recipe-book
        source: build
        state: present

    - name: Remove existing container if present
      docker_container:
        name: "{{ container_name }}"
        state: absent

    - name: Run Docker container
      docker_container:
        name: "{{ container_name }}"
        image: "{{ image_name }}"
        state: started
        restart_policy: always
        ports:
          - "{{ host_port }}:{{ container_port }}"
```

#### `ansible/inventory.ini` (template)

```ini
[webserver]
recipe-book-server ansible_host=<EC2_PUBLIC_IP> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/recipe-book-key
```

---

### 5. `.gitignore`

```
# Terraform
terraform/.terraform/
terraform/terraform.tfstate*
terraform/*.tfstate*
terraform/*.tfstate.backup
terraform/.terraform.lock.hcl

# Ansible
ansible/*.retry
ansible/inventory.ini   # (if it contains real IPs; you may want to keep a template)

# SSH keys
*.pem
*.key
*.pub

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE
.vscode/
.idea/
*.swp
*.swo

# Logs
*.log
```

---

### 6. `LICENSE`

```text
MIT License

Copyright (c) 2024 Arepp Zubaidi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 📌 How to Apply These Files

1. **Replace** the existing files in your repository with the corrected versions above.
2. **Update** the `allowed_ssh_cidr` in `terraform/variables.tf` to your actual IP (for security).
3. **Run** the Quick Start steps again (from `terraform init` onward).
4. **Take screenshots** as described in the README and place them in `screenshots/` (optional).
5. **Commit** and **push** all changes to your GitHub repository.

Now your project is clean, well‑documented, and ready for sharing or further enhancements. Let me know if you need any additional help!
