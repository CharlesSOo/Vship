# VShip Distribution Guide

## Option 1: Quick DMG (Friends & Personal Use)

For sharing with friends who trust you (they'll see "unidentified developer" warning):

### Step 1: Archive in Xcode

1. In Xcode menu bar: **Product → Archive**
2. Wait for archive to complete
3. Xcode Organizer opens automatically

### Step 2: Export the App

1. Select your archive in Organizer
2. Click **Distribute App**
3. Choose **Copy App**
4. Click **Next** → **Export**
5. Save to `/Users/charles/Code/VShip/Export/`

### Step 3: Create DMG

```bash
cd /Users/charles/Code/VShip
./create-dmg.sh
```

This creates: **VShip-1.0.0.dmg**

### Step 4: Share It

Upload the DMG to:
- GitHub Releases
- Dropbox / Google Drive
- Your website
- Direct send via email/Slack

**Users will need to:**
1. Download the DMG
2. Open it
3. Drag VShip.app to Applications
4. Right-click → Open (first time only to bypass Gatekeeper warning)

---

## Option 2: Signed & Notarized (Public Distribution)

For wider public distribution without security warnings, you need:
- Apple Developer Account ($99/year)
- Code signing certificate
- Notarization with Apple

### Requirements

1. **Apple Developer Account**
   - Sign up at https://developer.apple.com
   - Cost: $99/year

2. **Developer ID Certificate**
   - In Xcode: Preferences → Accounts → Manage Certificates
   - Create "Developer ID Application" certificate

### Step 1: Archive with Signing

1. In Xcode: Select VShip target
2. **Signing & Capabilities** → Select your team
3. **Product → Archive**
4. Organizer opens

### Step 2: Export for Distribution

1. Select archive
2. **Distribute App** → **Developer ID**
3. Follow prompts to sign the app

### Step 3: Notarize

```bash
# Store credentials (one time)
xcrun notarytool store-credentials "VShip-Profile" \
  --apple-id "your@email.com" \
  --team-id "YOUR_TEAM_ID"

# Create DMG first
./create-dmg.sh

# Submit for notarization
xcrun notarytool submit VShip-1.0.0.dmg \
  --keychain-profile "VShip-Profile" \
  --wait

# Staple the notarization ticket
xcrun stapler staple VShip-1.0.0.dmg
```

### Step 4: Verify

```bash
spctl -a -vvv -t install VShip-1.0.0.dmg
```

Should say: "accepted"

---

## Option 3: GitHub Releases (Recommended)

Best for open-source or free distribution:

### Step 1: Create GitHub Repository

```bash
cd /Users/charles/Code/VShip
git init
git add .
git commit -m "Initial commit - VShip v1.0.0"
git branch -M main
git remote add origin https://github.com/yourusername/vship.git
git push -u origin main
```

### Step 2: Create Release

1. Go to your GitHub repo
2. Click **Releases** → **Create a new release**
3. Tag: `v1.0.0`
4. Title: `VShip v1.0.0`
5. Description:
   ```markdown
   # VShip v1.0.0

   Vercel deployment monitor for macOS menu bar

   ## Features
   - Real-time deployment status
   - Colored triangle indicator
   - Support for multiple projects
   - Secure token storage

   ## Installation
   1. Download VShip-1.0.0.dmg
   2. Open the DMG
   3. Drag VShip to Applications
   4. Launch and enter your Vercel API token

   ## Note
   First launch: Right-click → Open to bypass Gatekeeper
   ```
6. Upload `VShip-1.0.0.dmg`
7. Click **Publish release**

Users can now download from: `https://github.com/yourusername/vship/releases`

---

## Option 4: Mac App Store

Most legitimate but requires:
- Apple Developer Account ($99/year)
- App Store review process (1-2 weeks)
- Compliance with App Store guidelines

### Steps:

1. Create App Store Connect record
2. Configure App Store provisioning profile
3. Archive in Xcode
4. **Distribute App** → **App Store Connect**
5. Submit for review
6. Wait for approval

**Pros:**
- No security warnings
- Automatic updates
- Discoverability

**Cons:**
- $99/year fee
- Review process
- Sandboxing restrictions

---

## Quick Comparison

| Method | Security Warnings | Cost | Best For |
|--------|------------------|------|----------|
| **Quick DMG** | Yes (first launch) | Free | Friends, testing |
| **Signed & Notarized** | No | $99/year | Public, website |
| **GitHub Releases** | Yes (first launch) | Free | Open source |
| **App Store** | No | $99/year | Maximum reach |

---

## Recommended Approach

For **VShip**, I recommend:

1. **Start with Quick DMG** → Share with friends for testing
2. **GitHub Releases** → Public download, build community
3. **Later: Sign & Notarize** → If you get an Apple Developer account
4. **Optional: App Store** → If you want to monetize

---

## Current Status

✅ You already have the DMG creation script: `create-dmg.sh`
✅ Project is ready to archive and export
✅ Ready to distribute!

**Next step:** Follow Option 1 above to create your first distributable DMG! 🚀
