do.mwe:
	cd mwe && make all
do.slides:
	cd slides && make pdflatex main
do.workshops:
	for workshop in workshops/* ; do \
		cd $$workshop ;\
		pdflatex main && biber main && pdflatex main && pdflatex main ;\
		cd ../../ ;\
	done