#!/bin/bash
set -e

# Domyślny tryb kompilacji
BUILD_TYPE=${1:-Debug}
BUILD_DIR="Out/CMake_Files"

echo ""
echo "=== JerzykRF_Multi Build ==="
echo "Build type: ${BUILD_TYPE}"
echo "Build dir:  ${BUILD_DIR}"
echo ""

# === [0/3] Czyszczenie buildów ===
echo "[0/3] Cleaning previous builds..."
rm -rf Out/

# Krok 1: Konfiguracja
echo "[1/3] Configuring CMake..."
cmake -S . -B ${BUILD_DIR} \
  -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
  -DCMAKE_TOOLCHAIN_FILE=MCU_Core/CMAKE_TOOLCHAIN/toolchain-arm-none-eabi.cmake \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

# Krok 2: Budowanie
echo "[2/3] Building project..."
cmake --build ${BUILD_DIR} -- -j$(nproc)

# Krok 3: Wyniki
echo "[3/3] Done. ELF files:"
ls -lh Out/Bin/*.elf

