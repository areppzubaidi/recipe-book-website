#!/bin/bash

echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║     FIXING GIT REMOTE & PUSHING TO GITHUB                     ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo ""

cd ~/recipe-book-website

echo "📋 Current remotes:"
git remote -v
echo ""

echo "🔧 Removing old remotes..."
git remote remove origin 2>/dev/null
git remote remove gitlab 2>/dev/null
echo "✅ Remotes cleaned"

echo ""
echo "🔧 Adding GitHub remote..."
git remote add origin https://github.com/areppzubaidi/recipe-book-website.git
echo "✅ GitHub remote added"

echo ""
echo "📋 New remotes:"
git remote -v
echo ""

echo "📝 Checking current branch..."
CURRENT_BRANCH=$(git branch --show-current)
echo "Current branch: $CURRENT_BRANCH"

if [ "$CURRENT_BRANCH" = "master" ]; then
    echo "Renaming master to main..."
    git branch -M main
    CURRENT_BRANCH="main"
fi

echo ""
echo "📦 Adding all files..."
git add .

echo ""
echo "📝 Creating commit..."
git commit -m "Initial commit: Recipe Book DevOps Project

✨ Complete DevOps Implementation:
- Static recipe website with HTML/CSS/JS
- Docker containerization with Nginx Alpine
- Terraform infrastructure for AWS EC2 (ap-southeast-1)
- Ansible configuration management
- Automated deployment pipeline

🌐 Live Demo: http://13.215.50.74

📁 Project Structure:
- website/ - Frontend files (HTML, CSS, JS, images)
- docker/ - Dockerfile for containerization
- terraform/ - AWS infrastructure as code
- ansible/ - Ansible playbooks for deployment
- README.md - Complete documentation

🚀 Technologies:
- Frontend: HTML5, CSS3, JavaScript
- Container: Docker, Nginx Alpine
- IAC: Terraform
- CM: Ansible
- Cloud: AWS EC2 (Free Tier)
- Version Control: Git"

echo ""
echo "📤 Pushing to GitHub..."
echo ""

# Try to push, if fails, force push
git push -u origin main 2>&1 | tee push_output.txt

if [ ${PIPESTATUS[0]} -eq 0 ]; then
    echo ""
    echo "╔═══════════════════════════════════════════════════════════════╗"
    echo "║                 ✅ PUSH SUCCESSFUL! ✅                         ║"
    echo "╚═══════════════════════════════════════════════════════════════╝"
else
    echo ""
    echo "⚠️  Push rejected. Trying force push..."
    git push -u origin main --force
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "╔═══════════════════════════════════════════════════════════════╗"
        echo "║                 ✅ FORCE PUSH SUCCESSFUL! ✅                   ║"
        echo "╚═══════════════════════════════════════════════════════════════╝"
    else
        echo ""
        echo "❌ Push failed. You may need to authenticate."
        echo ""
        echo "To push with token:"
        echo "1. Create token: https://github.com/settings/tokens"
        echo "2. Run: git push https://areppzubaidi:YOUR_TOKEN@github.com/areppzubaidi/recipe-book-website.git main --force"
        exit 1
    fi
fi

echo ""
echo "📂 GitHub Repository:"
echo "   https://github.com/areppzubaidi/recipe-book-website"
echo ""
echo "🌐 Live Website:"
echo "   http://13.215.50.74"
echo ""
echo "🎉 Your Recipe Book DevOps project is now on GitHub!"

# Clean up
rm -f push_output.txt
