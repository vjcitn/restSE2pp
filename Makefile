STY=*.sty
CLS=*.cls
restfulSE.pdf: restfulSE.tex $(STY) $(CLS)
	pdflatex restfulSE.tex && bibtex restfulSE && pdflatex restfulSE.tex && pdflatex restfulSE.tex 
