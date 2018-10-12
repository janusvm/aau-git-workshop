# Makefile for Git Workshop
# -----------------------------------------------------------------------------

# Build flags
R_OPTS = --slave --vanilla

# Main files
SLIDES = index
CSS = custom.css

# Directories
SUBDIR = input

# Source files
RMD_INPUT := $(wildcard $(SUBDIR)/*.Rmd)
TEX_FIGS := $(wildcard figs/*.tex)
SVG_FIGS := $(TEX_FIGS:.tex=.svg)

# Rules -----------------------------------------------------------------------

# Slides
slides: $(SLIDES).html

$(SLIDES).html: $(SLIDES).Rmd $(RMD_INPUT) $(CSS) $(SVG_FIGS)
	Rscript $(R_OPTS) -e "rmarkdown::render('$<', 'xaringan::moon_reader')"

# SVG figures
%.svg: %.tex
	cd figs && \
	latexmk -pdf -quiet $(<F) && \
	pdf2svg $(patsubst %.tex,%.pdf,$(<F)) $(@F) && \
	latexmk -C $(<F)
