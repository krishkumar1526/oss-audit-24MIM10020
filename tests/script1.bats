#!/usr/bin/env bats
# Unit tests for script1.sh - System Identity Report

load helpers

@test "script1: exits successfully" {
    run_script script1.sh
    [ "$status" -eq 0 ]
}

@test "script1: prints the report header" {
    run_script script1.sh
    [[ "$output" == *"SYSTEM IDENTITY REPORT"* ]]
}

@test "script1: reports kernel version matching uname -r" {
    run_script script1.sh
    [[ "$output" == *"Kernel Version: $(uname -r)"* ]]
}

@test "script1: reports the current user" {
    run_script script1.sh
    [[ "$output" == *"Current User: $(whoami)"* ]]
}

@test "script1: reports the home directory" {
    run_script script1.sh
    [[ "$output" == *"Home Directory: $HOME"* ]]
}

@test "script1: reports date in YYYY-MM-DD HH:MM:SS format" {
    run_script script1.sh
    [[ "$output" =~ Current\ Date/Time:\ [0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}:[0-9]{2} ]]
}

@test "script1: includes the GPL license notice" {
    run_script script1.sh
    [[ "$output" == *"GNU General Public License (GPL v2)"* ]]
}
