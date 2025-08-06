# Makefile for LaTeX Report Compilation

# Configuration
PDFLATEX = pdflatex
BIBTEX = bibtex
LATEX_FLAGS = -interaction=nonstopmode -halt-on-error

# Main document
MAIN_TEX = report.tex
OUTPUT_PDF = report.pdf

# Directories
SECTIONS_DIR = sections
IMAGES_DIR = images
LISTINGS_DIR = listings

# Source files
TEX_FILES = $(MAIN_TEX) $(wildcard $(SECTIONS_DIR)/*.tex)
BIB_FILE = bibliography.bib

# Intermediate files
AUX_FILE = $(MAIN_TEX:.tex=.aux)
BBL_FILE = $(MAIN_TEX:.tex=.bbl)
BLG_FILE = $(MAIN_TEX:.tex=.blg)
LOG_FILE = $(MAIN_TEX:.tex=.log)
OUT_FILE = $(MAIN_TEX:.tex=.out)

TEMP_FILES = $(AUX_FILE) $(BBL_FILE) $(BLG_FILE) $(LOG_FILE) $(OUT_FILE) \
             *.toc *.lot *.lof *.nav *.snm *.vrb *.dvi *.fls *.fdb_latexmk

.PHONY: all clean distclean view help quick

all: $(OUTPUT_PDF)

$(OUTPUT_PDF): $(TEX_FILES) $(BIB_FILE)
	@echo "Building PDF with bibliography..."
	$(PDFLATEX) $(LATEX_FLAGS) $(MAIN_TEX)
	$(BIBTEX) $(AUX_FILE:.aux=)
	$(PDFLATEX) $(LATEX_FLAGS) $(MAIN_TEX)
	$(PDFLATEX) $(LATEX_FLAGS) $(MAIN_TEX)
	@echo "PDF successfully generated: $(OUTPUT_PDF)"

quick: $(TEX_FILES)
	@echo "Quick compilation (single pass)..."
	$(PDFLATEX) $(LATEX_FLAGS) $(MAIN_TEX)

view: $(OUTPUT_PDF)
	@if command -v xdg-open > /dev/null; then \
		xdg-open $(OUTPUT_PDF); \
	elif command -v open > /dev/null; then \
		open $(OUTPUT_PDF); \
	else \
		echo "Please open $(OUTPUT_PDF) manually."; \
	fi

clean:
	@echo "Cleaning intermediate files..."
	@rm -f $(TEMP_FILES)

distclean: clean
	@echo "Removing PDF output..."
	@rm -f $(OUTPUT_PDF)

help:
	@echo "Available targets:"
	@echo "  all       - Full compilation with bibliography"
	@echo "  quick     - Quick single-pass compilation"
	@echo "  view      - Open PDF in default viewer"
	@echo "  clean     - Remove intermediate files"
	@echo "  distclean - Remove all generated files"
	@echo "  help      - Show this help message"
