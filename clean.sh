#!/usr/bin/env bash

set -euo pipefail

if ! command -v bleachbit >/dev/null 2>&1; then
    echo "BleachBit is not installed."
    echo "Install it first:"
    echo "  sudo pacman -S bleachbit"
    exit 1
fi

CLEANERS=(
    system.cache
    system.tmp
    system.trash
    system.clipboard
    system.recent_documents
    system.rotated_logs
    system.memory
    bash.history
    thumbnails.cache
    firefox.cache
    chromium.cache
    google_chrome.cache
)

echo "Previewing files that will be deleted..."
echo

bleachbit --preview "${CLEANERS[@]}"

echo
read -rp "Do you want to delete these files? [y/N]: " confirm

case "$confirm" in
    y|Y|yes|YES)
        echo "Cleaning..."
        bleachbit --clean "${CLEANERS[@]}"
        echo "Done."
        ;;
    *)
        echo "Cancelled. Nothing deleted."
        ;;
esac
