#!/bin/bash
# Script 2: FOSS Package Inspector - Python Audit

source "$(dirname "$0")/lib/common.sh"

PACKAGE="python3"

print_header "     FOSS PACKAGE INSPECTOR"

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

print_four_freedoms
