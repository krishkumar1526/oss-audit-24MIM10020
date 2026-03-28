#!/bin/bash
# Script 3: Disk and Permission Auditor

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========================================="
echo "     DISK AND PERMISSION AUDITOR"
echo "========================================="
echo ""
echo "Directory Audit Report"
echo "----------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "$DIR → Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist"
    fi
done

echo ""
echo "========================================="
echo "Python Configuration Directory Check"
echo "========================================="

if [ -d "/etc/python3" ]; then
    PERMS=$(ls -ld "/etc/python3" | awk '{print $1, $3, $4}')
    echo "/etc/python3 exists - Permissions: $PERMS"
else
    echo "/etc/python3 does not exist"
fi

echo ""
echo "Audit completed: $(date)"

