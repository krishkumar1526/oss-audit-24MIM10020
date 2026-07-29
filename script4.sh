#!/bin/bash
# Script 4: Log File Analyzer
set -euo pipefail

LOGFILE="${1:-}"
KEYWORD="${2:-error}"
COUNT=0

echo "========================================="
echo "        LOG FILE ANALYZER"
echo "========================================="
echo ""

if [ -z "$LOGFILE" ]; then
    echo "Error: no log file provided." >&2
    echo "Usage: $0 <logfile> [keyword]" >&2
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found." >&2
    echo "Usage: $0 <logfile> [keyword]" >&2
    exit 1
fi

if [ ! -r "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' is not readable (check permissions)." >&2
    exit 1
fi

echo "Analyzing: $LOGFILE"
echo "Searching for: '$KEYWORD'"
echo ""

while IFS= read -r LINE; do
    if printf '%s\n' "$LINE" | grep -iq -- "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Found '$KEYWORD' $COUNT times"
echo ""
echo "Last 5 matching lines:"
echo "----------------------"
# grep exits 1 when there are simply no matches (not an error), but >=2
# signals a real failure that must be propagated rather than swallowed.
MATCHES=$(grep -i -- "$KEYWORD" "$LOGFILE") || GREP_STATUS=$?
GREP_STATUS=${GREP_STATUS:-0}
if [ "$GREP_STATUS" -ge 2 ]; then
    echo "Error: failed to read '$LOGFILE' while searching." >&2
    exit "$GREP_STATUS"
fi
if [ -n "$MATCHES" ]; then
    printf '%s\n' "$MATCHES" | tail -5
fi

echo ""
echo "Analysis completed: $(date)"
