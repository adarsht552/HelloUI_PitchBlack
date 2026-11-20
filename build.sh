#!/bin/sh
# Builds the flashable zip into ./dist
set -e
cd "$(dirname "$0")/module"
mkdir -p ../dist
OUT="../dist/HelloUI-PitchBlack-$(grep '^version=' module.prop | cut -d= -f2).zip"
rm -f "$OUT"
zip -r9 "$OUT" . -x '.*'
echo "Built $OUT"
