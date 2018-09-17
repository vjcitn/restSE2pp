STY=*.sty
CLS=*.cls
restfulSE.pdf: restfulSE.tex $(STY) $(CLS) Bioc.bib
	pdflatex restfulSE.tex && bibtex restfulSE && pdflatex restfulSE.tex && pdflatex restfulSE.tex 
