# Rebuild VShip with New Vercel Icons

The app icons have been regenerated with the Vercel triangle logo style (black triangle on white background).

## Steps to Rebuild:

1. **Open Xcode**
   ```bash
   open VShip.xcodeproj
   ```

2. **Verify Icons**
   - In Xcode, go to VShip → Resources → Assets.xcassets → AppIcon
   - You should see all the new Vercel-style icons

3. **Archive the App**
   - In Xcode menu: Product → Archive
   - Wait for the archive to complete

4. **Export the App**
   - When the Organizer window appears, click "Distribute App"
   - Choose "Copy App"
   - Click "Next" and "Export"
   - Save to: `/Users/charles/Code/VShip/Export/`
   - **IMPORTANT**: If VShip.app already exists, delete it first or choose a different name

5. **Create DMG**
   ```bash
   cd /Users/charles/Code/VShip
   ./create-dmg.sh
   ```

6. **Upload to GitHub Releases**
   - Go to https://github.com/CharlesSOo/Vship/releases
   - Click "Create a new release"
   - Tag version: v1.0.0
   - Release title: VShip 1.0.0
   - Upload VShip-1.0.0.dmg
   - Publish release
   - Copy the download URL for the DMG

The download URL will be something like:
`https://github.com/CharlesSOo/Vship/releases/download/v1.0.0/VShip-1.0.0.dmg`
