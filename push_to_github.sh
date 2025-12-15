#!/bin/bash
# Script to fork and push LMStudio EasyQuery modifications to GitHub

echo "=== LMStudio EasyQuery GitHub Push Script ==="
echo ""
echo "This script will fork the repository and push your changes."
echo ""

cd /home/aa/docker/cu128/ComfyUI/custom_nodes/ComfyUI_LMStudio_EasyQuery

# Check if gh is authenticated
if ! gh auth status &> /dev/null; then
    echo "GitHub CLI not authenticated. Authenticating now..."
    echo ""
    echo "Choose one of these options:"
    echo "1. Login with web browser (opens browser)"
    echo "2. Login with token (paste token from https://github.com/settings/tokens)"
    echo ""
    gh auth login
fi

echo ""
echo "Creating fork..."
gh repo fork WASasquatch/ComfyUI_LMStudio_EasyQuery --clone=false --remote=true --remote-name=fork

echo ""
echo "Pushing branch to your fork..."
git push -u fork remote-connection-fixes

echo ""
echo "✅ Done! Your changes are now on GitHub."
echo ""
echo "To create a pull request back to the original repo, run:"
echo "gh pr create --repo WASasquatch/ComfyUI_LMStudio_EasyQuery --base main --head aliabougazia:remote-connection-fixes"
echo ""
echo "Or visit: https://github.com/aliabougazia/ComfyUI_LMStudio_EasyQuery/compare/main...remote-connection-fixes"
