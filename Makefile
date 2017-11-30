.PHONY: all clean

targets=$(shell for file in `find . -maxdepth 1 -type f -o -type l -name '*.tex' -printf "%f\n"| sed 's/\..*/\.pdf/'`; do echo "$$file "; done;)
dirs := .
files := $(foreach dir,$(dirs),$(wildcard $(dir)/*))
files := $(wildcard *)

all: $(targets)

%.pdf: %.tex
	        latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $<

clean:
	        latexmk -CA

deploy:
	echo $(shell basename $(CURDIR))/.git >> ../.gitignore
	-@[ -e "../main.tex" ] && mv -f ../main.tex ../main.backup.tex; \
	cd ..; \
	$(foreach file, $(files), ln -s $(shell basename $(CURDIR))/$(file) $(file);)


debug:
	@echo $(targets)
