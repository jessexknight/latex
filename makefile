slides:
	cd slides && make tex
workshops:
	for workshop in workshops/* ; do \
		cd $$workshop ;\
		pdflatex main && biber main && pdflatex main && pdflatex main ;\
		cd ../../ ;\
	done
.PHONY: slides workshops
