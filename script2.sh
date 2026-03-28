#!/bin/bash
# Script 2: FOSS Package Inspector - Python Audit

PACKAGE="python3"

echo "========================================="
echo "     FOSS PACKAGE INSPECTOR"
echo "========================================="
echo ""

if command -v python3 &>/dev/null; then
    echo "✓ $PACKAGE is installed."
    echo ""
    echo "Version Information:"
    python3 --version
    echo ""
    echo "Location: $(which python3)"
else
    echo "✗ $PACKAGE is NOT installed."
fi

echo ""
echo "📖 About Python:"
echo "Created by Guido van Rossum in 1991"
echo "License: Python Software Foundation (PSF) License"
echo "Philosophy: Readability matters, community-driven"
echo ""

echo "The Four Freedoms of Free Software:"
echo "0 - Run the program for any purpose"
echo "1 - Study and modify the source code"
echo "2 - Redistribute copies"
echo "3 - Distribute modified versions"

