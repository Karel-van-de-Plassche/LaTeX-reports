.PHONY: all clean

targets=$(shell for file in `find . -maxdepth 1 -name '*.tex' -type f -printf "%f\n"| sed 's/\..*/\.pdf/'`; do echo "$$file "; done;)

all: $(targets)

%.pdf: %.tex
	        latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $<

clean:
	        latexmk -CA

debug:
	@echo $(targets)
