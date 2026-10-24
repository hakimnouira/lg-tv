#!/usr/bin/env bash
set -euo pipefail

# Build an experimental LG NetCast USB folder layout.
# This does NOT sign/DRM-package the app and is not guaranteed to launch
# on every NetCast model. It is for testing the community USB-loading route.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="${1:-$ROOT/dist/netcast-usb}"
APP_ID="${NETCAST_APP_ID:-9000001}"

if [[ ! "$APP_ID" =~ ^[0-9]+$ ]]; then
  echo "NETCAST_APP_ID must be numeric (example: 9000001)." >&2
  exit 2
fi

rm -rf "$OUT"
mkdir -p "$OUT/lgapps/installed/$APP_ID"
cp "$ROOT/app/index.html" "$OUT/lgapps/installed/$APP_ID/index.html"
cat > "$OUT/README-EXPERIMENTAL.txt" <<'EOF'
Experimental NetCast USB folder layout.
This is not an official DRM-signed App Test package.
Compatibility and discovery are unverified on the target TV.
USB root should contain lgapps/installed/<numeric-app-id>/index.html.
EOF

mkdir -p "$(dirname "$OUT")"
(
  cd "$OUT"
  zip -qr "../netcast-usb.zip" .
)
echo "Built folder: $OUT"
echo "Built ZIP: $(dirname "$OUT")/netcast-usb.zip"
echo "App ID: $APP_ID"
echo "NOTE: experimental layout only; no LG DRM/signature was added."
