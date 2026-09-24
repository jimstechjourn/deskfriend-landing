#!/usr/bin/env bash
# Render scripts/og-image.html -> og-image.png (1200x630) via headless Chrome.
# Re-run whenever the card design or copy changes.
set -euo pipefail
cd "$(dirname "$0")/.."
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
# --virtual-time-budget gives Google Fonts time to load before the screenshot.
"$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
  --virtual-time-budget=5000 --window-size=1200,630 \
  --screenshot=og-image.png "file://$PWD/scripts/og-image.html" >/dev/null 2>&1
echo "wrote og-image.png"
