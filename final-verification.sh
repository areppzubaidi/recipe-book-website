#!/bin/bash

IP="13.215.50.74"

echo "========================================="
echo "✅ RECIPE BOOK WEBSITE - DEPLOYMENT SUCCESSFUL!"
echo "========================================="
echo ""

echo "🌐 Website Information:"
echo "   URL: http://$IP"
echo "   Status: ONLINE"
echo ""

echo "🐳 Docker Container Status:"
ssh -i ~/.ssh/recipe-book-key ubuntu@$IP "docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"
echo ""

echo "📊 Website Health Check:"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://$IP)
if [ $HTTP_CODE -eq 200 ]; then
    echo "   ✅ HTTP Status: $HTTP_CODE (OK)"
else
    echo "   ❌ HTTP Status: $HTTP_CODE"
fi

echo ""
echo "🔧 Management Commands:"
echo "   SSH: ssh -i ~/.ssh/recipe-book-key ubuntu@$IP"
echo "   View Logs: ssh -i ~/.ssh/recipe-book-key ubuntu@$IP 'docker logs recipe-book'"
echo "   Restart: ssh -i ~/.ssh/recipe-book-key ubuntu@$IP 'docker restart recipe-book'"
echo "   Stop: ssh -i ~/.ssh/recipe-book-key ubuntu@$IP 'docker stop recipe-book'"
echo ""

echo "========================================="
echo "🏠 Visit your Recipe Book website at:"
echo "   http://$IP"
echo "========================================="
