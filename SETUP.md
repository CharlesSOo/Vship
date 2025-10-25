# VShip - Xcode Project Setup Instructions

Since Xcode project files (`.xcodeproj`) are complex binary/XML structures, you'll need to create the project in Xcode. Follow these steps:

## Step 1: Create New Xcode Project

1. Open Xcode
2. Select **File → New → Project**
3. Choose **macOS → App**
4. Configure the project:
   - **Product Name:** VShip
   - **Team:** Your development team
   - **Organization Identifier:** com.vship (or your preferred identifier)
   - **Interface:** SwiftUI
   - **Language:** Swift
   - **Minimum Deployment:** macOS 15.0

5. Save the project in `/Users/charles/Code/VShip/`

## Step 2: Replace Auto-Generated Files

After Xcode creates the project, replace the generated files with the pre-written source files:

1. In Xcode's Project Navigator, delete the auto-generated files:
   - `VShipApp.swift`
   - `ContentView.swift`
   - Any other generated Swift files

2. Add the source files from `VShip/VShip/` to your project:
   - Drag the following folders into the Project Navigator:
     - `Models/`
     - `Views/`
     - `Services/`
     - `Utilities/`
   - Also add:
     - `VShipApp.swift`
     - `AppDelegate.swift`

## Step 3: Configure Project Settings

### General Settings

1. Select the VShip target in Project Settings
2. Go to **Signing & Capabilities** tab
3. Enable **Automatically manage signing**
4. Select your development team

### Add Capabilities

1. Click **+ Capability**
2. Add **App Sandbox**
   - Enable "Outgoing Connections (Client)"
3. Add **Keychain Sharing**
   - Add keychain group: `com.vship.app`

### Update Info.plist

1. Select `Info.plist` in Project Navigator
2. Add the following keys (or replace the existing Info.plist):
   - **Application is agent (UIElement):** YES
     - This makes the app a menu bar agent without a dock icon
   - Copy settings from the provided `Info.plist` file

### Update Entitlements

Replace the auto-generated entitlements file with `VShip.entitlements`

## Step 4: Configure Build Settings

1. Select the VShip target
2. Go to **Build Settings**
3. Ensure these settings:
   - **Deployment Target:** macOS 15.0
   - **Swift Language Version:** Swift 5

## Step 5: Project Structure

Your final project structure should look like:

```
VShip.xcodeproj
VShip/
├── VShipApp.swift
├── AppDelegate.swift
├── Models/
│   └── Deployment.swift
├── Views/
│   ├── ContentView.swift
│   ├── DeploymentRowView.swift
│   ├── OnboardingView.swift
│   └── SettingsView.swift
├── Services/
│   └── DeploymentService.swift
├── Utilities/
│   └── KeychainManager.swift
├── Resources/
│   └── Assets.xcassets
├── Info.plist
└── VShip.entitlements
```

## Step 6: Build and Run

1. Select **Product → Build** (⌘B) to compile
2. Fix any build errors if they appear
3. Select **Product → Run** (⌘R) to launch the app
4. Look for the triangle icon in your menu bar

## Troubleshooting

### "LSUIElement" not hiding dock icon
- Make sure Info.plist has `LSUIElement` set to `true`
- Clean build folder (Product → Clean Build Folder)
- Restart Xcode

### Keychain access errors
- Verify App Sandbox and Keychain Sharing are enabled in Capabilities
- Check that entitlements file is properly configured
- Make sure you're using the correct keychain access group

### API errors
- Ensure you have a valid Vercel API token
- Check internet connection
- Verify the token has proper permissions in Vercel

### Triangle icon not showing colors
- Make sure the deployment service is receiving data
- Check console logs for any API errors
- Verify the status color mapping in AppDelegate

## Next Steps

Once the app is running:
1. Click the triangle icon in the menu bar
2. Enter your Vercel API token (get one from https://vercel.com/account/tokens)
3. Your deployments should load automatically
4. The triangle will change colors based on the latest deployment status:
   - 🟢 Green: Successful
   - 🟡 Yellow: Building
   - 🔴 Red: Failed

## Optional: App Store Distribution

If you want to distribute on the Mac App Store:
1. Create an App Store Connect record
2. Configure proper provisioning profiles
3. Enable App Sandbox fully
4. Add privacy descriptions if needed
5. Archive and upload to App Store Connect
