#!/bin/bash
# Script 3: Disk and Permission Auditor

source "$(dirname "$0")/lib/common.sh"

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

print_header "     DISK AND PERMISSION AUDITOR"
echo "Directory Audit Report"
echo "----------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(get_perms "$DIR")
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "$DIR → Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist"
    fi
done

echo ""
print_separator
echo "Python Configuration Directory Check"
print_separator

if [ -d "/etc/python3" ]; then
    echo "/etc/python3 exists - Permissions: $(get_perms "/etc/python3")"
else
    echo "/etc/python3 does not exist"
fi

echo ""
print_completed "Audit completed"
