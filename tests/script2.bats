#!/usr/bin/env bats
# Unit tests for script2.sh - FOSS Package Inspector

load helpers

@test "script2: exits successfully" {
    run_script script2.sh
    [ "$status" -eq 0 ]
}

@test "script2: prints the inspector header" {
    run_script script2.sh
    [[ "$output" == *"FOSS PACKAGE INSPECTOR"* ]]
}

@test "script2: detects python3 when it is installed" {
    run_script script2.sh
    [[ "$output" == *"python3 is installed."* ]]
    [[ "$output" == *"Version Information:"* ]]
    [[ "$output" == *"Location: $(command -v python3)"* ]]
}

@test "script2: takes the not-installed branch when python3 is absent" {
    # Run with an empty PATH so `command -v python3` fails. Invoke bash by
    # absolute path since it can no longer be resolved via PATH.
    local bash_bin
    bash_bin="$(command -v bash)"
    run env PATH="" "$bash_bin" "$REPO_ROOT/script2.sh"
    [[ "$output" == *"python3 is NOT installed."* ]]
    [[ "$output" != *"python3 is installed."* ]]
}

@test "script2: always prints the Python philosophy section" {
    run_script script2.sh
    [[ "$output" == *"Created by Guido van Rossum in 1991"* ]]
    [[ "$output" == *"Python Software Foundation (PSF) License"* ]]
}

@test "script2: lists all four freedoms of free software" {
    run_script script2.sh
    [[ "$output" == *"0 - Run the program for any purpose"* ]]
    [[ "$output" == *"1 - Study and modify the source code"* ]]
    [[ "$output" == *"2 - Redistribute copies"* ]]
    [[ "$output" == *"3 - Distribute modified versions"* ]]
}
