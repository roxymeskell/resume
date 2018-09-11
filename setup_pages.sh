#!/bin/bash

set -e # Quit on error

SHA=`git rev-parse --short --verify HEAD` # Save object name of the current commit

# Create everything for gh-pages
mkdir pages
cp _build/resume.pdf pages/resume.pdf

# Create README
echo "# Automatic build" > pages/README.md
echo "[View PDF](http:/roxymeskell.github.io/resume/resume.pdf)" >> pages/README.md
echo "Built from \`$SHA\`. See https://github.com/roxymeskell/resume/ for details." >> pages/README.md
