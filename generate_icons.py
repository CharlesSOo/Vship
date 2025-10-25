#!/usr/bin/env python3
"""
VShip Icon Generator
Creates all required macOS app icon sizes with a triangle logo
"""

from PIL import Image, ImageDraw
import os

# Icon sizes needed for macOS
SIZES = [
    (16, "icon_16x16.png"),
    (32, "icon_16x16@2x.png"),
    (32, "icon_32x32.png"),
    (64, "icon_32x32@2x.png"),
    (128, "icon_128x128.png"),
    (256, "icon_128x128@2x.png"),
    (256, "icon_256x256.png"),
    (512, "icon_256x256@2x.png"),
    (512, "icon_512x512.png"),
    (1024, "icon_512x512@2x.png"),
]

OUTPUT_DIR = "VShip/VShip/Resources/Assets.xcassets/AppIcon.appiconset"

def create_triangle_icon(size):
    """Create a triangle icon at the specified size (Vercel style)"""
    # Create image with white background
    img = Image.new('RGBA', (size, size), (255, 255, 255, 255))
    draw = ImageDraw.Draw(img)

    # Draw triangle (Vercel logo style)
    # Triangle should be centered and take up about 70% of the icon
    triangle_height = size * 0.7
    triangle_width = size * 0.7

    center_x = size / 2
    center_y = size / 2

    # Triangle points (pointing up) - Vercel style
    top = (center_x, center_y - triangle_height / 2)
    bottom_left = (center_x - triangle_width / 2, center_y + triangle_height / 2)
    bottom_right = (center_x + triangle_width / 2, center_y + triangle_height / 2)

    # Main triangle (black - Vercel style)
    draw.polygon([top, bottom_left, bottom_right], fill=(0, 0, 0, 255))

    return img

def generate_all_icons():
    """Generate all required icon sizes"""
    print("🎨 Generating VShip app icons...")

    os.makedirs(OUTPUT_DIR, exist_ok=True)

    for size, filename in SIZES:
        print(f"  Creating {filename} ({size}x{size})...")
        icon = create_triangle_icon(size)
        filepath = os.path.join(OUTPUT_DIR, filename)
        icon.save(filepath, 'PNG')

    print(f"✅ Generated {len(SIZES)} icon files in {OUTPUT_DIR}")
    print("\nNext steps:")
    print("1. Update Contents.json with the filenames")
    print("2. Rebuild the app in Xcode")

if __name__ == "__main__":
    generate_all_icons()
