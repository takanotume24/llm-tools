#!/usr/bin/env bash

#=============================================================================
# PDF を 1 枚の画像に縦方向に連結するスクリプト
# 背景を白にするため、-background オプションや -alpha remove を使用 (IMv7: magick コマンド)
#
# 使用例:
#   ./pdf2singleimage.sh input.pdf output.png
#=============================================================================

set -e

if [ $# -ne 2 ]; then
  echo "Usage: $0 <input.pdf> <output_image>"
  exit 1
fi

INPUT_PDF="$1"
OUTPUT_IMAGE="$2"
DENSITY=150

magick \
  -density "$DENSITY" \
  -background white \
  "$INPUT_PDF" \
  -alpha remove \
  -alpha off \
  -append \
  "$OUTPUT_IMAGE"

echo "Done: $OUTPUT_IMAGE に白背景で出力しました。"
