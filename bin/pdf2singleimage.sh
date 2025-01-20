#!/usr/bin/env bash

#=============================================================================
# This script merges all pages of a PDF into a single image vertically (IMv7).
# It uses the 'magick' command from ImageMagick 7.
#
# Usage:
#   ./pdf2singleimage.sh input.pdf output.png
#
# - Converts all pages of the input PDF into a single PNG file with a white background.
# - You can adjust the resolution (DENSITY) as needed.
#=============================================================================

set -euo pipefail

# Check if 'magick' (ImageMagick 7) is installed and available
if ! command -v magick > /dev/null 2>&1; then
  echo "Error: ImageMagick (magick) is not installed or not found in PATH." >&2
  exit 1
fi

if [ $# -ne 2 ]; then
  echo "Usage: $0 <input.pdf> <output_image>"
  exit 1
fi

INPUT_PDF="$1"
OUTPUT_IMAGE="$2"
DENSITY=150  # Adjust DPI (resolution) as needed

magick \
  -density "$DENSITY" \
  -background white \
  "$INPUT_PDF" \
  -alpha remove \
  -alpha off \
  -append \
  "$OUTPUT_IMAGE"

echo "Done. The file '$OUTPUT_IMAGE' has been created with a white background."
