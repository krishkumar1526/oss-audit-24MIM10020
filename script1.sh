#!/bin/bash
# Script 1: System Identity Report

source "$(dirname "$0")/lib/common.sh"

print_header "       SYSTEM IDENTITY REPORT"

echo "Linux Distribution: $(cat /etc/os-release | grep "PRETTY_NAME" | cut -d'"' -f2)"
echo "Kernel Version: $(uname -r)"
echo ""
echo "Current User: $(whoami)"
echo "Home Directory: $HOME"
echo ""
echo "System Uptime: $(uptime -p)"
echo "Current Date/Time: $(date '+%Y-%m-%d %H:%M:%S')"
echo ""
print_separator
echo "The Linux operating system is covered by"
echo "the GNU General Public License (GPL v2)."
print_separator
