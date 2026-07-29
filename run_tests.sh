#!/bin/bash
# Test runner for the oss-audit shell scripts.
# Installs nothing; requires `bats` to be available on PATH.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v bats &>/dev/null; then
    echo "Error: 'bats' is not installed."
    echo "Install it with:  sudo apt-get install -y bats"
    echo "or see https://github.com/bats-core/bats-core"
    exit 1
fi

chmod +x "$SCRIPT_DIR"/script*.sh
exec bats "$SCRIPT_DIR/tests"
