#!/bin/bash

# Ustawienia
DEVICE="STM32F303CB"
INTERFACE="SWD"
SPEED="4000"

# Ścieżka do JLinkExe (upewnij się, że jest w PATH, lub podaj pełną ścieżkę)
JLINK=JLinkExe

# Nazwa tymczasowego pliku ze skryptem J-Link
SCRIPT_FILE="erase.jlink"

# Tworzenie skryptu J-Link
cat <<EOF > $SCRIPT_FILE
r
erase
exit
EOF

# Uruchomienie J-LinkExe z parametrami
$JLINK -device $DEVICE -if $INTERFACE -speed $SPEED -autoconnect 1 -CommanderScript $SCRIPT_FILE

# Usunięcie tymczasowego pliku
rm $SCRIPT_FILE
