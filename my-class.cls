\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my-class}
\LoadClass[12pt, twoside, a4paper]{book}


\errorcontextlines 10000

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
\RequirePackage{float}
\RequirePackage[centertags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage[T1]{fontenc}


%Redefine command for leaving a blank page at the end of chapters which do not end on the right page
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\vspace*{\fill}
\begin{center}
This page has been intentionally left blank.
\end{center}
\vspace{\fill}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}


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
    colorlinks=true,       % false: boxed links; true: colored links
    linkcolor=Crimson,          % color of internal links (change box color with linkbordercolor)
    citecolor=SeaGreen,        % color of links to bibliography
    filecolor=black,      % color of file links
    urlcolor=Crimson           % color of external links
}

%%This part redefines the footnote allowing to define a color for its link, different from what is defined in hypersetup
\newcommand{\org@footnotemark}{}
\let\org@footnotemark\@footnotemark
\def\@footnotemark{%
  \begingroup
    \hypersetup{linkcolor=black}%
    \org@footnotemark
  \endgroup
}






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


\fancypagestyle{style_text}{%
\pagestyle{fancyplain}
\renewcommand{\chaptermark}[1]{\markboth{\ifnum \c@chapter>0 \thechapter.\ ##1 \else ##1 \fi}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
\fancyhf{}

\lhead[\fancyplain{}{\bfseries\thepage}] %even left output
      {\fancyplain{}{\bfseries\rightmark}} %odd left output
\rhead[\fancyplain{}{\bfseries\leftmark}]%even right output
      {\fancyplain{}{\bfseries\thepage}}%odd right output

\cfoot{}


\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

}


\fancypagestyle{style_abstract}{%
\pagestyle{fancyplain}
	\lhead{Thesis advisor: \@advisor}
	\rhead{\@author}
	\renewcommand{\headrulewidth}{0.0pt} 
}

\usepackage[]{fixltx2e}
\usepackage[bottom]{footmisc}


%%% SECTION TITLE APPEARANCE
\usepackage{sectsty}
%\allsectionsfont{\sffamily\mdseries\upshape} % (See the fntguide.pdf for font help)


\RequirePackage{titling}
\RequirePackage{setspace} 

\RequirePackage{titlesec}

\titlespacing*{\chapter}{0 pt}{-50 pt}{5 pt}   %Extra space left, before, after (and optionally right) of a title

\newcommand{\chapnumfont}{%     % define font for chapter number
  \usefont{T1}{pnc}{b}{n}%      % choose New Chancery, bold, normal shape
  \fontsize{100pt}{100pt}%          % font size and vertical space between number and title
  \selectfont%                  % activate font
}
\colorlet{chapnumcol}{Crimson}  % color for chapter number

\titleformat{\chapter}[display]
{\Huge \filleft \bfseries }
{\filleft\chapnumfont\textcolor{chapnumcol}{\thechapter}}
{-24pt}
{\Huge}

\titleformat*{\section}{\normalfont\Large\bfseries}
\titleformat*{\subsection}{\normalfont\large\bfseries}


%Redefine how figures, equation and algorithms are cited
\newcommand{\Fig}[1]{Fig.(\ref{#1})}
\newcommand{\Eq}[1]{Eq.(\ref{#1})}
\newcommand{\Alg}[1]{Alg.(\ref{#1})}


%Modifiy captions (figure x.x)
\RequirePackage[labelfont={sf,bf,small},textfont={sf,small},justification=RaggedRight,margin=0pt, figurewithin=chapter, tablewithin=chapter]{caption}
\onehalfspacing
\raggedright

\parindent 12pt
\RequirePackage{mathspec}


\DeclareMathOperator*{\argmin}{argmin}  
\DeclareMathOperator*{\argmax}{argmax}   
\newcommand{\Mod}[1]{\ (\mathrm{mod}\ #1)}
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}

%%% TABLE OF CONTENTS APPEARANCE
\usepackage[nottoc,notlof,notlot]{tocbibind} % Put the bibliography in the ToC

\RequirePackage{url}
\usepackage[titles,subfigure]{tocloft} % Alter the style of the Table of Contents

%%Font options for toc entries
\renewcommand{\cftchapfont}{\normalfont\bfseries\normalsize \scshape }
%\renewcommand{\cftsecfont}{\sffamily}
%\renewcommand{\cftsubsecfont}{\sffamily}

%%Page number fonts
\renewcommand{\cftchappagefont}{\normalfont\bfseries\sffamily}
\renewcommand{\cftsecpagefont}{\sffamily}
\renewcommand{\cftsubsecpagefont}{\sffamily}

%%Vertical space after toc entries
\renewcommand\cftchapafterpnum{\vskip6pt}
%\renewcommand\cftsecafterpnum{\vskip6pt}
%\renewcommand\cftsubsecafterpnum{\vskip6pt}

\setcounter{tocdepth}{1} %Maximum element depth appearing in toc (0 chap, 1 sec, 2 subsec, etc)
%\renewcommand{\cftdot}{} %Removes dots .... between toc entry and page number



%%%BIBLIOGRAPHY STUFF

\RequirePackage[numbers, comma, sort&compress]{natbib}
\bibliographystyle{mybibstyle}   
\setcitestyle{authoryear,open={(},close={)}}  %Cite things as (author et  al., year) 

\RequirePackage{bibentry} %   list an entire bibliography entry inline. Useful for acknowledging when my paper was previously published
\renewcommand\bibname{References}
\nobibliography*        


%%%Algorithm pseudocode properties
\RequirePackage[resetcount,algochapter]{algorithm2e}
\RestyleAlgo{boxruled}
\IncMargin{1em}
\LinesNumbered

% some definitions
\def\thesistitle#1{\gdef\@thesistitle{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\universitylogo#1{\gdef\@universitylogo{#1}}
\def\abstract_name#1{\gdef\@abstract_name{#1}}




\renewcommand{\maketitle}{ 
	\thispagestyle{empty}

\begin{center}
	\includegraphics[scale=0.8]{\@universitylogo} \\
	\vspace{3em}
	{\large \textsc{\@department}} \\
	\vspace{2em}
	{\normalsize \@degree in} \\
	\vspace{1em}
	{\large \textsc{\@field}} \\
	\doublespacing
	\vspace{5em}
	{\Large \textbf{\@title}}
\end{center}

\vskip 2cm
\begin{center}
\begin{tabular}{c c c c c c c c}
	Advisor & & & & & & & Student \\[0.2cm]
	\large{\@advisor} & & & & & & & \large{\@author}\\[0.4cm]
	Co-Advisor & & & & & & & \\[0.2cm]
	\large{Dr. Ing. Rainer Kümmerle}& & & & & & & \\[0.2cm]
	\large{Ing. Marco Baldini} & & & & & & & \\ 
\end{tabular}
\end{center}

\vskip 1.5cm
\begin{center}
	{\normalsize Academic Year \@degreeyear}
\end{center}

\clearpage{\pagestyle{empty}}

}




% You might also consider licensing your work under Creative Commons). See: http://creativecommons.org/weblog/entry/12824 
\newcommand{\copyrightpage}{
	\newpage \thispagestyle{empty} \vspace*{\fill}
\fontsize{9pt}{11pt}\selectfont	
	
	
	
	%\sc \noindent \copyright~\textit{\@degreeyear \hspace{3pt}~- \@author} \\
	%\noindent All rights reserved.
	
	\textbf{Restriction notice}\\
\noindent
This thesis contains confidential data of the company KUKA AG and all affiliated companies after 15 et seq. At the request of the company KUKA AG and all affiliated companies after 15 et seq the present thesis is to block for a period of 3 years from public use. Publishing, copying and inspection are not permitted without prior written consent of the company KUKA Roboter GmbH, Zugspitzstraße 140, 86165 Augsburg, and the author. The final work must be made accessible only to referees and members of the examination committee.\\

\textbf{Sperrvermerk}\\
\noindent
Diese Abschlussarbeit enthält vertrauliche Daten des Unternehmens KUKA AG und alle nach dem §15 ff AktG verbundene Unternehmen. Auf Wunsch des Unternehmens KUKA AG und alle nach dem §15 ff AktG verbundene Unternehmen ist die vorliegende Abschlussarbeit für einen Zeitraum von 3 Jahren für die öffentliche Nutzung zu sperren. Veröffentlichung, Vervielfältigung und Einsichtnahme sind ohne vorherige schriftliche Zustimmung des Unternehmens Roboter GmbH, Zugspitzstraße 140, 86165 Augsburg und des Verfassers/der Verfasserin nicht gestattet. Die Abschlussarbeit ist nur den Gutachtern und den Mitgliedern des Prüfungsausschusses zugänglich zu machen.
	\vspace*{\fill} \newpage \rm
}



\newcommand{\abstractpage}[1]
{
	\newpage
	%\pagenumbering{roman}	
	\begin{center}
	\vspace*{1pt}
	\Large \textcolor{Crimson}{\textit{\@title}} \normalsize\\
	\vspace*{15pt}
	\sc \@abstract_name \\ \rm
	\end{center}
	\doublespace 
	\input{#1}
	\doublespace 
	%\newpage \lhead{} \rhead{}
	%\cfoot{\thepage}
	\onehalfspacing
	\clearpage
%\fancyhf{}

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
