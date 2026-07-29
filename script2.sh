#!/bin/bash
# Script 2: FOSS Package Inspector - Python Audit
set -euo pipefail

PACKAGE="python3"
INSTALLED=0

echo "========================================="
echo "     FOSS PACKAGE INSPECTOR"
echo "========================================="
echo ""

if command -v python3 &>/dev/null; then
    INSTALLED=1
    echo "✓ $PACKAGE is installed."
    echo ""
    echo "Version Information:"
    if ! python3 --version; then
        echo "Warning: could not determine $PACKAGE version." >&2
    fi
    echo ""
    echo "Location: $(command -v python3)"
else
    echo "✗ $PACKAGE is NOT installed." >&2
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

# Propagate the audit result so callers can detect a missing package.
if [ "$INSTALLED" -ne 1 ]; then
    exit 1
fi
