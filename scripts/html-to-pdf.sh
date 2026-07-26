#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: scripts/html-to-pdf.sh input.html [output.pdf]" >&2
  exit 64
fi

input=$1
output=${2:-${input%.*}.pdf}

if [[ ! -f "$input" ]]; then
  echo "Input file not found: $input" >&2
  exit 66
fi

if ! command -v weasyprint >/dev/null 2>&1; then
  echo "weasyprint is not installed. Install it with: brew install weasyprint" >&2
  exit 69
fi

weasyprint "$input" "$output"
echo "Wrote $output"
