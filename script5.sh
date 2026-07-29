#!/bin/bash
# Script 5: Open Source Manifesto Generator
set -euo pipefail

echo "========================================="
echo "   OPEN SOURCE MANIFESTO GENERATOR"
echo "========================================="
echo ""
echo "Answer three questions to create your manifesto."
echo ""

read -rp "1. Name one open-source tool you use every day: " TOOL
read -rp "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -rp "3. Name one thing you would build and share freely: " BUILD

DATE=$(date +"%Y-%m-%d")
OUTPUT_FILE="manifesto_$(whoami)_$DATE.txt"

# Fail loudly if the manifesto cannot be written, instead of reporting
# success and then trying to display a file that was never created.
if ! cat > "$OUTPUT_FILE" << EOF
=========================================
     MY OPEN SOURCE MANIFESTO
=========================================

Created by: $(whoami)
Date: $(date)

I use $TOOL every day. It reminds me that
software can be built by anyone, for anyone.

To me, freedom means $FREEDOM.
It means having the right to study, modify,
and share code without asking permission.

I believe in building and sharing freely.
That is why I would build $BUILD and release
it under an open-source license.

=========================================
The Four Freedoms of Free Software:
0 - Run the program for any purpose
1 - Study and modify the source code
2 - Redistribute copies
3 - Distribute modified versions
=========================================
EOF
then
    echo "Error: failed to write manifesto to '$OUTPUT_FILE'." >&2
    exit 1
fi

echo ""
echo "✓ Manifesto saved to: $OUTPUT_FILE"
echo ""
echo "Preview:"
echo "--------"
if ! cat "$OUTPUT_FILE"; then
    echo "Error: manifesto was written but could not be read back for preview." >&2
    exit 1
fi
