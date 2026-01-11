#!/bin/bash

# Build the CYRUS whitepaper PDF for the PARS Community

# Check if pdflatex is available
if ! command -v pdflatex &> /dev/null; then
    echo "Error: pdflatex is not installed. Please install a LaTeX distribution."
    echo "On macOS: brew install --cask mactex-no-gui"
    echo "On Ubuntu: sudo apt-get install texlive-full"
    exit 1
fi

# Build the PDF (run twice for TOC)
echo "Building CYRUS Whitepaper PDF for the PARS Community..."
pdflatex -interaction=nonstopmode cyrus-whitepaper.tex
pdflatex -interaction=nonstopmode cyrus-whitepaper.tex

# Clean up auxiliary files
echo "Cleaning up..."
rm -f *.aux *.log *.out *.toc

echo "Done! Output: cyrus-whitepaper.pdf"
