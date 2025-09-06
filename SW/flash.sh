#!/bin/bash
set -e

BOOTLOADER="Out/Bin/BootLoader.elf"
APP="Out/Bin/App.elf"

# Checking for file existence
for file in "$BOOTLOADER" "$APP"; do
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

        echo \"Flashing APP...\";
        program $APP verify;

        reset;
        exit;
    "
