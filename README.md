# VShip - Vercel Deployment Monitor for macOS

<p align="center">
  <img src="https://img.shields.io/badge/version-0.9.0--beta-orange" alt="Version">
  <img src="https://img.shields.io/badge/platform-macOS%2015.0+-lightgrey" alt="Platform">
  <img src="https://img.shields.io/badge/license-Proprietary-blue" alt="License">
</p>

A native macOS menu bar application for monitoring Vercel deployments with real-time status indicators.

> ⚠️ **Beta Release**: VShip is currently in beta. Please report any issues you encounter!

## Download

**[Download VShip 0.9.0 Beta](https://github.com/CharlesSOo/Vship/releases/download/v0.9.0/VShip-0.9.0.dmg)**

**Website**: [vship-pl6ul8y9x-meckins-projects.vercel.app](https://vship-pl6ul8y9x-meckins-projects.vercel.app)

## Features

### Core Functionality
- 🔺 **Live Status Indicator**: Vercel triangle icon in menu bar that changes color based on deployment status
  - 🟢 Green: Successful deployment (READY)
  - 🟡 Yellow: Building/Queued
  - 🔴 Red: Failed/Canceled/Error
- 📊 **Deployment List**: View recent deployments with commit messages, branches, and timestamps
- 🔒 **Secure**: API tokens stored securely in macOS Keychain
- 🔄 **Auto-refresh**: Checks for deployment updates every 30 seconds

### Customization
- 🎨 **Triangle Styles**: Choose between bordered or solid triangle indicators
- ⚪️ **Icon Colors**: White or black icon for visibility on any wallpaper
- ⏱️ **Success Timeout**: Auto-fade green indicator after successful deployment (5min, 10min, 30min, 1hr, or never)

### Additional Features
- 🆕 **Auto-update Checker**: Checks daily for new versions (macOS notification + in-app banner)
- 🚪 **Quit Button**: Easy app termination from the popover menu
- 🌓 **Native macOS**: Built with Swift/SwiftUI, automatic light/dark mode support

## Installation

### Requirements
- macOS 15.0 (Sequoia) or later
- Vercel account with API access token

### Download & Install
1. Download the latest DMG from [Releases](https://github.com/CharlesSOo/Vship/releases)
2. Open `VShip-0.9.0.dmg`
3. Drag VShip to your Applications folder
4. Launch VShip
5. On first launch, enter your Vercel API token

### Getting a Vercel API Token

1. Go to [Vercel Account Settings → Tokens](https://vercel.com/account/tokens)
2. Click "Create Token"
3. Give it a name (e.g., "VShip")
4. Set scope to "Read-only" (VShip only reads deployment data)
5. Click "Create" and copy the token
6. Paste the token in VShip on first launch

## Usage

### Basic Operations
- **Click the triangle icon** in the menu bar to open the deployment list
- **Click "Refresh"** to manually update deployments
- **Click "Settings"** (gear icon) to configure preferences
- **Click "Quit VShip"** at the bottom of the menu to exit

### Settings
- **Account**: Sign out and remove your API token
- **Triangle Style**: Choose between colored border or solid color
- **Icon Color**: Select white or black for menu bar visibility
- **Success Timeout**: Configure when green indicator fades to default color

## Development

### Prerequisites
- Xcode 16 or later
- XcodeGen (for project generation)

### Building from Source

```bash
# Clone the repository
git clone https://github.com/CharlesSOo/Vship.git
cd VShip

# Generate Xcode project
xcodegen generate

# Open in Xcode
open VShip.xcodeproj

# Build and run
# Product → Run (⌘R)
```

### Project Structure

```
VShip/
├── VShip/VShip/
│   ├── VShipApp.swift          # Main app entry point
│   ├── AppDelegate.swift       # Menu bar & status item management
│   ├── Models/
│   │   └── Deployment.swift    # Deployment data model
│   ├── Views/
│   │   ├── ContentView.swift   # Main popover view
│   │   ├── SettingsView.swift  # Settings interface
│   │   ├── OnboardingView.swift # First-run setup
│   │   └── DeploymentRowView.swift # Deployment list item
│   ├── Services/
│   │   ├── DeploymentService.swift # Vercel API integration
│   │   ├── KeychainManager.swift   # Secure token storage
│   │   └── UpdateChecker.swift     # Version checking
│   ├── Utilities/
│   │   └── AppSettings.swift   # User preferences
│   └── Resources/
│       └── Assets.xcassets/    # App icon & assets
├── project.yml                 # XcodeGen configuration
└── create-dmg.sh              # DMG packaging script
```

### Tech Stack
- **Language**: Swift 5.0
- **UI**: SwiftUI
- **Reactive Programming**: Combine
- **Secure Storage**: Keychain Services
- **API**: Vercel REST API v6
- **Build Tools**: XcodeGen

## License

**Proprietary License - Free for Personal Use**

VShip is free software for personal and non-commercial use. You may **not**:
- Modify or create derivative works
- Use for commercial purposes
- Sell, rent, or sublicense the software

See [Legal & Terms](https://vship-pl6ul8y9x-meckins-projects.vercel.app/legal) for full details.

## Disclaimer

VShip is an independent project and is **not** officially affiliated with, endorsed by, or sponsored by Vercel Inc. "Vercel" and the Vercel logo (triangle) are trademarks of Vercel Inc.

## Support

- **Issues**: [GitHub Issues](https://github.com/CharlesSOo/Vship/issues)
- **Twitter**: [@_CharlesSO](https://x.com/_CharlesSO)

## Roadmap

- [ ] Custom notification sounds
- [ ] Multiple Vercel account support
- [ ] Deployment filtering by project
- [ ] Quick actions (re-deploy, open in browser)

---

Made with ♥ for Vercel developers by [@_CharlesSO](https://x.com/_CharlesSO)
