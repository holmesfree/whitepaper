#!/bin/bash

# Build the HOLMES whitepaper/manifesto PDF

# Check if pdflatex is available
if ! command -v pdflatex &> /dev/null; then
    echo "Error: pdflatex is not installed. Please install a LaTeX distribution."
    echo "On macOS: brew install --cask mactex-no-gui"
    echo "On Ubuntu: sudo apt-get install texlive-full"
    exit 1
fi

# Build the PDF (run twice for TOC)
echo "Building HOLMES Manifesto PDF..."
pdflatex -interaction=nonstopmode holmes-whitepaper.tex
pdflatex -interaction=nonstopmode holmes-whitepaper.tex

# Clean up auxiliary files
echo "Cleaning up..."
rm -f *.aux *.log *.out *.toc

echo "Done! Output: holmes-whitepaper.pdf"
