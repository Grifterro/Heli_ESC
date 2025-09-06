#!/bin/bash

# Settings
DEVICE="STM32F303CB"
INTERFACE="SWD"
SPEED="8000"

# Path to JLinkExe
JLINK=JLinkExe

# Name of the temporary J-Link script file
SCRIPT_FILE="erase.jlink"

# Creating a J-Link script
cat <<EOF > $SCRIPT_FILE
r
erase
exit
EOF

# Run J-LinkExe with parameters
$JLINK -device $DEVICE -if $INTERFACE -speed $SPEED -autoconnect 1 -CommanderScript $SCRIPT_FILE

# Delete temporary file
rm $SCRIPT_FILE
