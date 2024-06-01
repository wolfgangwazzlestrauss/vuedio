# Just configuration file for running commands.
#
# For more information, visit https://just.systems.

set windows-shell := ['powershell.exe', '-NoLogo', '-Command']

# List all commands available in justfile.
list:
  just --list

# Execute all development commands.
all: setup format build test

# Build production assets.
build:
  npx vue-tsc --noEmit
  npx vite build

# Luunch development server.
dev *args:
  npx vite dev {{args}}

# Check code formatting.
format:
  npx prettier --check .

# Install development dependencies.
setup:
  node --version
  npm --version
  npm ci
  npx playwright install chromium

# Run test suites.
test:
  npx vitest run
  npx playwright test
