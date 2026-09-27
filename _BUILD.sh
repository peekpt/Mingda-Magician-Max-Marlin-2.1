#!/bin/sh
# Build the Mingda Magician Max firmware and copy firmware.bin everywhere.
# Usage:  ./_BUILD.sh
set -e
cd "$(dirname "$0")"

ENV=langgo407ve_gd
BIN=".pio/build/$ENV/firmware.bin"

~/.platformio/penv/bin/pio run -e "$ENV"

cp "$BIN" _FIRMWARE/firmware.bin
cp "$BIN" /Volumes/ExtHome/paulo/Desktop/fw/firmware.bin
echo "copied -> _FIRMWARE/firmware.bin"
echo "copied -> Desktop/fw/firmware.bin"

if [ -d /Volumes/3D ]; then
  cp "$BIN" /Volumes/3D/firmware.bin
  echo "copied -> /Volumes/3D/firmware.bin"
else
  echo "/Volumes/3D not mounted, skipped"
fi
