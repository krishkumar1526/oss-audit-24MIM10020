#!/usr/bin/env bats
# Unit tests for script4.sh - Log File Analyzer

load helpers

setup() {
    LOGFILE="$(mktemp)"
    cat > "$LOGFILE" <<'EOF'
info: everything is fine
ERROR: disk almost full
warning: high memory usage
error: connection timed out
Error: failed to parse config
info: recovered
error: retry limit exceeded
EOF
}

teardown() {
    rm -f "$LOGFILE"
}

@test "script4: fails with usage message when file is missing" {
    run_script script4.sh /nonexistent/path.log
    [ "$status" -eq 1 ]
    [[ "$output" == *"not found."* ]]
    [[ "$output" == *"Usage:"* ]]
}

@test "script4: counts keyword occurrences case-insensitively (default 'error')" {
    run_script script4.sh "$LOGFILE"
    [ "$status" -eq 0 ]
    # ERROR, error, Error, error -> 4 matches (case-insensitive).
    [[ "$output" == *"Found 'error' 4 times"* ]]
}

@test "script4: reports which file and keyword it is analyzing" {
    run_script script4.sh "$LOGFILE"
    [[ "$output" == *"Analyzing: $LOGFILE"* ]]
    [[ "$output" == *"Searching for: 'error'"* ]]
}

@test "script4: honours a custom keyword argument" {
    run_script script4.sh "$LOGFILE" warning
    [[ "$output" == *"Searching for: 'warning'"* ]]
    [[ "$output" == *"Found 'warning' 1 times"* ]]
}

@test "script4: reports zero matches for an absent keyword" {
    run_script script4.sh "$LOGFILE" zzzznotpresent
    [ "$status" -eq 0 ]
    [[ "$output" == *"Found 'zzzznotpresent' 0 times"* ]]
}

@test "script4: shows the last 5 matching lines" {
    run_script script4.sh "$LOGFILE"
    [[ "$output" == *"Last 5 matching lines:"* ]]
    # The final 'error' line should appear in the tail output.
    [[ "$output" == *"retry limit exceeded"* ]]
}
