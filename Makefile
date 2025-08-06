# Simple Makefile for LaTeX project

# Compiler
PDFLATEX = pdflatex
BIBTEX = bibtex

# Source files
MAIN_TEX = report.tex
BASENAME = $(basename $(MAIN_TEX))

.PHONY: all clean

# Default target
all: $(BASENAME).pdf

# Rule to build the PDF
$(BASENAME).pdf: $(BASENAME).tex $(BASENAME).bbl sections/*.tex
	$(PDFLATEX) $(MAIN_TEX)
	$(PDFLATEX) $(MAIN_TEX)

$(BASENAME).bbl: $(BASENAME).aux bibliography.bib
	$(BIBTEX) $(BASENAME).aux

$(BASENAME).aux: $(MAIN_TEX) sections/*.tex
	$(PDFLATEX) $(MAIN_TEX)

# Clean up generated files
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.pdf