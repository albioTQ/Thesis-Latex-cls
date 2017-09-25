\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fancy-thesis}[Alberto Soragna thesis class]
\LoadClass[12pt, oneside, letterpaper]{book}



%%%GENERAL PACKAGES REQUIRED
\RequirePackage[small, md, sc]{titlesec}
\RequirePackage[tight,nice]{units}
\RequirePackage{verbatim}
\RequirePackage{booktabs} % for much better looking tables
\RequirePackage{array} % for better arrays (eg matrices) in maths
\RequirePackage{paralist} % very flexible & customisable lists (eg. enumerate/itemize, etc.)
\RequirePackage{verbatim} % adds environment for commenting out blocks of text & for better verbatim
\RequirePackage{subfig} % make it possible to include more than one captioned figure/table in a single float
\RequirePackage{graphicx}
\RequirePackage[centertags]{amsmath}
\RequirePackage{amssymb}



% Define colors
\RequirePackage[dvipsnames]{xcolor}
\definecolor{Crimson}{rgb}{0.6471, 0.1098, 0.1882}


\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Tables}
\newcommand{\listofalgorithmes}{\tocfile{\listalgorithmcfname}{loa}}

%\raggedright

\RequirePackage{pdfsync} %do pdf synchronization 
\synctex=1 % turn synctex on automatically to sync between pdf viewer

%\usepackage[closeFloats, noSeparatorLine]{fltpage} %use the custom modified fltpage package
%\RequirePackage{afterpage} 




%Enable clickable things and set color
\RequirePackage{hyperref}
\hypersetup{
    colorlinks,
    citecolor=SeaGreen,    %color for bibliography citations
    filecolor=black,        %color for internal files
    linkcolor=Crimson,      %color for references (chapter, image, equation, note...)
    urlcolor=Crimson,       %color for URLs

}

%%This part redefines the footnote allowing to define a color for its link, different from what is defined in hypersetup
\makeatletter
\newcommand{\org@footnotemark}{}
\let\org@footnotemark\@footnotemark
\def\@footnotemark{%
  \begingroup
    \hypersetup{linkcolor=black}%
    \org@footnotemark
  \endgroup
}
\makeatother






%\RequirePackage{lettrine} % big letter at start of chapter


%%% PAGE DIMENSIONS
\RequirePackage[width=5in, letterpaper]{geometry} % to change the page dimensions
% \geometry{margin=2in} % for example, change the margins to 2 inches all round
% \geometry{landscape} % set up the page for landscape
%   read geometry.pdf for detailed page layout information
\usepackage{a4wide}



% \usepackage[parfill]{parskip} % Activate to begin paragraphs with an empty line rather than an indent

%%% HEADERS & FOOTERS
\usepackage{fancyhdr} % This should be set AFTER setting up the page geometry
\pagestyle{fancyplain}

