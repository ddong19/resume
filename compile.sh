#!/usr/bin/env bash
set -e

# Clean old build artifacts
rm -f *.aux *.log *.out

# Choose .tex file to compile
if [ -z "$1" ]; then
  echo "Usage: ./compile.sh <file.tex>"
  exit 1
fi

FILE=$1

# Run LuaLaTeX in container
podman run --rm -v "$(pwd):/workspace:z" -w /workspace registry.gitlab.com/islandoftex/images/texlive:latest pdflatex "$FILE"
