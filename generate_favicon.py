#!/usr/bin/env python3
"""
VShip Favicon Generator
Creates favicon.ico and other web icon sizes
"""

from PIL import Image, ImageDraw

def create_triangle_icon(size, bg_color=(0, 0, 0), triangle_color=(255, 255, 255)):
    """Create a triangle icon at the specified size"""
    img = Image.new('RGBA', (size, size), bg_color + (255,))
    draw = ImageDraw.Draw(img)

    # Draw triangle
    padding = size * 0.2
    triangle_height = size * 0.6
    triangle_width = size * 0.6

    center_x = size / 2
    center_y = size / 2

    # Triangle points (pointing up)
    top = (center_x, center_y - triangle_height / 2)
    bottom_left = (center_x - triangle_width / 2, center_y + triangle_height / 2)
    bottom_right = (center_x + triangle_width / 2, center_y + triangle_height / 2)

    # Draw white triangle
    draw.polygon([top, bottom_left, bottom_right], fill=triangle_color + (255,))

    return img

def generate_favicons():
    """Generate favicons for the website"""
    print("🎨 Generating VShip favicons...")

    # Generate 32x32 favicon
    favicon_32 = create_triangle_icon(32)
    favicon_32.save("public/favicon.ico", format='ICO', sizes=[(32, 32)])
    print("  Created favicon.ico (32x32)")

    # Generate 192x192 for Android
    icon_192 = create_triangle_icon(192)
    icon_192.save("public/icon-192.png", 'PNG')
    print("  Created icon-192.png")

    # Generate 512x512 for Android
    icon_512 = create_triangle_icon(512)
    icon_512.save("public/icon-512.png", 'PNG')
    print("  Created icon-512.png")

    # Generate Apple touch icon (180x180)
    apple_icon = create_triangle_icon(180)
    apple_icon.save("public/apple-touch-icon.png", 'PNG')
    print("  Created apple-touch-icon.png")

    print("✅ Generated all favicon files in public/")

if __name__ == "__main__":
    generate_favicons()
