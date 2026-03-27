

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
- ✅ **Static Website** - Modern recipe book with responsive design
- ✅ **Docker Containerization** - Lightweight Nginx Alpine container
- ✅ **Infrastructure as Code** - AWS resources provisioned with Terraform
- ✅ **Configuration Management** - Automated deployment with Ansible
- ✅ **Cloud Deployment** - AWS EC2 (Singapore region, Free Tier)
- ✅ **Version Control** - Complete Git repository

### 🌐 Live Demo
**Access the live website:** [http://13.215.50.74](http://13.215.50.74)



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


---

## 🚀 Quick Start

### Prerequisites

Before you begin, ensure you have the following installed:

- [AWS Account](https://aws.amazon.com/) (Free Tier)
- [Terraform](https://www.terraform.io/downloads) (v1.5+)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) (v2.14+)
- [Docker](https://docs.docker.com/get-docker/) (v24.0+)
- [Git](https://git-scm.com/downloads) (v2.40+)
- [AWS CLI](https://aws.amazon.com/cli/) (configured)

### Step 1: Clone Repository


git clone https://github.com/areppzubaidi/recipe-book-website.git
cd recipe-book-website


### Step 2: Generate SSH Key Pair


ssh-keygen -t rsa -b 2048 -f ~/.ssh/recipe-book-key -N ""
chmod 400 ~/.ssh/recipe-book-key


### Step 3: Import SSH Key to AWS


aws ec2 import-key-pair \
    --key-name "recipe-book-key" \
    --public-key-material fileb://~/.ssh/recipe-book-key.pub \
    --region ap-southeast-1


### Step 4: Deploy Infrastructure with Terraform

```bash
cd terraform
terraform init
terraform plan
terraform apply -auto-approve
```

After apply, note the public IP output.

### Step 5: Update Ansible Inventory


cd ../ansible
# Edit inventory.ini with the EC2 public IP
echo "[webserver]
recipe-book-server ansible_host=<EC2_PUBLIC_IP> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/recipe-book-key" > inventory.ini


### Step 6: Deploy Application with Ansible


ansible-playbook -i inventory.ini deploy-docker.yml


### Step 7: Access Website

Open your browser and navigate to:

http://<EC2_PUBLIC_IP>


---

## 🔧 Management Commands

### SSH into EC2 Instance

ssh -i ~/.ssh/recipe-book-key ubuntu@13.215.50.74


### Check Docker Container Status

ssh -i ~/.ssh/recipe-book-key ubuntu@13.215.50.74 "docker ps"


### View Container Logs

ssh -i ~/.ssh/recipe-book-key ubuntu@13.215.50.74 "docker logs recipe-book"


### Restart Docker Container

ssh -i ~/.ssh/recipe-book-key ubuntu@13.215.50.74 "docker restart recipe-book"


### Update Website Files

cd ansible
ansible-playbook -i inventory.ini deploy-docker.yml


### Destroy All Resources (Cleanup)

cd terraform
terraform destroy -auto-approve


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

1. **SSH Keys**: Never commit private keys to repository
2. **Security Groups**: Limit SSH access to your IP
3. **Terraform State**: Consider remote backend for team environments
4. **Secrets Management**: Use environment variables or AWS Secrets Manager
5. **Regular Updates**: Keep Ubuntu and Docker packages updated

---

## 🚨 Troubleshooting

### Website Not Accessible

# Check container is running
ssh -i ~/.ssh/recipe-book-key ubuntu@13.215.50.74 "docker ps"

# Check container logs
ssh -i ~/.ssh/recipe-book-key ubuntu@13.215.50.74 "docker logs recipe-book"

# Restart container
ssh -i ~/.ssh/recipe-book-key ubuntu@13.215.50.74 "docker restart recipe-book"


### SSH Connection Failed

# Verify key permissions
chmod 400 ~/.ssh/recipe-book-key

# Test connection
ssh -i ~/.ssh/recipe-book-key ubuntu@13.215.50.74

# Check security group rules
aws ec2 describe-security-groups --group-ids sg-xxxxxxxxx


### Terraform Apply Fails

# Refresh state
terraform refresh

# Destroy and recreate
terraform destroy -auto-approve
terraform apply -auto-approve


### Ansible Connection Failed

# Test connectivity
ansible -i inventory.ini -m ping all

# Install Python on remote host
ssh -i ~/.ssh/recipe-book-key ubuntu@13.215.50.74 "sudo apt-get install -y python3"


---

## 📈 Future Enhancements

- [ ] **HTTPS**: Add SSL certificate with Let's Encrypt
- [ ] **Custom Domain**: Configure Route 53 with custom domain
- [ ] **CI/CD Pipeline**: GitLab CI/CD for automated deployments
- [ ] **Monitoring**: Set up CloudWatch and Prometheus metrics
- [ ] **Backup**: Automated EBS snapshots
- [ ] **Scaling**: Auto-scaling group with load balancer
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

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

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

EOF


## Create Screenshots Directory


# Create screenshots directory
mkdir -p ~/recipe-book-website/screenshots

# Create placeholder images
cd ~/recipe-book-website/screenshots

# Create placeholder text files (replace with actual screenshots)
cat > README.txt << 'EOF'
Place your screenshots here:

1. homepage.png - Main website landing page
2. recipes.png - Recipe cards section
3. mobile-view.png - Responsive design on mobile
4. docker-container.png - Docker container status
5. aws-ec2.png - AWS EC2 console showing instance
6. terraform-apply.png - Terraform apply output
7. ansible-playbook.png - Ansible playbook execution

To take screenshots:
- Website: Use browser developer tools or screenshot tool
- Docker: ssh to EC2 and take screenshot
- AWS: Capture EC2 console
- Terraform/Ansible: Capture terminal output
EOF

echo "✅ Screenshots directory created"


## Add License File


cat > ~/recipe-book-website/LICENSE << 'EOF'
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
EOF


## Add Files to Git and Push


cd ~/recipe-book-website

# Add new files
git add README.md LICENSE screenshots/

# Commit
git commit -m "Add comprehensive README with documentation and screenshots

- Complete project documentation
- Architecture diagram
- Setup instructions
- Troubleshooting guide
- Management commands
- License file
- Screenshots placeholder"

# Push to GitHub
git push origin main --force


## Take and Add Actual Screenshots

To add actual screenshots:

1. **Website Screenshots**:

   # Open website and take screenshots
   open http://13.215.50.74
   # Use Cmd+Shift+4 to capture
   

2. **Docker Container**:
   
   ssh -i ~/.ssh/recipe-book-key ubuntu@13.215.50.74 "docker ps"
   # Capture terminal output
   

3. **Terraform Apply**:
   
   cd ~/recipe-book-website/terraform
   terraform apply -auto-approve
   # Capture terminal output
   

4. **Ansible Playbook**:
   
   cd ~/recipe-book-website/ansible
   ansible-playbook -i inventory.ini deploy-docker.yml
   # Capture terminal output
  

Replace placeholder images with actual screenshots and commit them to the repository.

Your comprehensive README is now ready! 🎉
