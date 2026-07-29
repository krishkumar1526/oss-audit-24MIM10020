#!/bin/bash
# Script 4: Log File Analyzer

LOGFILE="$1"
KEYWORD="${2:-error}"

echo "========================================="
echo "        LOG FILE ANALYZER"
echo "========================================="
echo ""

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    echo "Usage: $0 <logfile> [keyword]"
    exit 1
fi

echo "Analyzing: $LOGFILE"
echo "Searching for: '$KEYWORD'"
echo ""

COUNT=$(grep -icF -- "$KEYWORD" "$LOGFILE")

echo "Found '$KEYWORD' $COUNT times"
echo ""
echo "Last 5 matching lines:"
echo "----------------------"
grep -iF -- "$KEYWORD" "$LOGFILE" | tail -5
echo ""
echo "Analysis completed: $(date)"

