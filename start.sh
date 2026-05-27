#!/usr/bin/env bash
#
# Farol dev startup
#
# Usage:
#   ./start.sh          # start (kills any prior dev server first)
#   ./start.sh --clean  # also wipe .next/dev cache before starting
#
set -e
cd "$(dirname "$0")"

if [[ "$1" == "--clean" ]]; then
  echo "🧹  Clearing .next cache..."
  rm -rf .next
fi

echo "🔪  Killing any running Next.js dev server..."
pkill -f "next dev" 2>/dev/null || true
sleep 1

echo "🚀  Starting Next.js dev server..."
exec pnpm dev
