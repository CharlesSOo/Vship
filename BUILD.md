# Building VShip

## ✅ Project Ready!

The Xcode project has been generated and should now be open in Xcode.

## Quick Start

The project is already configured and ready to build:

1. **Select a Team** (if needed)
   - Click on VShip project in the navigator
   - Select VShip target
   - Go to "Signing & Capabilities"
   - Choose your Apple Developer team

2. **Build & Run**
   - Press **⌘R** or click the Play button
   - The app will launch and appear in your menu bar

3. **First Launch**
   - Click the triangle icon in the menu bar
   - Enter your Vercel API token
   - Get token from: https://vercel.com/account/tokens

## Project Structure

```
VShip.xcodeproj          ← Xcode project file (generated)
project.yml              ← XcodeGen configuration
VShip/VShip/
├── VShipApp.swift       ← App entry point
├── AppDelegate.swift    ← Menu bar + triangle logic
├── Models/              ← Data models
├── Views/               ← SwiftUI views
├── Services/            ← API client
├── Utilities/           ← Keychain manager
└── Resources/           ← Assets
```

## What's Configured

✅ **Menu Bar Agent** - LSUIElement set to true (no dock icon)
✅ **App Sandbox** - Network client enabled
✅ **Keychain Sharing** - Configured for token storage
✅ **Swift 5.0** - Latest Swift version
✅ **macOS 15.0+** - Minimum deployment target
✅ **All Source Files** - Properly linked and organized

## Troubleshooting

### "No signing certificate found"
- Add your Apple Developer account in Xcode Preferences
- Or disable signing temporarily for development

### "Cannot find type 'Deployment'"
- Make sure all Swift files are added to the target
- Clean build folder: Product → Clean Build Folder (⌘⇧K)

### Triangle not appearing after build
- Make sure Info.plist has LSUIElement = true
- Check Console.app for any runtime errors
- Look in the menu bar on the right side

## Testing the Triangle Indicator

After launching:
1. Enter your Vercel token
2. Wait for deployments to load
3. The triangle should show:
   - 🟢 Green if latest deployment is successful
   - 🟡 Yellow if currently building
   - 🔴 Red if deployment failed

## Development Workflow

### Regenerating the Project
If you modify project.yml:
```bash
xcodegen generate
```

### Opening the Project
```bash
open VShip.xcodeproj
```

### Building from Command Line
First, set Xcode path:
```bash
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
xcodebuild -project VShip.xcodeproj -scheme VShip -configuration Debug
```

## Next Steps

1. **Customize Colors** - Edit AppDelegate.swift:148-156
2. **Adjust Poll Interval** - Edit DeploymentService.swift:16
3. **Add Features** - Extend the codebase as needed
4. **Create App Icon** - Add icons to Assets.xcassets

## Distribution

For App Store or external distribution:
1. Archive the app (Product → Archive)
2. Notarize with Apple
3. Export for distribution

---

**The project is ready to build and run!** 🚀
