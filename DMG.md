# Creating a DMG for VShip

## Quick Guide

### Step 1: Archive in Xcode

1. Stop the running app (if running)
2. In the **top menu bar**, click **Product** → **Archive**
3. Wait for archive to complete
4. Xcode Organizer will open

### Step 2: Export the App

In Xcode Organizer:
1. Select your VShip archive
2. Click **Distribute App**
3. Choose **Copy App**
4. Click **Next**
5. Click **Export**
6. Save to: `/Users/charles/Code/VShip/Export/`
7. Create the "Export" folder if prompted

### Step 3: Create DMG

In Terminal, run:
```bash
cd /Users/charles/Code/VShip
./create-dmg.sh
```

This will create: **VShip-1.0.0.dmg**

### Step 4: Test the DMG

```bash
open VShip-1.0.0.dmg
```

The DMG will mount and show:
- VShip.app
- Applications folder (symlink for easy drag-to-install)

## Manual Method (Alternative)

If you prefer to create the DMG manually:

```bash
# Create temp folder
mkdir dmg_temp
cp -R Export/VShip.app dmg_temp/
ln -s /Applications dmg_temp/Applications

# Create DMG
hdiutil create -volname "VShip" \
    -srcfolder dmg_temp \
    -ov -format UDZO \
    VShip-1.0.0.dmg

# Clean up
rm -rf dmg_temp
```

## Using Homebrew's create-dmg (Prettier DMGs)

For a more professional DMG with custom background:

```bash
# Install create-dmg
brew install create-dmg

# Create fancy DMG
create-dmg \
  --volname "VShip" \
  --volicon "path/to/icon.icns" \
  --window-pos 200 120 \
  --window-size 600 400 \
  --icon-size 100 \
  --icon "VShip.app" 175 120 \
  --hide-extension "VShip.app" \
  --app-drop-link 425 120 \
  "VShip-1.0.0.dmg" \
  "Export/VShip.app"
```

## Troubleshooting

### "Resource busy" error
The app might still be running. Quit VShip and try again.

### "No such file or directory: Export/VShip.app"
You need to export the app from Xcode first (Step 2 above).

### DMG won't mount
Make sure the previous DMG is unmounted:
```bash
hdiutil detach /Volumes/VShip
```

## Distribution

Once you have the DMG:
- Share it with others
- Users can drag VShip.app to Applications
- Upload to GitHub releases
- Host on your website

## Codesigning (Optional)

For distribution outside the Mac App Store, you should codesign:

```bash
codesign --deep --force --verify --verbose \
  --sign "Developer ID Application: Your Name" \
  Export/VShip.app
```

Then notarize with Apple:
```bash
xcrun notarytool submit VShip-1.0.0.dmg \
  --apple-id your@email.com \
  --password app-specific-password \
  --team-id YOUR_TEAM_ID \
  --wait
```

This prevents "unidentified developer" warnings.
