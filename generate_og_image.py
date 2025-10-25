#!/usr/bin/env python3
"""
VShip Open Graph Image Generator
Creates a social media preview image (1200x630px)
"""

from PIL import Image, ImageDraw, ImageFont
import os

def create_og_image():
    """Create Open Graph image for social media sharing"""
    # OG image standard size
    width = 1200
    height = 630

    # Create black background
    img = Image.new('RGB', (width, height), (0, 0, 0))
    draw = ImageDraw.Draw(img)

    # Draw large Vercel triangle at top
    triangle_size = 120
    center_x = width / 2
    top_y = 80

    # Triangle points (pointing up)
    top = (center_x, top_y)
    bottom_left = (center_x - triangle_size/2, top_y + triangle_size * 0.866)
    bottom_right = (center_x + triangle_size/2, top_y + triangle_size * 0.866)

    # Draw white triangle
    draw.polygon([top, bottom_left, bottom_right], fill=(255, 255, 255))

    # Add text (using default font since custom fonts may not be available)
    # Title
    title_y = 260
    draw.text((width/2, title_y), "Monitor Vercel",
              fill=(255, 255, 255),
              anchor="mm",
              font=None)  # Will use default, can enhance with custom font

    draw.text((width/2, title_y + 80), "from your menu bar",
              fill=(255, 255, 255),
              anchor="mm",
              font=None)

    # Subtitle
    subtitle = "VShip is a native macOS menu bar app that keeps you"
    subtitle2 = "informed about your Vercel deployments in real-time."

    draw.text((width/2, 450), subtitle,
              fill=(150, 150, 150),
              anchor="mm",
              font=None)

    draw.text((width/2, 490), subtitle2,
              fill=(150, 150, 150),
              anchor="mm",
              font=None)

    # Footer
    draw.text((width/2, 570), "macOS 15.0+ • Free for personal use",
              fill=(100, 100, 100),
              anchor="mm",
              font=None)

    # Save
    output_path = "public/og-image.png"
    img.save(output_path, 'PNG')
    print(f"✅ Created Open Graph image: {output_path}")
    print(f"   Size: {width}x{height}px")

if __name__ == "__main__":
    create_og_image()
