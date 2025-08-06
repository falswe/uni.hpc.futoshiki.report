# Futoshiki Parallel Solver - Technical Report

## Quick Start

### Building the Report
```bash
# Complete build with bibliography
make

# View the generated PDF
make view

# Quick rebuild (single pass)
make quick
```

### Manual Compilation
```bash
pdflatex report.tex
bibtex report
pdflatex report.tex
pdflatex report.tex
```

## File Structure

```
report/
├── report.tex                 # Main LaTeX document
├── bibliography.bib           # Bibliography entries  
├── Makefile                  # Build automation
├── README.md                 # This file
│
├── sections/                 # Report sections
│   ├── 01_introduction.tex
│   ├── 02_sequential_algorithm.tex
│   ├── 03_parallel_implementation.tex
│   ├── 04_experimental_evaluation.tex
│   ├── 05_conclusion.tex
│   ├── 06_future_work.tex
│   └── 07_related_work.tex
│
├── listings/                 # Code snippets
│   ├── mpi_work_generation.tex
│   └── pbs_submit_script.tex
│
├── images/                   # Figures (to be generated)
│   ├── mpi_workflow.png
│   ├── speedup_chart.png
│   ├── efficiency_chart.png
│   ├── precoloring_impact.png
│   ├── task_factor_analysis.png
│   └── weak_scaling_chart.png
│
└── tikz/                     # TikZ diagram sources
    └── mpi_workflow.tex

```

## Prerequisites

### Required LaTeX Packages
- IEEEtran (document class)
- inputenc (UTF-8 support)
- cite (citations)
- amsmath, amssymb, amsfonts (mathematics)
- algorithmic (algorithms)
- graphicx (figures)
- textcomp (text symbols)
- xcolor (colors)
- hyperref (hyperlinks)
- booktabs (professional tables)
- listings (code listings)
- subfigure (subfigures)
- tikz (optional, for diagrams)

### Software Requirements
- TeX distribution (TeX Live 2020+, MiKTeX, or MacTeX)
- pdflatex
- bibtex
- Python 3.6+ with matplotlib, numpy, pandas (for generating graphs)
- Make (optional but recommended)

## Generating Figures

### Using the Python Script
```bash
# Generate all performance graphs
python3 generate_graphs.py

# This creates both PNG (for viewing) and PDF (for LaTeX) versions
```

### Manual Figure Creation
If you prefer to use your own data:
1. Create graphs using your preferred tool (Excel, matplotlib, gnuplot, etc.)
2. Export as high-resolution PNG (300 DPI) or PDF
3. Place in the `images/` directory
4. Ensure filenames match those referenced in the LaTeX source

### Required Figures
1. **mpi_workflow.png**: Master-worker communication diagram
2. **speedup_chart.png**: Speedup comparison (OpenMP, MPI, Hybrid)
3. **efficiency_chart.png**: Parallel efficiency vs. core count
4. **precoloring_impact.png**: Time reduction from pre-coloring
5. **task_factor_analysis.png**: Performance vs. task generation factor
6. **weak_scaling_chart.png**: Weak scaling efficiency

## Customization

### Adding Your Information
Edit `report.tex` to update:
- Author names and matriculation numbers
- GitHub repository URL
- Acknowledgments section
- Any institution-specific formatting

### Adjusting Performance Data
Update tables in `sections/04_experimental_evaluation.tex` with your actual measurements:
- Table 1: Pre-coloring impact
- Table 2: OpenMP scaling
- Table 3: MPI scaling
- Table 4: Hybrid configurations
- Table 5: Weak scaling

### Adding New Sections
1. Create new `.tex` file in `sections/`
2. Add `\input{sections/your_section.tex}` to `report.tex`
3. Update table of contents if needed

## Compilation Issues

### Common Problems and Solutions

#### Missing packages
```bash
# Ubuntu/Debian
sudo apt-get install texlive-full

# Fedora/RHEL
sudo dnf install texlive-scheme-full

# macOS
brew install --cask mactex
```

#### Bibliography not updating
```bash
# Clean and rebuild
make clean
make
```

#### Figures not found
- Ensure images are in `images/` directory
- Check filename case sensitivity (Linux/Mac)
- Verify file extensions in `\includegraphics` commands

#### PDF not opening
```bash
# Check for compilation errors
pdflatex report.tex 2>&1 | grep -i error

# View log file
less report.log
```

## Style Guidelines

### IEEE Conference Format
- 10pt font size
- Two-column layout
- US Letter paper size
- 1-inch margins
- Times Roman font

### Code Listings
- Use `lstlisting` environment
- Set language appropriately (C, Bash, etc.)
- Keep snippets concise (<20 lines)
- Include only essential code

### Figures
- Center all figures
- Provide descriptive captions
- Reference in text as "Figure \ref{fig:label}"
- Use vector graphics (PDF) when possible

### Tables
- Use `booktabs` package for professional appearance
- Avoid vertical lines
- Include units in headers
- Bold important values

### Citations
- Use `\cite{}` for references
- Ensure all citations are in bibliography
- Follow IEEE citation style
- Include DOIs when available

## Submission Checklist

### Content
- [ ] Abstract (150-250 words)
- [ ] All sections complete
- [ ] Performance data accurate
- [ ] Figures generated and included
- [ ] Code listings formatted
- [ ] Bibliography complete
- [ ] Acknowledgments updated

### Formatting
- [ ] Page limit observed (if applicable)
- [ ] IEEE format compliance
- [ ] No compilation warnings
- [ ] Spell check completed
- [ ] Grammar check completed
- [ ] Consistent terminology

### Technical
- [ ] Results reproducible
- [ ] GitHub repository accessible
- [ ] Source code documented
- [ ] Build instructions clear
- [ ] Dependencies listed

### Final Steps
- [ ] PDF metadata correct
- [ ] File size reasonable (<10MB)
- [ ] Submission format (PDF/A if required)
- [ ] Filename follows convention
- [ ] Backup created

## Tips for Writing

### Performance Analysis
- Report speedup as T₁/Tₚ
- Calculate efficiency as Speedup/p
- Include error bars if multiple runs
- Explain anomalies in scaling

### Code Descriptions
- Focus on parallel aspects
- Explain synchronization points
- Describe load balancing strategy
- Highlight optimizations

### Conclusions
- Summarize key achievements
- Quantify performance gains
- State contributions clearly
- Avoid overgeneralization

## Contact

For questions about the report structure or LaTeX issues, consult:
- IEEE Author Center: https://ieeeauthorcenter.ieee.org/
- LaTeX Stack Exchange: https://tex.stackexchange.com/
- Course instructor/TA

## License

This report template is provided for educational purposes. Ensure compliance with your institution's academic policies and IEEE copyright requirements if submitting for publication.