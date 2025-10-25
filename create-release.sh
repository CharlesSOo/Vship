#!/bin/bash

# VShip GitHub Release Creator
# This script creates a GitHub release and uploads the DMG

set -e

VERSION="1.0.0"
DMG_FILE="VShip-1.0.0.dmg"
REPO="CharlesSOo/Vship"

echo "🚀 Creating GitHub Release for VShip v${VERSION}..."

# Check if DMG exists
if [ ! -f "$DMG_FILE" ]; then
    echo "❌ Error: $DMG_FILE not found!"
    echo "Please run ./create-dmg.sh first"
    exit 1
fi

# Check if already logged in to GitHub
if ! gh auth status &> /dev/null; then
    echo "📝 Please log in to GitHub CLI..."
    gh auth login
fi

# Create release
echo "📦 Creating release v${VERSION}..."
gh release create "v${VERSION}" \
    --repo "$REPO" \
    --title "VShip ${VERSION}" \
    --notes "# VShip ${VERSION}

Monitor your Vercel deployments from your macOS menu bar.

## Features
- Real-time deployment status with color-coded triangle indicator
- Secure API token storage in macOS Keychain
- Native Swift/SwiftUI performance
- Customizable triangle styles and success timeouts

## Requirements
- macOS 15.0 or later

## Installation
1. Download VShip-${VERSION}.dmg
2. Open the DMG file
3. Drag VShip to your Applications folder
4. Launch VShip and enter your Vercel API token

---

**VShip is free for personal use only.**

VShip is an independent project and is not affiliated with, endorsed by, or sponsored by Vercel Inc.
\"Vercel\" and the Vercel logo are trademarks of Vercel Inc.
" \
    "$DMG_FILE"

echo ""
echo "✅ Release created successfully!"
echo ""

# Get the download URL
DOWNLOAD_URL=$(gh release view "v${VERSION}" --repo "$REPO" --json assets --jq '.assets[0].url')
echo "📍 Download URL:"
echo "   https://github.com/$REPO/releases/download/v${VERSION}/$DMG_FILE"
echo ""
echo "Next steps:"
echo "1. Update the website download button with the above URL"
echo "2. Test the download link"
echo ""
