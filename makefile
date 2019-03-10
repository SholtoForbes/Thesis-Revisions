filename=thesis

pdf:
	# $(MAKE) create-figures
	pdflatex ${filename}.tex
	makeindex ${filename}.nlo -s nomencl.ist -o ${filename}.nls
	biber ${filename}.bcf
	pdflatex ${filename}.tex
	pdflatex ${filename}.tex

quick:
	pdflatex ${filename}.tex

quick2:
	pdflatex ${filename}.tex
	pdflatex ${filename}.tex

quickf:
	$(MAKE) create-figures
	pdflatex ${filename}.tex

ref:
	$(MAKE) quick
	biber ${filename}.bcf
	$(MAKE) quick2

clean:
	rm -f 	${filename}.aux \
			${filename}.bcf \
			${filename}.bbl \
			${filename}.blg \
			${filename}.ilg \
			${filename}.lof \
			${filename}.log \
			${filename}.lot \
			${filename}.nlo \
			${filename}.nls \
			${filename}.out \
			${filename}.pdf \
			${filename}.run.xml \
			${filename}.toc
	$(MAKE) delete-figures

delete-converted-images:
	rm -f ./figures/chapter4/2D-cavity-simulations-eps-converted-to.pdf
	rm -f ./figures/chapter4/front-view-eps-converted-to.pdf
	rm -f ./figures/chapter4/side-view-eps-converted-to.pdf
	rm -f ./figures/chapter4/side-view-eps-converted-to.pdf
	rm -f ./figures/chapter4/side-view-eps-converted-to.pdf
	rm -f ./figures/chapter4/fuel-off-xtp-eps-converted-to.pdf
	rm -f ./figures/chapter4/fuel-on-xtp-eps-converted-to.pdf
	rm -f ./figures/chapter4/RESTC-schematic-for-plots-eps-converted-to.pdf
	rm -f ./figures/chapter4/engine-schematic-eps-converted-to.pdf
	
create-figures:
	sh create-figures.sh

delete-figures:
	sh delete-figures.sh

view:
	evince ${filename}.pdf &

pack-up:
	$(MAKE) clean
	$(MAKE) delete-converted-images
