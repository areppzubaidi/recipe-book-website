#!/bin/bash

echo "📦 Preparing to push to GitLab..."
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    git init
    echo "✅ Git repository initialized"
fi

# Add all files
git add .
echo "✅ Files staged"

# Create commit
git commit -m "Initial commit: Recipe Book DevOps Project

Complete DevOps implementation:
- Static website with HTML/CSS/JS
- Docker containerization with Nginx
- Terraform infrastructure for AWS EC2
- Ansible configuration management
- Automated deployment pipeline

Deployed at: http://13.215.50.74"

echo "✅ Commit created"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📤 NEXT STEPS:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1. Create a new repository on GitLab"
echo "2. Run these commands:"
echo ""
echo "   git remote add origin https://gitlab.com/YOUR_USERNAME/recipe-book-website.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "Replace YOUR_USERNAME with your GitLab username"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