\renewcommand{\chaptermark}[1]%
         {\markboth{\thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]%
         {\markright{\thesection\ #1}}
\lhead[\fancyplain{}{\bfseries\thepage}]%
    {\fancyplain{}{\bfseries\rightmark}}
\rhead[\fancyplain{}{\bfseries\leftmark}]%
    {\fancyplain{}{\bfseries\thepage}}
\cfoot{}

\usepackage[]{fixltx2e}
\usepackage[bottom]{footmisc}


%%% SECTION TITLE APPEARANCE
\usepackage{sectsty}
%\allsectionsfont{\sffamily\mdseries\upshape} % (See the fntguide.pdf for font help)


\RequirePackage{titling}
\RequirePackage{setspace} 

\RequirePackage[T1]{fontenc}
\RequirePackage{titlesec}

\titlespacing*{\chapter}{0}{-50 pt}{0}   %Extra space left, before, after (and optionally right) of a title

\newcommand{\chapnumfont}{%     % define font for chapter number
  \usefont{T1}{pnc}{b}{n}%      % choose New Chancery, bold, normal shape
  \fontsize{100}{100}%          % font size and vertical space between number and title
  \selectfont%                  % activate font
}
\colorlet{chapnumcol}{Crimson}  % color for chapter number

\titleformat{\chapter}[display]
{\Huge\filleft\bfseries\cmfib}
{\filleft\chapnumfont\textcolor{chapnumcol}{\thechapter}}
{-24pt}
{\Huge}

\titleformat*{\section}{\normalfont\Large\bfseries\cmfib}
\titleformat*{\subsection}{\normalfont\large\bfseries\cmfib}





%Modifiy captions (figure x.x)
\RequirePackage[labelfont={sf,bf,small},textfont={sf,small},justification=RaggedRight,margin=0pt, figurewithin=chapter, tablewithin=chapter]{caption}
\onehalfspacing
\raggedright

\parindent 12pt
\RequirePackage{mathspec}

%%% TABLE OF CONTENTS APPEARANCE
\usepackage[nottoc,notlof,notlot]{tocbibind} % Put the bibliography in the ToC

\RequirePackage{url}
\usepackage[titles,subfigure]{tocloft} % Alter the style of the Table of Contents

%%Font options for toc entries
\renewcommand{\cftchapfont}{\normalsize \scshape }
%\renewcommand{\cftsecfont}{\sffamily}
%\renewcommand{\cftsubsecfont}{\sffamily}

%%Page number fonts
\renewcommand{\cftchappagefont}{\sffamily}
\renewcommand{\cftsecpagefont}{\sffamily}
\renewcommand{\cftsubsecpagefont}{\sffamily}

%%Vertical space after toc entries
\renewcommand\cftchapafterpnum{\vskip6pt}
\renewcommand\cftsecafterpnum{\vskip6pt}
\renewcommand\cftsubsecafterpnum{\vskip6pt}

\setcounter{tocdepth}{1} %Maximum element depth appearing in toc (0 chap, 1 sec, 2 subsec, etc)
%\renewcommand{\cftdot}{} %Removes dots .... between toc entry and page number



%%%BIBLIOGRAPHY STUFF

\RequirePackage[numbers, comma, sort&compress]{natbib}
\bibliographystyle{abbrvnat}   %Stores entries in bibliography as nameinitial. surname
\setcitestyle{authoryear,open={(},close={)}}  %Cite things as (author et  al., year) 
\RequirePackage{har2nat}
%\RequirePackage[backend=bibtex8, style=authoryear,dashed=false]{biblatex}


\RequirePackage{bibentry} %   list an entire bibliography entry inline. Useful for acknowledging when my paper was previously published
\renewcommand\bibname{References}
\nobibliography*        


%%%Algorithm pseudocode properties

\usepackage{algorithm2e}
\RestyleAlgo{boxruled}
\IncMargin{1em}
\LinesNumbered


% some definitions
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}


%\renewcommand{\maketitle}{ 
%	\singlespacing
%	\thispagestyle{empty}
%	\vspace*{\fill} \vspace{150pt} \begin{center}
%	\Huge \textcolor{Crimson}{\textit{\thetitle}} \normalsize \\ \sc \vspace{100pt}
%	a dissertation presented \\ by\\
%	\theauthor\\ to\\ The \@department\\ 
%	\vspace{12pt}
%	in partial fulfillment of the requirements\\ 
%	for the degree of\\ \@degree\\ 
%	in the subject of\\ \@field\\
%	\vspace{12pt}
%	\@university\\ \@universitycity, \@universitystate\\ 
%	\@degreemonth\ \@degreeyear
%	\end{center} \vspace*{\fill}
%}

% You might also consider licensing your work under Creative Commons). See: http://creativecommons.org/weblog/entry/12824 
\newcommand{\copyrightpage}{
	\newpage \thispagestyle{empty} \vspace*{\fill}
	\sc \noindent \copyright~\textit{\@degreeyear \hspace{3pt}~- \theauthor} \\
	\noindent All rights reserved.
	\vspace*{\fill} \newpage \rm
}

\newcommand{\abstractpage}{
	\newpage
	\pagenumbering{roman}
	\setcounter{page}{3}
	\pagestyle{fancy}
	\lhead{Thesis advisor: \@advisor} \rhead{\@author}
	\renewcommand{\headrulewidth}{0.0pt} 
	\begin{center}
	\vspace*{1pt}
	\Large \textcolor{Crimson}{\textit{\@title}} \normalsize\\
	\vspace*{15pt}
	\sc Abstract \\ \rm
	\end{center}
	\doublespace %Harvard registrar requests that abstract is double spaced
	\input{frontmatter/abstract}
	\doublespace %Harvard registrar requests that abstract is double spaced	
	\newpage \lhead{} \rhead{}
	\cfoot{\thepage}
	\onehalfspacing
}

\newcommand{\dedicationpage}{
	\pagestyle{fancy}
	\newpage \thispagestyle{fancy} \vspace*{\fill}
	\sc \noindent \input{frontmatter/dedication}
	\vspace*{\fill} \newpage \rm
	}

% the list of authors
\newcommand{\authorlist}{
	\pagestyle{fancy}
	\newpage
	\thispagestyle{fancy} 
	\chapter*{Author List}
	\noindent \input{frontmatter/authorlist}
	\newpage \rm
	}

% the acknowledgments page
\newcommand{\acknowledgments}{
	\chapter*{Acknowledgments}
	\noindent
	\input{frontmatter/thanks}
	\vspace*{\fill} 
	\newpage
	\setcounter{page}{1}
	\pagenumbering{arabic}}
	
% An environment for paragraph-style section
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}}
