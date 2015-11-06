Resolutioner 2.0 by Pixelatto
=============================
Resolutioner helps you achieve old style graphic aesthetics with features like dithering, palettes, pixelation and more.
It also includes a set of gizmos to manage diferent resolutions/aspect ratios.

Features:
 - Pixelation effect: use bigger pixel-texel sizes
 - Dithering: add monochrome, indexed or color dithering for a nostalgic look
 - Postprocess color: tinted monochrome, grayscale, indexed, palette or bit-limited (3Bit, 6Bit, 8Bit, 9Bit)
 - Custom subpixels: emulate RGB pixels from old CRT screens
 - Custom subpixel masks: make your own pixel masks to emulate "bumped" pixels
 - Screen effects: Scanlines, Glow, Gamma correction, Brightness, Contrast...
 - Multi-aspect gizmos and resolution limitation for resolution management
 - Source code included
 - 100% extensible: easily add your own masks, palettes, dithers
 - 100% compatible with Unity 5

DEMO SCENE CONTENTS:
ResolutionerDemo - A simple scene using Resolutioner to show a post-processed parrot

QUICK START GUIDE:
1. Import Resolutioner package into your project "Assets" folder
2. Drag the resolutioner script into a GameObject with a Camera component (or add the included prefab)
3. Adjust the settings to your needs

ADDING CUSTOM PALETTES/DITHERS/PIXELS:
You can add your custom images to these folder inside "Resolutioner/Resources". You can use the already included ones as templates for your own.
Just copy your PNG file to the folder and it will be available under the Resolutioner component.
They should meet the following requirements:

- Subpixels		("Resources/Pixels"     ): They should be squared. Use pure red, green and blue colors (and black for empty space).
- PixelShapes	("Resources/PixelShapes"): They should be squared. Use only grayscale colors.
- Dithers		("Resources/Dithers"    ): Every tile has to be exactly squared and set in a single row.
- Color Ramps	("Resources/Ramps"      ): A single row of pixels sortened by lightness.
- Palettes 		("Resources/Palettes"   ): A single row of pixels. Palettes require processing before being usable (available in the palette selection section).
- Scanlines		("Resources/Scanlines"  ): Any size, square preferred. This image will betiled and then overlayed over the output image.

TIPS:
- Palettes require a special pre-processing before being usable. Click the arrow button in the resolutioner component to process them.
- Every effect uses an optimized post-process shader. Use only what you really need to improve performance.

Get more assets at: www.pixelatto.com

If you need any help: support@pixelatto.com