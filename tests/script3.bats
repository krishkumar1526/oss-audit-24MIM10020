#!/usr/bin/env bats
# Unit tests for script3.sh - Disk and Permission Auditor

load helpers

@test "script3: exits successfully" {
    run_script script3.sh
    [ "$status" -eq 0 ]
}

@test "script3: prints the auditor header and report title" {
    run_script script3.sh
    [[ "$output" == *"DISK AND PERMISSION AUDITOR"* ]]
    [[ "$output" == *"Directory Audit Report"* ]]
}

@test "script3: audits each of the standard directories" {
    run_script script3.sh
    for dir in /etc /var/log /home /usr/bin /tmp; do
        [[ "$output" == *"$dir"* ]]
    done
}

@test "script3: reports permissions and size for existing directories" {
    run_script script3.sh
    # At least one directory line should include the permission/size fields.
    [[ "$output" =~ "→ Permissions:".*"| Size:" ]]
}

@test "script3: performs the python configuration directory check" {
    run_script script3.sh
    [[ "$output" == *"Python Configuration Directory Check"* ]]
    if [ -d /etc/python3 ]; then
        [[ "$output" == *"/etc/python3 exists"* ]]
    else
        [[ "$output" == *"/etc/python3 does not exist"* ]]
    fi
}

@test "script3: prints an audit completion timestamp" {
    run_script script3.sh
    [[ "$output" == *"Audit completed:"* ]]
}
