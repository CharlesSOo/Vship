# VShip Quick Start Guide

## What You Have

VShip is now ready to be built! All the source code has been created for a native macOS menu bar app that monitors Vercel deployments with a color-coded triangle indicator.

## Project Structure

```
VShip/
├── README.md                    # Project overview
├── SETUP.md                     # Detailed Xcode setup instructions
├── FEATURES.md                  # Complete feature documentation
├── QUICKSTART.md               # This file
├── .gitignore                  # Git ignore rules
└── VShip/VShip/
    ├── VShipApp.swift          # Main app entry point
    ├── AppDelegate.swift       # Menu bar management & triangle indicator
    ├── Info.plist              # App configuration
    ├── VShip.entitlements      # Security permissions
    ├── Models/
    │   └── Deployment.swift    # Data models for Vercel API
    ├── Views/
    │   ├── ContentView.swift          # Main popover view
    │   ├── DeploymentRowView.swift    # Deployment list items
    │   ├── OnboardingView.swift       # First-run token setup
    │   └── SettingsView.swift         # Settings interface
    ├── Services/
    │   └── DeploymentService.swift    # Vercel API client
    ├── Utilities/
    │   └── KeychainManager.swift      # Secure token storage
    └── Resources/
        └── Assets.xcassets             # App icons & assets
```

## Next Steps: Open in Xcode

Since `.xcodeproj` files are complex structures, you need to create the project in Xcode:

### Option 1: Quick Setup (Recommended)

1. Open **Xcode**
2. **File → New → Project**
3. Choose **macOS → App**
4. Set:
   - Product Name: **VShip**
   - Team: Your team
   - Organization Identifier: **com.vship**
   - Interface: **SwiftUI**
   - Language: **Swift**
5. Save in `/Users/charles/Code/VShip/`
6. **Delete** auto-generated Swift files
7. **Add** all files from `VShip/VShip/` to the project
8. Go to **Signing & Capabilities**:
   - Add **App Sandbox** → Enable "Outgoing Connections"
   - Add **Keychain Sharing** → Group: `com.vship.app`
9. Replace the auto-generated `Info.plist` with the one provided
10. Press **⌘R** to build and run!

### Option 2: Detailed Setup

See **SETUP.md** for comprehensive step-by-step instructions.

## How It Works

### Triangle Status Indicator
The triangle in your menu bar changes color based on your latest Vercel deployment:

```swift
// From AppDelegate.swift:148-156
var color: NSColor {
    switch self {
    case .ready:
        return NSColor(red: 0.2, green: 0.8, blue: 0.3, alpha: 1.0) // 🟢 Green
    case .building, .queued:
        return NSColor(red: 1.0, green: 0.8, blue: 0.0, alpha: 1.0) // 🟡 Yellow
    case .error, .canceled:
        return NSColor(red: 1.0, green: 0.2, blue: 0.2, alpha: 1.0) // 🔴 Red
```

### Key Features Implemented

✅ **Menu Bar Agent** - Lives in menu bar, no dock icon
✅ **Triangle Indicator** - Color-coded status (green/yellow/red)
✅ **Real-time Updates** - Polls every 30 seconds
✅ **Deployment List** - Shows recent deployments with details
✅ **Secure Storage** - API token stored in macOS Keychain
✅ **Build Timers** - Shows elapsed time for in-progress builds
✅ **Native UI** - SwiftUI with automatic light/dark mode
✅ **Settings** - Manage token and view app info

## Using VShip

1. **Launch** the app (triangle appears in menu bar)
2. **Click** the triangle to open the popover
3. **Enter** your Vercel API token
   - Get one from: https://vercel.com/account/tokens
4. **Watch** your deployments appear
5. **Monitor** the triangle color for instant status

### Status Colors

| Color | Status | Meaning |
|-------|--------|---------|
| 🟢 Green | READY | Latest deployment successful |
| 🟡 Yellow | BUILDING/QUEUED | Currently deploying |
| 🔴 Red | ERROR/CANCELED | Deployment failed |

## Customization

### Change Polling Interval
Edit `DeploymentService.swift:16`:
```swift
private let pollingInterval: TimeInterval = 30 // Change to desired seconds
```

### Modify Triangle Colors
Edit `AppDelegate.swift:148-156` to customize the RGB values

### Add More Deployment Platforms
Extend `DeploymentService.swift` to support Netlify, Railway, etc.

## Troubleshooting

**Triangle not appearing?**
- Check that `LSUIElement` is `true` in Info.plist
- Restart the app

**No deployments showing?**
- Verify your Vercel API token is valid
- Check internet connection
- Look at Xcode console for error messages

**Build errors?**
- Ensure macOS deployment target is 15.0+
- Check that all files are added to the target
- Verify entitlements are configured

## What Makes VShip Different

Compared to the original deplog:
- ⚠️ **Triangle indicator** instead of circle (as you requested)
- 🎨 **Explicitly defined** green/yellow/red color scheme
- 📖 **Open source** - full code available to customize
- 🔧 **Extensible** - easy to add new features

## Getting Your Vercel Token

1. Go to https://vercel.com/account/tokens
2. Click **Create Token**
3. Give it a name (e.g., "VShip")
4. Select appropriate scope (read deployments)
5. Click **Create**
6. Copy the token immediately (you won't see it again)
7. Paste into VShip on first launch

## Support Files

- **README.md** - General project information
- **SETUP.md** - Detailed Xcode project setup
- **FEATURES.md** - Complete feature list and comparison
- **QUICKSTART.md** - This guide

---

**Ready to build?** Open Xcode and follow the setup steps above!
