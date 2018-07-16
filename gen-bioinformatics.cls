%% Class for OUP journal BIOINFORMATICS
%% File Name: gen-bioinformatics.cls
%%-----------------------------------------------------------------
%% Oct 20, 1999/ ver. 1.0 
%%-----------------------------------------------------------------
%% Focal Image 
%% Class for OUP journal BIOINFORMATICS
%%
%% 1.  Oct 20, 1999 two column implemented
%% 2.  Oct 20, 1999 footnote problems fixed
%% 3.  Oct 20, 1999 Space and hyphenation issues fixed
%% 4.  Oct 20, 1999 Floats redefined so as to appear at top or bottom
%% 5.  Oct 29, 1999 Fontsize in Figures  changed to 8.5/11
%% 6.  Oct 29, 1999 Added 2pt more to the space between baseline of header and rule
%% 7.  Oct 29, 1999 Extra space before subabstract removed
%% 8.  Oct 29, 1999 All the rules in tables changed to .5pt
%% 9.  Oct 29, 1999 Application notes have been made an option
%% 10. Dec 01, 1999 tablesfont changed to 9/11 (was 8/10)
%% 11. Dec 01, 1999 parskip reduced to 0pt from 0pt plus 1pt
%% 12. Dec 14. 1999 changed the tablefont to 8/10
%% 13. Dec 14. 1999 implemented the \tabcaption and \figcaption to have
%%		 						 different fonts in tablecaption ( fontsize 8/10)
%%		 						 and figurecaption ( fontsize 8.5/11).
%%
%% 14. Jan 16, 2000 Added header footer styles for Acknowledgements,
%%                  Subject Index and Author Index.
%% 15. Jan 17, 2000 \normalsize and \enumerate redefined by Kim Roberts
%% 16. Jan 17, 2000 \etal macros have been modified to keep it as roman
%%                  in headers (as per the advice of Kim)
%% 17. Jan 18, 2000 Changed "received" to Received
%% 
\NeedsTeXFormat{LaTeX2e}[1995/12/01 BIOINFORMATICS] 
\ProvidesClass{gen-bioinformatics}
\RequirePackage[final]{graphicx}
\RequirePackage{color}
\let\@style\@empty
\newif \if@@letter
\newif \if@@review
\newif \if@@contents \@@contentsfalse
\newif \if@@ackn     \@@acknfalse
\newif \if@@author     \@@authorfalse
\newif \if@@subject     \@@subjectfalse
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{applications}{\gdef\@style{APPLICATIONS NOTE}}
\DeclareOption{ontology}{\gdef\@style{ONTOLOGY}}
\DeclareOption{discovery}{\gdef\@style{DISCOVERY NOTE}}
\DeclareOption{contents}{\gdef\@style{CONTENTS}\@twocolumnfalse\@@contentstrue}
\DeclareOption{acknowledgements}{\gdef\@style{ACKNOWLEDGEMENTS}\@twocolumnfalse\@@contentstrue}
\DeclareOption{authorindex}{\gdef\@style{AUTHOR INDEX}\@twocolumnfalse\@@contentstrue}
\DeclareOption{subjectindex}{\gdef\@style{SUBJECT INDEX}\@twocolumnfalse\@@contentstrue}
\DeclareOption{editorial}{\gdef\@style{Editorial}}
\DeclareOption{declare}{\gdef\@style{Announcements}}
\DeclareOption{letter}{\gdef\@style{Correspondence}\@@lettertrue}
\DeclareOption{report}{\gdef\@style{Case report}}
\DeclareOption{obituary}{\gdef\@style{Obituary}}
\DeclareOption{abstracts}{\gdef\@style{Abstracts}}
\DeclareOption{short}{\gdef\@style{Short Communication}}
\DeclareOption{reviews}{\gdef\@style{Review}\@@reviewtrue}
\DeclareOption{review}{\gdef\@style{Book Reviews}\@@reviewtrue}
\newcounter{bioinformatics@status}
\setcounter{bioinformatics@status}{0}
  \DeclareOption{draft}{\setlength\overfullrule{5pt}\setcounter{bioinformatics@status}{0}}
  \DeclareOption{proof}{\setlength\overfullrule{5pt}\setcounter{bioinformatics@status}{1}}
  \DeclareOption{crc}{\setlength\overfullrule{0pt}\setcounter{bioinformatics@status}{2}}
  \DeclareOption{final}{\setlength\overfullrule{0pt}\setcounter{bioinformatics@status}{3}}
\newif \if@@old\@@oldfalse
\DeclareOption{old}{\@@oldtrue}
\ifnum\thebioinformatics@status=3
    \def\query#1#2{#2}
\else
	\ifnum\thebioinformatics@status=0
  	\def\query#1#2{\marginpar{\fontsize{6.5pt}{6.5pt}\itshape\rmfamily
    #1\vss}{#2}}
	\else
		\ifnum\thebioinformatics@status=1
  		\def\query#1#2{\marginpar{\fontsize{6.5pt}{6.5pt}\itshape\rmfamily
    	#1\vss}{#2}}
		\else
			\ifnum\thebioinformatics@status=2
  			\def\query#1#2{#2}
			\else
				\ifnum\thebioinformatics@status=3
  				\def\query#1#2{#2}
				\fi%
			\fi%
		\fi
	\fi
