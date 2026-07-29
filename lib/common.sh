#!/bin/bash
# Shared helpers used by all scripts in this repository.
# Source it from a script with:
#   source "$(dirname "$0")/lib/common.sh"

SEPARATOR="========================================="

print_separator() {
    echo "$SEPARATOR"
}

# Prints a banner: separator, centred-ish title, separator, blank line.
print_header() {
    print_separator
    echo "$1"
    print_separator
    echo ""
}

print_four_freedoms() {
    echo "The Four Freedoms of Free Software:"
    echo "0 - Run the program for any purpose"
    echo "1 - Study and modify the source code"
    echo "2 - Redistribute copies"
    echo "3 - Distribute modified versions"
}

# Prints "<label>: <current date>", e.g. "Audit completed: Sat Mar 28 ..."
print_completed() {
    echo "$1: $(date)"
}

# Permissions, owner and group of a path, e.g. "drwxr-xr-x root root"
get_perms() {
    ls -ld "$1" | awk '{print $1, $3, $4}'
}
