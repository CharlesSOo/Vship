#!/bin/bash

# VShip DMG Creator
# This script creates a beautiful DMG for distributing VShip

set -e

# Configuration
APP_NAME="VShip"
DMG_NAME="VShip-1.0.0"
SOURCE_APP="Export/VShip.app"
DMG_TEMP="dmg_temp"
FINAL_DMG="$DMG_NAME.dmg"

echo "🚀 Creating DMG for $APP_NAME..."

# Check if app exists
if [ ! -d "$SOURCE_APP" ]; then
    echo "❌ Error: $SOURCE_APP not found!"
    echo "Please export the app from Xcode first:"
    echo "  1. Product → Archive"
    echo "  2. Distribute App → Copy App"
    echo "  3. Export to $(pwd)/Export/"
    exit 1
fi

# Clean up any existing DMG and temp folder
echo "🧹 Cleaning up old files..."
rm -rf "$DMG_TEMP"
rm -f "$FINAL_DMG"

# Create temporary DMG folder
echo "📁 Creating DMG structure..."
mkdir -p "$DMG_TEMP"

# Copy app to temp folder
echo "📦 Copying $APP_NAME.app..."
cp -R "$SOURCE_APP" "$DMG_TEMP/"

# Create Applications symlink
echo "🔗 Creating Applications symlink..."
ln -s /Applications "$DMG_TEMP/Applications"

# Create DMG
echo "💿 Creating DMG image..."
hdiutil create -volname "$APP_NAME" \
    -srcfolder "$DMG_TEMP" \
    -ov -format UDZO \
    "$FINAL_DMG"

# Clean up
echo "🧹 Cleaning up..."
rm -rf "$DMG_TEMP"

echo ""
echo "✅ DMG created successfully!"
echo "📍 Location: $(pwd)/$FINAL_DMG"
echo ""
echo "To test:"
echo "  open $FINAL_DMG"
echo ""
