#!/usr/bin/env bash
# Shared helpers for the bats test suite.

# Absolute path to the repository root (parent of the tests/ directory).
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Run a repo script by name, capturing status/output via bats `run`.
# Usage: run_script script1.sh [args...]
run_script() {
    local name="$1"
    shift
    run bash "$REPO_ROOT/$name" "$@"
}