\fi
%
\DeclareOption{mathptm}{%
  \def\BIOINFORMATICS@fonts{\RequirePackage{times,mathptm}}%
  \renewcommand{\ttdefault}{cmtt}}
\DeclareOption{mathtime}{%
  \def\BIOINFORMATICS@fonts{\RequirePackage[nofontinfo,mtbold]{mathtime}%
  %\DeclareTextComposite{\r}{OT1}{A}{129} %as per  kim 
  \renewcommand{\ttdefault}{cmtt}}}
\DeclareOption{cmfonts}{%
  \let\BIOINFORMATICS@fonts\relax}
\ExecuteOptions{cmfonts,final}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[a4paper,10pt,twoside]{article}
\ExecuteOptions{twoside}
\BIOINFORMATICS@fonts
\def\@fnsymbol#1{\ifcase#1\ensuremath{*}\or
  \ensuremath{\scriptstyle\dagger}\or
  \ensuremath{\scriptstyle\ddagger}\or
  \ensuremath{\scriptstyle\mathsection}\or
  \ensuremath{\scriptstyle\mathparagraph}\or
  \ensuremath{\scriptstyle{\|}}\or
  \ensuremath{\scriptstyle{**}}\or
  \ensuremath{\scriptstyle{\dagger\dagger}}\or
  \ensuremath{\scriptstyle{\ddagger\ddagger}}\or
  \ensuremath{\scriptstyle{\mathsection\mathsection}}\or
  \ensuremath{\scriptstyle{\mathparagraph\mathparagraph}}
  \else\@ctrerr\fi%
}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{10.5}{12}
  \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
	\normalsize
\newcommand\titlefont{%
  \@setfontsize\titlefont{16}{21}}
%******* please substitute the {phv} with corresponding 
% ****** font family name in mac.
\newcommand\authorfont{%
  \fontfamily{phv}\fontsize{13}{15}\selectfont\itshape}
%
%******* please substitute the {phv} with corresponding 
% ****** font family name in mac.
\newcommand\addressfont{%
  \fontfamily{phv}\fontsize{10}{12}\selectfont\itshape}
\newcommand\receivedfont{%
  \@setfontsize\receivedfont{8}{9}\sffamily\upshape}
\newcommand\aheadsfont{%
  \@setfontsize\aheadsfont{11}{13}\sffamily\bfseries}        %new style
\newcommand\bheadsfont{%
  \@setfontsize\bheadsfont{11}{12}\rmfamily\bfseries}                %new style
\newcommand\abstractfont{%
  \@setfontsize\abstractfont{9.5}{12}\sffamily}                      %new style
\newcommand\tablesfont{%
  \@setfontsize\tablesfont{8}{10}}
%  \@setfontsize\tablesfont{9}{11}}
\newcommand\figuresfont{%
  \@setfontsize\figuresfont{9}{11}}
%	
\DeclareMathAlphabet\mathbi
  \encodingdefault\rmdefault\bfdefault\itdefault
  \let\mathbit\mathbi
%
\DeclareMathAlphabet\mathssl
  \encodingdefault\sfdefault\mddefault\sldefault
%
\DeclareMathAlphabet\mathbsl
  \encodingdefault\sfdefault\bfdefault\sldefault % pg. 177 LaTeX Companion
  \setlength\oddsidemargin  {1pc}
  \setlength\evensidemargin {1pc}
  \setlength\textheight     {55.5pc}
  \addtolength\textheight   {-8mm}%-10
  \setlength\textwidth      {42pc}
  \setlength\hoffset        {-0.5in}
  \addtolength\hoffset      {-.75pc}
  \setlength\voffset        {-0.5in}
  \addtolength\voffset      {-.5pc}
  \setlength\topmargin      {1.5pc}
  \setlength\headheight     {1.25pc}
  \setlength\headsep        {22pt}
  \setlength\footskip       {34pt}
  \setlength\topskip        {0pt}
  \setlength\marginparsep   {3pt}
  \setlength\marginparwidth {5.5pc}
  \setlength\parindent      {0.725pc}
  \setlength\columnsep      {1.5pc}
  \setlength\parskip        {0pt}
%  \multicolbaselineskip=0pt plus 0.1pt
%
\renewcommand\topfraction{1}
\renewcommand\textfraction{.1}
\renewcommand\dbltopfraction{1}
\renewcommand\dblfloatpagefraction{.95}
  \frenchspacing
