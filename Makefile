STY=*.sty
CLS=*.cls
restfulSE.pdf: restfulSE.tex $(STY) $(CLS) BioC.bib fig1.tex fig2.tex
	pdflatex restfulSE.tex && bibtex restfulSE && pdflatex restfulSE.tex && pdflatex restfulSE.tex 
