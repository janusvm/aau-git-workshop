# Makefile for Git Workshop
# -----------------------------------------------------------------------------

# Build flags
R_OPTS = --slave --vanilla

# Main files
SLIDES = index
CSS = custom.css

# Source files
RMD_INPUT := $(wildcard input/*.Rmd)
IMG_INPUT := $(wildcard img/*)
JS_INPUT := $(wildcard js/*.js)
JS_HTML = js/js-figs.html

# Rules -----------------------------------------------------------------------

# Slides
slides: $(SLIDES).html

$(SLIDES).html: $(SLIDES).Rmd $(RMD_INPUT) $(IMG_INPUT) $(CSS) $(JS_HTML)
	Rscript $(R_OPTS) -e "rmarkdown::render('$<', 'xaringan::moon_reader')"

$(JS_HTML): $(JS_INPUT)
	> $@
	for script in $^; do \
		echo "<script src=\"$$script\"></script>" >> $@; \
	done
