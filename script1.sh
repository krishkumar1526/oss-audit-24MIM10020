#!/bin/bash
# Script 1: System Identity Report
set -euo pipefail

echo "========================================="
echo "       SYSTEM IDENTITY REPORT"
echo "========================================="
echo ""

if [ -r /etc/os-release ]; then
    DISTRO=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d'"' -f2) || true
    [ -n "$DISTRO" ] || DISTRO="Unknown (PRETTY_NAME not found)"
else
    DISTRO="Unknown (/etc/os-release not readable)"
fi

echo "Linux Distribution: $DISTRO"
echo "Kernel Version: $(uname -r)"
echo ""
echo "Current User: $(whoami)"
echo "Home Directory: ${HOME:-unknown}"
echo ""
echo "System Uptime: $(uptime -p 2>/dev/null || uptime)"
echo "Current Date/Time: $(date '+%Y-%m-%d %H:%M:%S')"
echo ""
echo "========================================="
echo "The Linux operating system is covered by"
echo "the GNU General Public License (GPL v2)."
echo "========================================="
