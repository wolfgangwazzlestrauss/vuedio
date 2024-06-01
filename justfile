# Just configuration file for running commands.
#
# For more information, visit https://just.systems.

set windows-shell := ['powershell.exe', '-NoLogo', '-Command']

# List all commands available in justfile.
list:
  just --list

# Execute all development commands.
all: setup format lint build test

# Build production assets.
build:
  pnpm exec vue-tsc --noEmit
  pnpm exec vite build

# Luunch development server.
dev *args:
  pnpm exec vite dev {{args}}

# Check code formatting.
format:
  pnpm exec prettier --check .

# Run code analyses.
lint:
  pnpm exec eslint --no-fix --ext ts,vue --max-warnings 0 src tests

# Install development dependencies.
setup:
  node --version
  corepack enable pnpm
  pnpm --version
  pnpm install --frozen-lockfile
  pnpm exec playwright install chromium

# Run test suites.
test:
  pnpm exec vitest run
  pnpm exec playwright test
