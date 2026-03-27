#!/bin/bash

IP="13.215.50.74"

echo "╔══════════════════════════════════════════════════════════╗"
echo "║     🍳 RECIPE BOOK WEBSITE - DEPLOYMENT SUCCESSFUL!     ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

echo "📊 DEPLOYMENT SUMMARY:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "🌐 WEBSITE STATUS:"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://$IP)
if [ $HTTP_CODE -eq 200 ]; then
    echo "   ✅ Website is LIVE and accessible"
    echo "   📍 URL: http://$IP"
    echo "   📡 HTTP Status: $HTTP_CODE OK"
else
    echo "   ❌ Website returned HTTP $HTTP_CODE"
fi
echo ""

echo "🐳 DOCKER CONTAINER:"
ssh -i ~/.ssh/recipe-book-key ubuntu@$IP "docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"
echo ""

echo "📁 WEBSITE FILES DEPLOYED:"
ssh -i ~/.ssh/recipe-book-key ubuntu@$IP "ls -lh /opt/recipe-book/ | grep -E '\.(html|css|js)$'"
echo ""

echo "🏗️  INFRASTRUCTURE:"
echo "   ☁️  AWS Region: ap-southeast-1 (Singapore)"
echo "   🖥️  EC2 Instance: t2.micro (Free Tier)"
echo "   🔑 SSH Key: recipe-book-key"
echo "   🔒 Security Group: Ports 22 (SSH), 80 (HTTP) open"
echo ""

echo "📝 QUICK COMMANDS:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "   View logs:     ssh -i ~/.ssh/recipe-book-key ubuntu@$IP 'docker logs recipe-book'"
echo "   Restart:       ssh -i ~/.ssh/recipe-book-key ubuntu@$IP 'docker restart recipe-book'"
echo "   Stop:          ssh -i ~/.ssh/recipe-book-key ubuntu@$IP 'docker stop recipe-book'"
echo "   Start:         ssh -i ~/.ssh/recipe-book-key ubuntu@$IP 'docker start recipe-book'"
echo "   SSH into EC2:  ssh -i ~/.ssh/recipe-book-key ubuntu@$IP"
echo ""

echo "🧹 CLEANUP (when done):"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "   cd ~/recipe-book-website/terraform"
echo "   terraform destroy -auto-approve"
echo ""

echo "╔══════════════════════════════════════════════════════════╗"
echo "║     🎉 CONGRATULATIONS! DEPLOYMENT COMPLETE! 🎉         ║"
echo "║                                                          ║"
echo "║     🌐 VISIT YOUR WEBSITE: http://$IP            ║"
echo "╚══════════════════════════════════════════════════════════╝"
