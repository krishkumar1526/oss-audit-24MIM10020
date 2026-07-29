#!/bin/bash
# Script 4: Log File Analyzer

source "$(dirname "$0")/lib/common.sh"

LOGFILE="$1"
KEYWORD="${2:-error}"
COUNT=0

print_header "        LOG FILE ANALYZER"

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    echo "Usage: $0 <logfile> [keyword]"
    exit 1
fi

echo "Analyzing: $LOGFILE"
echo "Searching for: '$KEYWORD'"
echo ""

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Found '$KEYWORD' $COUNT times"
echo ""
echo "Last 5 matching lines:"
echo "----------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
echo ""
print_completed "Analysis completed"
