#!/usr/bin/env bats
# Unit tests for script5.sh - Open Source Manifesto Generator

load helpers

setup() {
    WORKDIR="$(mktemp -d)"
}

teardown() {
    rm -rf "$WORKDIR"
}

# Run script5 inside an isolated working directory, feeding the three answers
# on stdin. The script writes manifesto_<user>_<date>.txt to the cwd.
run_script5() {
    run bash -c "cd '$WORKDIR' && printf 'Python\nEverything\nAI\n' | bash '$REPO_ROOT/script5.sh'"
}

@test "script5: exits successfully and prints the generator header" {
    run_script5
    [ "$status" -eq 0 ]
    [[ "$output" == *"OPEN SOURCE MANIFESTO GENERATOR"* ]]
}

@test "script5: writes a manifesto file to the working directory" {
    run_script5
    local files=("$WORKDIR"/manifesto_*.txt)
    [ -f "${files[0]}" ]
}

@test "script5: substitutes the user's answers into the manifesto" {
    run_script5
    local files=("$WORKDIR"/manifesto_*.txt)
    local content
    content="$(cat "${files[0]}")"
    [[ "$content" == *"I use Python every day."* ]]
    [[ "$content" == *"To me, freedom means Everything."* ]]
    [[ "$content" == *"That is why I would build AI"* ]]
}

@test "script5: includes the four freedoms in the manifesto" {
    run_script5
    local files=("$WORKDIR"/manifesto_*.txt)
    local content
    content="$(cat "${files[0]}")"
    [[ "$content" == *"The Four Freedoms of Free Software:"* ]]
}

@test "script5: prints a preview and the saved-file confirmation" {
    run_script5
    [[ "$output" == *"Manifesto saved to:"* ]]
    [[ "$output" == *"Preview:"* ]]
}
