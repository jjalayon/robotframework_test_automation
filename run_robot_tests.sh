#!/bin/bash
# =========================================================
# Script to run Robot Framework tests from the command line
# Usage:
#   ./run_robot_tests.sh <tests_path> [output_dir]
#
# Example:
#   ./run_robot_tests.sh tests/ results/
# =========================================================

# Exit immediately if a command exits with a non-zero status
set -e

# --- Input validation ---
if [ -z "$1" ]; then
    echo "❌ ERROR: No test path provided."
    echo "Usage: $0 <tests_path> [output_dir]"
    exit 1
fi

TESTS_PATH="$1"
OUTPUT_DIR="${2:-results}"  # Default to 'results' if not provided

# Check if Robot Framework is installed
if ! command -v robot &> /dev/null; then
    echo "❌ ERROR: Robot Framework is not installed."
    echo "Install it with: pip install robotframework"
    exit 1
fi

# Check if test path exists
if [ ! -e "$TESTS_PATH" ]; then
    echo "❌ ERROR: Test path '$TESTS_PATH' does not exist."
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# --- Run Robot Framework tests ---
echo "🚀 Running Robot Framework tests..."
echo "📂 Tests: $TESTS_PATH"
echo "📂 Output: $OUTPUT_DIR"

robot \
    --outputdir "$OUTPUT_DIR" \
    "$TESTS_PATH"

# --- Completion message ---
if [ $? -eq 0 ]; then
    echo "✅ Tests completed successfully."
    echo "📄 Reports available in: $OUTPUT_DIR"
else
    echo "❌ Tests failed. Check logs in: $OUTPUT_DIR"
    exit 1
fi
