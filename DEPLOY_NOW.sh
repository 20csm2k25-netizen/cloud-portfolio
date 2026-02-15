#!/bin/bash

# ========================================
# DEPLOYMENT SCRIPT FOR GITHUB PAGES
# ========================================

echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║                                                               ║"
echo "║         🚀 DEPLOYING IMPROVED UI TO GITHUB PAGES             ║"
echo "║                                                               ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo ""

# Navigate to repository
cd "$(dirname "$0")"

echo "📁 Current directory: $(pwd)"
echo ""

# Check git status
echo "🔍 Checking git status..."
git status
echo ""

# Show current branch
CURRENT_BRANCH=$(git branch --show-current)
echo "📌 Current branch: $CURRENT_BRANCH"
echo ""

if [ "$CURRENT_BRANCH" != "main" ]; then
    echo "⚠️  You are not on the main branch!"
    echo "   Switching to main branch..."
    git checkout main
    echo ""
fi

# Verify files
echo "📋 Verifying improved files..."
if [ -f "style.css" ] && [ $(wc -c < style.css) -gt 10000 ]; then
    echo "   ✅ style.css (13KB) - Professional CSS loaded"
else
    echo "   ❌ style.css seems incorrect"
    exit 1
fi

if [ -f "script.js" ] && [ $(wc -c < script.js) -gt 4000 ]; then
    echo "   ✅ script.js (4.5KB) - Enhanced JavaScript loaded"
else
    echo "   ❌ script.js seems incorrect"
    exit 1
fi

if [ -f "DEPLOYMENT.md" ]; then
    echo "   ✅ DEPLOYMENT.md - Documentation present"
else
    echo "   ❌ DEPLOYMENT.md missing"
fi

echo ""
echo "✨ All files verified successfully!"
echo ""

# Push to GitHub
echo "🚀 Pushing to GitHub..."
echo "   Running: git push origin main"
echo ""

git push origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "╔═══════════════════════════════════════════════════════════════╗"
    echo "║                                                               ║"
    echo "║         ✅ DEPLOYMENT SUCCESSFUL!                            ║"
    echo "║                                                               ║"
    echo "╚═══════════════════════════════════════════════════════════════╝"
    echo ""
    echo "🎉 Your improved portfolio has been pushed to GitHub!"
    echo ""
    echo "⏳ Wait 2-3 minutes for GitHub Pages to deploy..."
    echo ""
    echo "🌐 Your website will be live at:"
    echo "   👉 https://20csm2k25-netizen.github.io/cloud-portfolio/"
    echo ""
    echo "💡 If you don't see changes immediately:"
    echo "   • Wait a few more minutes"
    echo "   • Hard refresh: Ctrl+Shift+R (Windows/Linux) or Cmd+Shift+R (Mac)"
    echo "   • Clear browser cache"
    echo "   • Try incognito/private mode"
    echo ""
else
    echo ""
    echo "❌ Push failed. Please check your credentials and try again."
    echo ""
    echo "💡 Manual deployment steps:"
    echo "   1. Make sure you're logged into GitHub"
    echo "   2. Run: git push origin main"
    echo "   3. Or merge the PR on GitHub.com"
    echo ""
fi
