# building tool
TEX = latex
BIB = bibtex

WRKDIR=tmp
PWD!=pwd
ENV=env \
	TEXINPUTS=".:${PWD}/:${PWD}/Styles/:${PWD}/Figures/:" \
	BIBINPUTS="${PWD}:${PWD}/Styles/:" \
	BSTINPUTS=".:${PWD}/:${PWD}/Styles/:"\
	LXDINPUTS=".:./Styles/:./Figures/:"
NAME=thesis

# documents
thesis.pdf: *.tex Figures/*.eps Styles/*.sty
	mkdir -p ${WRKDIR}
	cd ${WRKDIR}; ${ENV} ${TEX} -halt-on-error -draftmode ${NAME}
	cd ${WRKDIR}; ${ENV} ${BIB} ${NAME}
	cd ${WRKDIR}; ${ENV} ${TEX} -halt-on-error -draftmode ${NAME}
	cd ${WRKDIR}; ${ENV} ${TEX} -halt-on-error -draftmode ${NAME}
	cd ${WRKDIR}; ${ENV} ${TEX} -halt-on-error ${NAME}
	$(ENV) dvipdf -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true ./${WRKDIR}/${NAME}.dvi ${NAME}.pdf

# make latexdiff REVISION=<revision>
# --math-markup=0
latexdiff:
	mkdir -p ${WRKDIR}
	${ENV} ./Tools/latexdiff-vc --force -d ${WRKDIR} --latexdiff=./Tools/latexdiff --flatten --git -r ${REVISION} ${NAME}.tex
	cd ${WRKDIR}; ${ENV} ${TEX} -halt-on-error -draftmode ${WRKDIR}/${NAME}
	cd ${WRKDIR}; ${ENV} ${BIB} ${NAME}
	cd ${WRKDIR}; ${ENV} ${TEX} -halt-on-error -draftmode ${WRKDIR}/${NAME}
	cd ${WRKDIR}; ${ENV} ${TEX} -halt-on-error -draftmode ${WRKDIR}/${NAME}
	cd ${WRKDIR}; ${ENV} ${TEX} -halt-on-error ${WRKDIR}/${NAME}
	$(ENV) dvipdf -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true ./${WRKDIR}/${NAME}.dvi ${NAME}-latexdiff.pdf
	rm -Rf ${WRKDIR}/*


bibfilter:
	nawk -f ./Tools/bibextract/citetags.awk ${WRKDIR}/*.aux > ${WRKDIR}/bibfilter.tags
	nawk -f ./Tools/bibextract/citefind.awk ${WRKDIR}/bibfilter.tags thesis.bib > ${WRKDIR}/filtered.bib

fig:
	cd Figures; make all

# make spell FILE=chapterX.tex
spell:
	hunspell -t ${FILE}


# auxilary
clean:
	rm -Rf ${WRKDIR}/*
	rm -f *~ *.pdf
#	rm -f *.aux *.bbl *.blg *.out *.nav *.snm *.brf *.idx *.loa *.lof *.lot *.log *.toc *.dvi *.ps *.pfg *.bak *.tdo

# dummy targets
.PHONY: all clean
