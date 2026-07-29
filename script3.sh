#!/bin/bash
# Script 3: Disk and Permission Auditor
set -euo pipefail

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
        # Capture du's stderr instead of discarding it, so permission or
        # read errors are surfaced rather than silently swallowed.
        DU_ERR=$(mktemp)
        SIZE=$(du -sh "$DIR" 2>"$DU_ERR" | cut -f1) || true
        echo "$DIR → Permissions: $PERMS | Size: ${SIZE:-unavailable}"
        if [ -s "$DU_ERR" ]; then
            echo "  warning: du could not fully read $DIR:" >&2
            sed 's/^/    /' "$DU_ERR" >&2
        fi
        rm -f "$DU_ERR"
    else
        echo "$DIR does not exist" >&2
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
    echo "/etc/python3 does not exist" >&2
fi

echo ""
echo "Audit completed: $(date)"
