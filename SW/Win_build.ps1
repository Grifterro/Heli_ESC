param(
    [ValidateSet("Debug", "Release", "RelWithDebInfo", "MinSizeRel")]
    [string]$BuildType = "Debug"
)

# Zatrzymaj skrypt przy pierwszym błędzie
$ErrorActionPreference = "Stop"

# Katalog, w którym leży skrypt (czyli katalog projektu)
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

$BUILD_DIR = "Out/CMake_Files"

Write-Host ""
Write-Host "=== Heli ESC Build ==="
Write-Host "Build type: $BuildType"
Write-Host "Build dir:  $BUILD_DIR"
Write-Host ""

# === [0/3] Cleanup builds ===
Write-Host "[0/3] Cleaning previous builds..."
if (Test-Path "Out") {
    Remove-Item "Out" -Recurse -Force
}

# === [1/3] Configuring CMake ===
Write-Host "[1/3] Configuring CMake..."

# Uwaga: generator na Windows – tu zakładam Ninja; możesz zmienić np. na
# "MinGW Makefiles" lub generator Visual Studio, jeśli wolisz.
$generator = "MinGW Makefiles"

cmake -S $ScriptDir -B $BUILD_DIR `
  -G $generator `
  -DCMAKE_BUILD_TYPE=$BuildType `
  -DCMAKE_TOOLCHAIN_FILE="MCU_Core/CMAKE_TOOLCHAIN/toolchain-arm-none-eabi.cmake" `
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

# === [2/3] Building project ===
Write-Host "[2/3] Building project..."

# Odpowiednik `-j$(nproc)` – liczba rdzeni z systemu
$jobs = [Environment]::ProcessorCount

cmake --build $BUILD_DIR -- -j $jobs

# === [3/3] Results ===
Write-Host "[3/3] Done. ELF files:"

if (Test-Path "Out/Bin") {
    Get-ChildItem "Out/Bin" -Filter *.elf |
        Select-Object Name, Length, LastWriteTime |
        Format-Table -AutoSize
} else {
    Write-Host "Directory Out/Bin not found."
}
