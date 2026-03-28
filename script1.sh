#!/bin/bash
# Script 1: System Identity Report

echo "========================================="
echo "       SYSTEM IDENTITY REPORT"
echo "========================================="
echo ""

echo "Linux Distribution: $(cat /etc/os-release | grep "PRETTY_NAME" | cut -d'"' -f2)"
echo "Kernel Version: $(uname -r)"
echo ""
echo "Current User: $(whoami)"
echo "Home Directory: $HOME"
echo ""
echo "System Uptime: $(uptime -p)"
echo "Current Date/Time: $(date '+%Y-%m-%d %H:%M:%S')"
echo ""
echo "========================================="
echo "The Linux operating system is covered by"
echo "the GNU General Public License (GPL v2)."
echo "========================================="

