#!/bin/bash

# Check for Steam SDK
STEAM_SDK_DIR="modules/godotsteam/sdk"
if [[ ! -d "$STEAM_SDK_DIR/redistributable_bin" ]] || [[ ! -d "$STEAM_SDK_DIR/public" ]]; then
    echo "WARNING: Steam SDK not found. Install it in $STEAM_SDK_DIR (needs redistributable_bin/ and public/)"
    exit 1
fi

# Build for macOS x86_64
scons platform=macos arch=x86_64
scons platform=macos arch=arm64 generate_bundle=yes

# Copy the steam sdk libraries to the built app
cp modules/godotsteam/sdk/redistributable_bin/osx/libsteam_api.dylib bin/godot_macos_editor.app/Contents/MacOS/