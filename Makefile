STY=*.sty
CLS=*.cls
all: restfulSE.pdf supplem.pdf
restfulSE.pdf: restfulSE.tex $(STY) $(CLS) BioC.bib fig1.tex fig2.tex
	pdflatex restfulSE.tex && bibtex restfulSE && pdflatex restfulSE.tex && pdflatex restfulSE.tex 
supplem.pdf: supplem.tex $(STY) $(CLS) BioC.bib fig1supp.tex fig2supp.tex fig3supp.tex
	pdflatex supplem.tex && bibtex supplem && pdflatex supplem.tex && pdflatex supplem.tex 