%cvr3
\renewcommand{\footnoterule}{\vspace*{-3pt}%
\noindent	\rule{\columnwidth}{0.4pt}\vspace*{2.6pt}}
%
\renewcommand\thefootnote{\fnsymbol{footnote}}
\setlength{\skip\footins}{1\baselineskip}
\renewcommand{\@makefntext}[1]%
	{\noindent\makebox[.5em][l]{\@makefnmark}\rightskip0pt\leftskip0pt#1}%
\def\ps@review{%
  \def\@oddhead{%
  	\relax
    {\footnotesize\sffamily{\bfseries BOOK REVIEWS}\hfil
    \thepage}%
	}%
	\def\@evenhead{%
  	{\footnotesize\sffamily\thepage}\hfil
    {\footnotesize\sffamily\bfseries BOOK REVIEWS}%
    \relax}%
	\let\@oddfoot\@empty
	\let\@evenfoot\@empty
}
\def\ps@bioinformatics{%
  \def\@oddhead{\vbox{\hsize\textwidth\@parboxrestore%
    {\ifx\@recto\empty\else\hfill\footnotesize\sffamily%
		{\bfseries\itshape\@recto}\\[-2pt]\fi                                  %new style
    \rule{\textwidth}{.4pt}}}\relax}%
  \def\@evenhead{\vbox{\hsize\textwidth\@parboxrestore%%
    {\ifx\@verso\empty\else\footnotesize\sffamily{\bfseries\itshape\@verso}\\[-2pt]\fi  %new style
    \rule{\textwidth}{.4pt}}}\relax}%
  \def\@evenfoot{\vbox{\hsize\textwidth\@parboxrestore%
   	{\rule{\textwidth}{.4pt}\\{%
    \fontsize{9}{11}\selectfont\sffamily\textbf{\thepage}}\hfill}\relax}}                             %new style
  \def\@oddfoot{\vbox{\hsize\textwidth\@parboxrestore%
  	{\rule{\textwidth}{.4pt}\\
    {\null}\hfill{\fontsize{9}{11}\selectfont\sffamily\textbf{\thepage}}}\relax}}                    %new style
}
\def\label@firstpage{%
  \immediate\write\@auxout{\string \bibstyle{chicago}}%
  \immediate\write\@auxout{\string\gdef\string\firstpage{\thepage}}
}
\def\label@lastpage{%
  \advance\c@page\m@ne
  \immediate\write\@auxout{\string\gdef\string\lastpage{\thepage}}
  \advance\c@page\@ne
}
%%
\def\newdefinition#1{%
  \@ifnextchar[{\@odef{#1}}{\@ndef{#1}}}
\def\@ndef#1#2{%
  \@ifnextchar[{\@xndef{#1}{#2}}{\@yndef{#1}{#2}}}
\def\@xndef#1#2[#3]{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}\@newctr{#1}[#3]%
     \expandafter\xdef\csname the#1\endcsname{%
       \expandafter\noexpand\csname the#3\endcsname \@defcountersep
          \@defcounter{#1}}%
     \global\@namedef{#1}{\@prf{#1}{#2}}%
     \global\@namedef{end#1}{\@enddefinition}}}
\def\@yndef#1#2{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}%
     \expandafter\xdef\csname the#1\endcsname{\@defcounter{#1}}%
     \global\@namedef{#1}{\@def{#1}{#2}}%
     \global\@namedef{end#1}{\@enddefinition}}}
\def\@odef#1[#2]#3{%
  \@ifundefined{c@#2}{\@nocounterr{#2}}%
    {\expandafter\@ifdefinable\csname #1\endcsname
    {\global\@namedef{the#1}{\@nameuse{the#2}}%
  \global\@namedef{#1}{\@def{#2}{#3}}%
  \global\@namedef{end#1}{\@enddefinition}}}}
\def\@def#1#2{%
  \refstepcounter{#1}%
  \@ifnextchar[{\@ydef{#1}{#2}}{\@xdef{#1}{#2}}}
\def\@xdef#1#2{%
  \@begindefinition{#2}{\csname the#1\endcsname}\ignorespaces}
\def\@ydef#1#2[#3]{%
  \@opargbegindefinition{#2}{\csname the#1\endcsname}{#3}\ignorespaces}
\def\@defcounter#1{\noexpand\arabic{#1}}
\def\@defcountersep{.}
\def\@begindefinition#1#2{\trivlist
   \item[\hskip \labelsep{\indent\scshape #1\ #2.}]\rmfamily}
\def\@opargbegindefinition#1#2#3{\trivlist
      \item[\hskip \labelsep{\indent\scshape #1\ #2\ (#3).}]\rmfamily}
\def\@enddefinition{\endtrivlist}
\def\@begintheorem#1#2{\trivlist
   \item[\hskip \labelsep{\indent\scshape #1\ #2.}]\itshape}
\def\@opargbegintheorem#1#2#3{\trivlist
      \item[\hskip \labelsep{\indent\scshape #1\ #2\ (#3).}]\itshape}
\def\newproof#1{%
  \@ifnextchar[{\@oprf{#1}}{\@nprf{#1}}}
\def\@nprf#1#2{%
  \@ifnextchar[{\@xnprf{#1}{#2}}{\@ynprf{#1}{#2}}}
\def\@xnprf#1#2[#3]{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}\@newctr{#1}[#3]%
     \expandafter\xdef\csname the#1\endcsname{%
       \expandafter\noexpand\csname the#3\endcsname \@prfcountersep
          \@prfcounter{#1}}%
     \global\@namedef{#1}{\@prf{#1}{#2}}%
     \global\@namedef{end#1}{\@endproof}}}
\def\@ynprf#1#2{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}%
     \expandafter\xdef\csname the#1\endcsname{\@prfcounter{#1}}%
     \global\@namedef{#1}{\@prf{#1}{#2}}%
     \global\@namedef{end#1}{\@endproof}}}
\def\@oprf#1[#2]#3{%
  \@ifundefined{c@#2}{\@nocounterr{#2}}%
    {\expandafter\@ifdefinable\csname #1\endcsname
    {\global\@namedef{the#1}{\@nameuse{the#2}}%
  \global\@namedef{#1}{\@prf{#2}{#3}}%
  \global\@namedef{end#1}{\@endproof}}}}
\def\@prf#1#2{%
  \refstepcounter{#1}%
  \@ifnextchar[{\@yprf{#1}{#2}}{\@xprf{#1}{#2}}}
\def\@xprf#1#2{%
  \@beginproof{#2}{\csname the#1\endcsname}\ignorespaces}
\def\@yprf#1#2[#3]{%
  \@opargbeginproof{#2}{\csname the#1\endcsname}{#3}\ignorespaces}
\def\@prfcounter#1{\noexpand\arabic{#1}}
\def\@prfcountersep{.}
\def\@beginproof#1#2{\trivlist
   \item[\hskip \labelsep{\indent\scshape #1.}]\rmfamily}
\def\@opargbeginproof#1#2#3{\trivlist
      \item[\hskip \labelsep{\indent\scshape #1\ (#3).}]\rmfamily}
\def\@endproof{\endtrivlist}
\newcommand*{\qed}{\hbox{}\hfill$\Box$}
%%
\def\firstpage{0}
\def\lastpage{0}
\def\testpages{\firstpage}
\def\pagestest{\lastpage}
\def\biofont{\@setfontsize\biofont{20}{20}\itshape\bfseries\sffamily}
\def\Biofont{\@setfontsize\Biofont{22.1}{22.1}\itshape\bfseries\sffamily}
\def\BIofont{\@setfontsize\BIofont{19}{19}\itshape\bfseries\sffamily}
\def\editfont{\@setfontsize\editfont{22}{22}\itshape\bfseries\sffamily}
\def\appnote{APPLICATIONS NOTE}
\def\ontolo{ONTOLOGY}
\def\disnote{DISCOVERY NOTE}
\def\acknote{ACKNOWLEDGEMENTS}
\def\authorindex{AUTHOR INDEX}
\def\subjectindex{SUBJECT INDEX}
\def\contentnote{CONTENTS}
\def\reviews{REVIEW}
\newlength\TextWidth
\ifx\@style\contentnote
	\setlength\TextWidth{.6\textwidth}
  \else
		\ifx\@style\acknote%
 		\setlength\TextWidth{.78\textwidth}
  \else
		\ifx\@style\subjectindex%
 		\setlength\TextWidth{.78\textwidth}
  \else
  		\ifx\@style\authorindex%
 		\setlength\TextWidth{.78\textwidth}
  \else
  \setlength\TextWidth{.775\textwidth}
\fi\fi\fi\fi
%
\def\ps@title{\label@firstpage%
  \def\@oddhead{%
		\definecolor{gray20}{gray}{.8}
   	{}\hspace*{2.5pc}\begin{minipage}[c][20pt][c]{\TextWidth}
   	{\color{gray20}\biofont BIOINFORMATICS 
		\ifx\@style\contentnote\textcolor{black}{CONTENTS}\fi%
		\ifx\@style\appnote\textcolor{black}{APPLICATIONS NOTE}\fi	%
		\ifx\@style\disnote\textcolor{black}{DISCOVERY NOTE}\fi	%
		\ifx\@style\authorindex\textcolor{black}{AUTHOR INDEX}\fi	%
		\ifx\@style\subjectindex\textcolor{black}{SUBJECT INDEX}\fi	%
    \ifx\@style\acknote\textcolor{black}{ACKNOWLEDGEMENTS}\fi}%
		\end{minipage}\hfill
		\definecolor{gray20}{gray}{.8}
		%
		\ifx\@style\contentnote%
   		\begin{minipage}[t][16pt][t]{1.93in}
   		{}\normalsize\sffamily\itshape\hfill%
	 		Volume~\the@volumenumber~numbers.~\the@issuenumber~\the\year\\[3pt]
   		\end{minipage}%
		\else
    \ifx\@style\acknote%
   		\begin{minipage}[c][16pt][c]{1.93in}
   		{}\normalsize\sffamily\itshape\hfill%
	 		Volume~\the@volumenumber~numbers.~\the@issuenumber~\the\year\\[3pt]
   		\end{minipage}%
		\else
			%\begin{minipage}[c][20pt][c]{.93in}%   cvr3
			\begin{minipage}[c][20pt][c]{1.03in}
   		{}\small\sffamily\itshape\hfill%
	 		Vol.~\the@volumenumber~no.~\the@issuenumber~\the\year\par
   		{}\hfill Pages \firstpage--\lastpage
   		\end{minipage}%
		\fi\fi
	}
  \let\@evenhead\@oddhead
  \def\@oddfoot{%
    {\vbox{\hsize\textwidth\@parboxrestore
   	{\rule{\textwidth}{.8pt}\\
   	\footnotesize\sffamily\copyright\space Oxford University Press 2000%new style
    \hfill{\normalsize\sffamily\textbf{\thepage}}}}}%%new style
   	\relax%
	}%
  \let\@evenfoot\@oddfoot%
}

\def\ps@contents{\label@firstpage%
  \def\@oddhead{\parbox[t]{\textwidth}{%
		\definecolor{gray20}{gray}{.8}
   	{}\hspace*{2.5pc}\begin{minipage}[c][20pt][c]{26.5pc}%\TextWidth}
   	{\color{gray20}\biofont BIOINFORMATICS 
		\ifx\@style\contentnote\textcolor{black}{CONTENTS}\fi%
		\ifx\@style\appnote\textcolor{black}{APPLICATIONS NOTE}\fi%
		\ifx\@style\disnote\textcolor{black}{DISCOVERY NOTE}\fi}%
		\end{minipage}%\hfill
		\definecolor{gray20}{gray}{.8}
		%
		\ifx\@style\contentnote%
   		\begin{minipage}[c][15pt][b]{1.93in}
   		{}\small\sffamily\hspace*{6pt}%
	 		Volume~\the@volumenumber~number~\the@issuenumber~\the\year\par
   		\end{minipage}%
		\else
			%\begin{minipage}[c][20pt][c]{.93in}
			\begin{minipage}[c][20pt][c]{1.03in}%  cvr3
   		{}\small\sffamily\itshape\hfill%
	 		Vol.~\the@volumenumber~no.~\the@issuenumber~\the\year\par
   		{}\hfill Pages \firstpage--\lastpage
   		\end{minipage}%
		\fi\\[6pt]
  \rule{\textwidth}{.8pt}}
	}
  \let\@evenhead\@oddhead
  \def\@oddfoot{%
    {\vbox{\hsize\textwidth\@parboxrestore
   	{\rule{\textwidth}{.8pt}\\
   	\footnotesize\sffamily\copyright\space Oxford University Press%%new style
    \pagenumbering{roman}\setcounter{page}{3}
    \hfill%{\normalsize\sffamily\textbf{\thepage}}\hspace*{10pt}
    }}}%
   	\relax%
	}%
  \let\@evenfoot\@oddfoot%
}
\def\ps@AcknAuthorSubject{\label@firstpage%
  \def\@oddhead{\parbox[t]{\textwidth}{%
		\definecolor{gray20}{gray}{.8}
    {}\hspace*{2.5pc}\begin{minipage}[b][19pt][t]{\TextWidth}
   	{\color{gray20}\BIofont BIOINFORMATICS 
		\ifx\@style\acknote\textcolor{black}{ACKNOWLEDGEMENTS}\fi%
		\ifx\@style\authorindex\textcolor{black}{AUTHOR INDEX}\fi	%
		\ifx\@style\subjectindex\textcolor{black}{SUBJECT INDEX}\fi	%
		\ifx\@style\appnote\textcolor{black}{APPLICATIONS NOTE}\fi%
		\ifx\@style\disnote\textcolor{black}{DISCOVERY NOTE}\fi}%
		\end{minipage}\hfill
		\definecolor{gray20}{gray}{.8}
			\begin{minipage}[b][19pt][t]{1.05in}%  cvr3
   		{}\small\sffamily\itshape\hfill%
	 		Vol.~\the@volumenumber~no.~\the@issuenumber~\the\year\par
   		{}\hfill Pages \firstpage--\lastpage
   		\end{minipage}%
		\\[-3pt]
  \rule{\textwidth}{.8pt}}
	}
  \let\@evenhead\@oddhead
  \def\@oddfoot{%
    {\vbox{\hsize\textwidth\@parboxrestore
   	{\rule{\textwidth}{.8pt}\\
   	\footnotesize\sffamily\copyright\space Oxford University Press%%new style
     \hfill{\normalsize\sffamily\textbf{\thepage}}\hspace*{8pt}}%new style
    }}}%
  \def\@evenfoot{%
    {\vbox{\hsize\textwidth\@parboxrestore
   	{\rule{\textwidth}{.8pt}\\
   	{\normalsize\sffamily\textbf{\thepage}}%%new style
    \hfill\footnotesize\sffamily\copyright\space Oxford University Press%%new style
     }
    }}}%
	}%
%%%%%%

%\def\ps@contents{%
%  \def\@oddhead{%
%    {\vbox{\hsize\textwidth\@parboxrestore%
%    {\footnotesize\sffamily{VOLUME~\arabic{@volumenumber}}\quad%
%     {NUMBER~\arabic{@issuenumber}}\quad%
%     \@date}}}%
%    \relax
%    \relax%
%	}%
%  \let\@evenhead\@oddhead
%  \let\@evenfoot\@empty
%  \let\@evenfoot\@empty%
%}
\def\artid#1{\gdef\@artid{#1}}
\def\volume#1{\setcounter{@volumenumber}{#1}}
  \newcounter{@volumenumber}
  \setcounter{@volumenumber}{1}
\def\issue#1{\setcounter{@issuenumber}{#1}}
  \newcounter{@issuenumber}
  \setcounter{@issuenumber}{1}
\def\four@digits#1{\ifnum#1<1000 0\fi\ifnum#1<100 0\fi\ifnum#1<10 0\fi\number#1}
\def\startpage{\expandafter\four@digits{\firstpage}}
\def\pages{\addtocounter{@pages}{ \lastpage}%
  \addtocounter{@pages}{-\firstpage}%
  \two@digits{\value{@pages}}}
  \newcounter{@pages}
  \setcounter{@pages}{1}
\def\journalname#1{\gdef\@journalname{#1}}
\def\journalnumber#1{\gdef\@journalnumber{#1}}
\def\copyrightname#1{\gdef\@copyrightname{#1}}
\def\price#1{\gdef\@price{#1}}
\artid{seiz.\the\year\relax.????}
\volume{1}
\issue{1}
\journalname{Bioinformatics}
\journalnumber{1059--1311}
\copyrightname{Oxford University Press}
\price{\$12.00/0}
\let\@verso\@empty
\let\@recto\@empty
\newif\if@@head \@@headfalse
\def\verso#1{\def\@verso{\@@headtrue#1}}
\def\recto#1{\def\@recto{\@@headtrue#1}}
\newenvironment{review}{\vskip1pc%
 	{{\raggedright\noindent\large\sffamily\bfseries\@title.
  \bfseries{\raggedright\@authors\author@andorcomma%
	\relax\author@andorcomma\relax}.
  \bfseries\itshape\@address}}%
  \vskip1pc%
  {\noindent\sffamily%
  \ifx\@correspondence\@empty\else\vskip1\baselineskip\noindent
  {\raggedright\small\sffamily%
	Correspondence to: \@correspondence\par\hskip0pt}\fi%
  \par\noindent}}%
	{\setcounter{footnote}{0}%
  \global\let\@correspondence\@empty
  \gdef\address@andorcomma{\relax}
  \global\let\@address\@empty
  \global\let\address@mark\@empty
  \global\let\@thanks\@empty
  \global\let\@authors\@empty
  \global\let\@shortauthors\@authors
  \global\let\@date\@empty
  \global\let\@title\@empty}
\def\abstractname{Abstract}
	
\def\subabstract[#1]{%
	\par\addvspace{0pt}\begingroup\noindent{\sffamily\bfseries               %new style
	#1:\space\unskip}}%
\def\endsubabstract{\endgroup}

\renewenvironment{abstract}{%
  \abstractfont\noindent{\sffamily\bfseries\uppercase{Abstract}}\par}   %new style
  {\par\vskip1\baselineskip}%
\def\mcols{\begin{multicols}{2}}%
\renewcommand\section{\@startsection {section}{1}{\z@}%
  {-12pt \@plus -1.2\p@ \@minus -1.2\p@}%
  {3pt}% \@plus  .2\p@ \@minus  .2\p@}%
  {\raggedright\aheadsfont\uppercase}}                    %new style
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-9pt \@plus -1.2\p@ \@minus -1.2\p@}%
  {3pt}% \@plus  .2\p@ \@minus  .2\p@}%
  {\raggedright\bheadsfont}}%
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-8pt \@plus -0.6\p@ \@minus -0.6\p@}%
  {-1em}%
  {\raggedright\normalfont\normalsize\rmfamily\itshape}}%
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {-8pt \@plus -0.4\p@ \@minus -0.4\p@}%
  {-1em}%
  {\raggedright\normalfont\small\sffamily\itshape}}
\def\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep%
	\else%
    \advance\@itemdepth\@ne%
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter%
    \list%
    \csname\@itemitem\endcsname%
    {\leftmargin15pt\itemindent0pc\listparindent0pc%
		\def\makelabel##1{\hss\rlap{##1}\hss}}%
  \fi%
}
\let\enditemize =\endlist
\chardef\@ne=1
\chardef\tw@=2
\chardef\thr@@=3
\def\hb@xt@{\hbox to}
\def\eqnarray{%
  \stepcounter{equation}%
  \def\@currentlabel{\p@equation\theequation}%
  \global\@eqnswtrue
  \m@th
  \global\@eqcnt\z@
  \tabskip\@centering
  \let\\\@eqncr
  $$\everycr{}\halign to\displaywidth\bgroup
   \hskip\@centering$\displaystyle\tabskip\z@skip{##}$\@eqnsel
   &\global\@eqcnt\@ne\hskip 0.5\arraycolsep \hfil${##}$\hfil
   &\global\@eqcnt\tw@ \hskip 0.5\arraycolsep
   $\displaystyle{##}$\hfil\tabskip\@centering
   &\global\@eqcnt\thr@@ \hb@xt@\z@\bgroup\hss##\egroup
   \tabskip\z@skip
   \cr
}
\def\endeqnarray{%
  \@@eqncr
  \egroup
  \global\advance\c@equation\m@ne
  $$\global\@ignoretrue
}
%
\renewenvironment{figure}
               {\let\@makecaption\@figcaption\@float{figure}}
               {\end@float}
\renewenvironment{figure*}
               {\let\@makecaption\@figcaption\@dblfloat{figure}}
               {\end@dblfloat}
\renewenvironment{table}
               {\let\@makecaption\@tabcaption\@float{table}}
               {\end@float}
\renewenvironment{table*}
               {\let\@makecaption\@tabcaption\@dblfloat{table}}
               {\end@dblfloat}
%
\long\def\@caption#1[#2]#3{\par\addcontentsline{\csname
  ext@#1\endcsname}{#1}{\protect\numberline{\csname
  the#1\endcsname}{\ignorespaces #2}}
	\begingroup
    \@parboxrestore\leftskip0pt\rightskip0pt
    \footnotesize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3\strut}\par
  \endgroup}
%
\setlength\belowcaptionskip{5pt}
\setlength\abovecaptionskip{18pt}
\long\def\@tabcaption#1#2{%
  \addvspace{\abovecaptionskip}%
  {\rmfamily\tablesfont{\bfseries #1.} #2}\par
 \vskip\belowcaptionskip}%
%
\long\def\@figcaption#1#2{%
  \addvspace{\abovecaptionskip}%
  {\rmfamily\figuresfont{\bfseries #1.} #2\par} %\par% Changed by cvr3 as per kim
 \vskip\belowcaptionskip}%
%
\def\figurename{Fig.}
\newbox\BIOINFORMATICS@figbox
\setlength\arrayrulewidth{.5pt}
\def\hline{%
  \noalign{\ifnum0=`}\fi\hrule \@height \arrayrulewidth \futurelet
  \reserved@a\@xhline%
}
\def\@xhline{%
	\ifx\@tempa\hline
  	\vskip-\arrayrulewidth
  	\vskip \doublerulesep
  \fi
  \ifnum0=`{\fi}%
}
\def\@arrayparboxrestore{%
  \let\if@nobreak\iffalse
  \let\if@noskipsec\iffalse
  \let\par\@@par
  \let\-\@dischyph
  \let\'\@acci\let\`\@accii\let\=\@acciii
  \parindent\z@ \parskip\z@skip
  \everypar{}%
  \linewidth\hsize
  \@totalleftmargin\z@
  \leftskip\z@skip \rightskip0pt plus1fil \@rightskip\z@skip
  \parfillskip\@flushglue \lineskip\normallineskip
  \baselineskip\normalbaselineskip
  \sloppy}%
\newdimen \extrarowheight
\extrarowheight=0pt
\def\@tabarray{\m@th\@ifnextchar[{\seiz@array}{\seiz@array[c]}}
\def\seiz@array[#1]#2{%
	\@tempdima \ht \strutbox \advance \@tempdima by\extrarowheight
	\@tempdimb \dp \strutbox \advance \@tempdimb by\extrarowheight
	\setbox\@arstrutbox\hbox{\vrule
  \@height\arraystretch \@tempdima
  \@depth\arraystretch  \@tempdimb
  \@width\z@}\@mkpream{#2}\edef\@preamble{\halign \noexpand\@halignto
	\bgroup \tabskip\fill \@arstrut \@preamble \tabskip\z@ \cr}%
	\let\@startpbox\@@startpbox \let\@endpbox\@@endpbox
  \if #1t\vtop \else \if#1b\vbox \else \vcenter \fi\fi
  \bgroup \let\par\relax
  \let\@sharp##\let\protect\relax \lineskip\z@\baselineskip\z@\@preamble%
}

\let\OUPtabular\tabular
\def\tabular{\tablesfont\OUPtabular}
\def\@biblabel#1{\hskip0pt}
\renewenvironment{thebibliography}
  {\section*{\uppercase{\refname}
  \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
  \small%
  \list{}{\labelwidth\z@
  \leftmargin 0.725pc
  \itemsep\z@
  \itemindent-\leftmargin
  \parindent\z@
  \parsep\z@ plus .1pt\relax
  \def\newblock{\hskip .11em plus .33em minus .07em}
  \@openbib@code}\item\relax{}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m}
	{\def\@noitemerr{
	\@latex@warning{Empty 
	`thebibliography' environment}}
	\endlist}

\renewenvironment{theindex}
  {\thispagestyle{plain}
  \columnseprule \z@ \columnsep 35\p@%
  \parindent\z@
  \parskip\z@ \@plus0.3\p@\relax
  \let\item\@idxitem}
  {}
\renewcommand\@idxitem{\par\hangindent 40\p@}
\renewcommand\subitem{\@idxitem \hspace*{20\p@}}
\renewcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\renewcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\def\chem#1{$\mathrm{#1}$}
\def\mi{\mathit}
\def\cskip{\noalign{\vskip2pt}}
\let\savehline\hline
\def\topline{\noalign{\vskip3pt}\savehline\savehline\noalign{\vskip3pt}}
\def\botline{\topline}
\def\hline{\noalign{\vskip6pt}\savehline\noalign{\vskip6pt}}
\def\uc#1{\uppercase{#1}}
\def\emailfont{\tt}
\def\email#1{E-mail:~{\emailfont #1}}
\def\etal{\if@@head{\normalfont\sffamily\itshape et al.}\else\emph{et al.}\fi       %new style
    \xspace}  % 10/8/99
\def\entrydetails#1#2#3#4{
  \addtocontents{data}{\string\artid{\@artid}}
  \addtocontents{data}{\string\firstoperator{#1}}
  \addtocontents{data}{\string\secondoperator{#2}}
  \addtocontents{data}{\string\firstoperatortime{#3}}
  \addtocontents{data}{\string\secondoperatortime{#4}}%
}
\def\compdetails#1#2#3#4{
  \addtocontents{data}{\string\compoperator{#1}}
  \addtocontents{data}{\string\comptime{#2}}
  \addtocontents{data}{\string\firstoperatormis{#3}}
  \addtocontents{data}{\string\secondoperatormis{#4}}
}
\def\docdetails#1#2#3#4{
  \addtocontents{data}{\string\textgeneration{#1}}
  \addtocontents{data}{\string\tabgeneration{#2}}
  \addtocontents{data}{\string\textsourcequality{#3}}
  \addtocontents{data}{\string\tabsourcequality{#4}}
}
%  
\AtEndDocument{%\end{multicols}%
  \addtocontents{data}{\string\artid{\@artid}}
  \addtocontents{data}{\string\firstpage{\firstpage}}
  \addtocontents{data}{\protect\lastpage{\lastpage}}
  \addtocontents{data}{\string\figct{\thefigure}}
  \addtocontents{data}{\string\tabct{\thetable}}
  \renewcommand\theenumiv{\arabic{enumiv}}
  \addtocontents{data}{\string\refct{\theenumiv}}
  \clearpage\label@lastpage
}
%
%\RequirePackage{ifthen,xspace,bioinformaticstitlenov,bioinformaticsbib}
\RequirePackage{ifthen,xspace,bioinformaticstitle,bioinformaticsbib}
%\RequirePackage{ifthen,xspace,bioinformaticstitle,chicago}
\RequirePackage{natbib}
\renewcommand\refname{\uppercase{References}}

\def\bibfont{\small}
\setlength{\bibsep}{0em}
\pgstyle{title}
\titletype{1}
\let\@received\@empty
\let\@@received\@empty
\let\@revised\@empty
\let\@@revised\@empty
\let\@accepted\@empty
\let\@@accepted\@empty
\def\received#1{\ifx#1\@empty\@empty\else\gdef\@@received{Received
       on #1}\gdef\@received{#1}\fi}
\def\revised#1{\ifx#1\@empty\@empty\else\gdef\@@revised{revised
       on #1}\gdef\@revised{#1}\fi}
\def\accepted#1{\ifx#1\@empty\@empty\else\gdef\@@accepted{accepted
       on #1}\gdef\@accepted{#1}\fi}
%\def\accepted#1{\gdef\@accepted{#1}}
%\def\revised#1{\gdef\@revised{#1}}
\setcounter{secnumdepth}{0}
\def\Editorial{\thispagestyle{title}% \null\vskip 28pt
\noindent{\Large\sffamily Editorial} \vskip 6pt} %
\def\CaseReport{\thispagestyle{title}% \null\vskip 28pt 
\noindent{\Large\sffamily CASE REPORT} \vskip 6pt}

\pagestyle{bioinformatics}
\emergencystretch=30pt
\pretolerance=2000
%%%%%%% added by Kim Roberts on Jan 17, 2000
 \renewcommand\normalsize{%                                                      
    \@setfontsize\normalsize{10.5}{12}%                                          
    \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@%                              
    \abovedisplayshortskip \z@ \@plus3\p@%                                       
    \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@%                          
    \belowdisplayskip \abovedisplayskip%                                         
    \let\@listi\@listI}                                                          
 \def\enumerate{%                                                                
    \ifnum \@enumdepth >\thr@@\@toodeep\else                                     
      \advance\@enumdepth\@ne                                                    
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}%                          
        \expandafter                                                             
        \list                                                                    
          \csname label\@enumctr\endcsname                                       
          {\parsep0pt\usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}}%     
    \fi}                                                                         
                                                                                 
\endinput
%%
%% end of file 'gen-bioinformatics.cls'
