#!/bin/bash
set -e

# Default build mode
BUILD_TYPE=${1:-Debug}
BUILD_DIR="Out/CMake_Files"

echo ""
echo "=== Heli ESC Build ==="
echo "Build type: ${BUILD_TYPE}"
echo "Build dir:  ${BUILD_DIR}"
echo ""

# === [0/3] Cleanup builds ===
echo "[0/3] Cleaning previous builds..."
rm -rf Out/

# Step 1: Setup
echo "[1/3] Configuring CMake..."
cmake -S . -B ${BUILD_DIR} \
  -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
  -DCMAKE_TOOLCHAIN_FILE=MCU_Core/CMAKE_TOOLCHAIN/toolchain-arm-none-eabi.cmake \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

# Step 2: Building
echo "[2/3] Building project..."
cmake --build ${BUILD_DIR} -- -j$(nproc)

# Step 3: Results
echo "[3/3] Done. ELF files:"
ls -lh Out/Bin/*.elf

