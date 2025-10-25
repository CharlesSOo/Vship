# Complete VShip Release Guide

This guide will walk you through rebuilding VShip with the new Vercel logo, creating a DMG, and making it available for download.

## What's Been Done ✅

1. ✅ Generated Vercel-style app icons (black triangle on white background)
2. ✅ Updated website with Vercel trademark disclaimer
3. ✅ Website deployed with disclaimer at: https://vship-lfn73imfh-meckins-projects.vercel.app

## What You Need to Do

### Step 1: Rebuild the App in Xcode

```bash
# Open Xcode
open /Users/charles/Code/VShip/VShip.xcodeproj
```

**In Xcode:**
1. Check the new icons: VShip → Resources → Assets.xcassets → AppIcon
   - You should see Vercel-style black triangles on white background
2. **Product → Archive**
3. When Organizer opens, click **Distribute App**
4. Choose **Copy App**
5. Click **Next** → **Export**
6. Save location: `/Users/charles/Code/VShip/Export/`
   - **Delete the old VShip.app first if it exists!**

### Step 2: Create the DMG

```bash
cd /Users/charles/Code/VShip
./create-dmg.sh
```

This will create `VShip-1.0.0.dmg` in the current directory.

### Step 3: Upload to GitHub Releases

```bash
cd /Users/charles/Code/VShip
./create-release.sh
```

This script will:
- Create a GitHub release tagged `v1.0.0`
- Upload the DMG file
- Generate release notes
- Display the download URL

The download URL will be:
```
https://github.com/CharlesSOo/Vship/releases/download/v1.0.0/VShip-1.0.0.dmg
```

### Step 4: Update Website Download Button

After the release is created, update the download buttons to use the real download URL:

```bash
cd /Users/charles/Code/vship-web
```

Edit `app/page.tsx` and replace the placeholder download buttons with:

```tsx
<a
  href="https://github.com/CharlesSOo/Vship/releases/download/v1.0.0/VShip-1.0.0.dmg"
  className="px-6 py-3 bg-white text-black rounded-md font-medium hover:bg-white/90 transition-colors"
>
  Download for macOS
</a>
```

Do this for both download buttons (in the hero section and CTA section).

Then deploy:
```bash
git add .
git commit -m "Add DMG download links"
git push
vercel --prod --yes
```

## Quick Commands Summary

```bash
# 1. Open Xcode and rebuild (manual step)
open /Users/charles/Code/VShip/VShip.xcodeproj

# 2. Create DMG
cd /Users/charles/Code/VShip
./create-dmg.sh

# 3. Create GitHub Release
./create-release.sh

# 4. Update website (after getting download URL)
cd /Users/charles/Code/vship-web
# Edit app/page.tsx to add download links
git add . && git commit -m "Add DMG download links" && git push
vercel --prod --yes
```

## Verification Checklist

- [ ] App has Vercel triangle icon (black on white)
- [ ] DMG created successfully
- [ ] GitHub release created with DMG attached
- [ ] Download link works
- [ ] Website shows working download button
- [ ] Website displays Vercel disclaimer in footer

## Troubleshooting

**Problem:** `xcodebuild` command not found
**Solution:** You need full Xcode installed, not just Command Line Tools

**Problem:** DMG script fails
**Solution:** Make sure VShip.app exists in the Export/ folder

**Problem:** GitHub CLI authentication
**Solution:** Run `gh auth login` and follow the prompts

**Problem:** Release already exists
**Solution:** Either delete the existing release on GitHub or change the version number
