#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
check "hello command exists" which hello
check "hello command works" hello
check "hello output contains greeting" bash -c "hello | grep 'Hello'"

# Report results
reportResults