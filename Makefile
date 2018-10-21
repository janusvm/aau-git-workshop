# Makefile for Git Workshop
# -----------------------------------------------------------------------------

# Build flags
R_OPTS = --slave --vanilla

# Main files
SLIDES = index
NOTES = notes
CSS = custom.css

# Directories
SUBDIR = input

# Source files
RMD_INPUT := $(wildcard $(SUBDIR)/*.Rmd)
R_FUNS := $(wildcard $(funs/*.R))
TEX_FIGS := $(wildcard figs/*.tex)
SVG_FIGS := $(TEX_FIGS:.tex=.svg)
TEX_FA := $(wildcard figs/fa/*.tex)
PDF_FA := $(TEX_FA:.tex=.pdf)
IMGS := $(wildcard imgs/*)

# Rules -----------------------------------------------------------------------

# Slides
slides: $(SLIDES).html

$(SLIDES).html: $(SLIDES).Rmd $(RMD_INPUT) $(CSS) $(R_FUNS) $(SVG_FIGS) $(IMGS)
	Rscript $(R_OPTS) -e "rmarkdown::render('$<', 'xaringan::moon_reader')"

# SVG figures
%.svg: %.tex $(PDF_FA)
	cd figs && \
	latexmk -pdf $(<F) && \
	pdf2svg $(patsubst %.tex,%.pdf,$(<F)) $(@F) && \
	latexmk -C $(<F)

figs/fa/%.pdf: figs/fa/%.tex
	cd figs/fa && \
	xelatex $(<F) && \
	latexmk -c

# Presenter notes
notes: $(NOTES).pdf

$(NOTES).pdf: $(NOTES).Rmd
	Rscript $(R_OPTS) -e "knitr::knit('$<')"

clean-figs:
	rm -f $(SVG_FIGS)

.PHONY: slides notes clean-figs
