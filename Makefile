
NAME=ITE_ejemplo
#NAME=a

BUILDTEXT=pdflatex $(NAME).tex
BUILDBIB=bibtex $(NAME).aux

.SUFFIXES:
.SUFFIXES: .pdf .tex
.PHONY: clean buildclean view

$(NAME).pdf: src/$(NAME).tex src/src_figs/* src/*
	mkdir -p build
	cp ./src/$(NAME).tex ./build/
	cp ./src/tb*.tex ./build/
	cp -r ./src/src_figs ./build/src_figs
	cp ./src/itecnea_ra3.sty ./build/
	cp ./src/LogoCNEA.pdf ./build/
	cp ./src/biblio.bib ./build/
	cp ./src/unsrtnat_pablo.bst ./build/
	# Compile Latex and Bibliography
	cd build; $(BUILDTEXT);	\
						$(BUILDBIB);  \
						$(BUILDTEXT); \
						$(BUILDTEXT); \
						cp $(NAME).pdf ..

clean: buildclean
	rm -f $(NAME).pdf 

buildclean:
	rm -fr build

view: $(NAME).pdf 
	evince $(NAME).pdf &

