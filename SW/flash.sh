#!/bin/bash
set -e

BOOTLOADER="Out/Bin/BootLoader.elf"
APP="Out/Bin/App.elf"
BOOTLOADER_UP="Out/Bin/BootLoaderUpdater.elf"

# Sprawdzenie istnienia plików
for file in "$BOOTLOADER" "$APP" "$BOOTLOADER_UP"; do
    if [ ! -f "$file" ]; then
        echo "ERROR: File not found: $file"
        exit 1
    fi
done

echo "Flashing all binaries using OpenOCD and J-Link (SWD)..."

openocd \
    -c "adapter driver jlink" \
    -f target/stm32f3xx.cfg \
    -c "transport select swd" \
    -c "adapter speed 8000" \
    -c "
        init;
        reset init;

        echo \"Flashing BOOTLOADER...\";
        program $BOOTLOADER verify;

        echo \"Flashing SECURE APP...\";
        program $APP verify;

        echo \"Flashing NONSECURE APP...\";
        program $BOOTLOADER_UP verify;

        reset;
        exit;
    "
