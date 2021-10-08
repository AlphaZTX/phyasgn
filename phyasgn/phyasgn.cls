\NeedsTeXFormat{LaTeX2e}
\RequirePackage{xkeyval,expl3,xparse}
\ProvidesClass{phyasgn}[2021/09/30 v0.2b PKU-PHY assignment class]
\LoadClass[11pt]{article}

\RequirePackage{xeCJK}
\RequirePackage[zihao=false]{ctex}
\ctexset{
  contentsname = {\hfil 目\hspace{0.8em}录},
  punct=kaiming,
}

\RequirePackage{graphicx}
\RequirePackage{amsmath}

\define@boolkey{phyasgn}[phyasgn@opt@]{asgnnum}[true]{}

\define@key{phyasgn}{stunum}[0000000000]{\gdef\phyasgn@opt@stunum{#1}}
\define@key{phyasgn}{stuname}[学生姓名]{\gdef\phyasgn@opt@stuname{#1}}
\define@key{phyasgn}{classname}[课程名]{\gdef\phyasgn@opt@classname{#1}}
\define@key{phyasgn}{setasgnnum}[0]{\gdef\phyasgn@opt@setasgnnum{#1}}

\setkeys{phyasgn}{
  stunum={{\sffamily xxxxx}11{\sffamily xxx}},
  stuname={\texttt{学生姓名}},
  classname=课程,
  setasgnnum={\texttt{NULL}},
  asgnnum=true,
}%

\newcommand{\phyasgn}[1]{\setkeys{phyasgn}{#1}}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\parindent}%
                                                 {0em}%
                                                 {-1em}%
                                                 {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                                 {0em}%
                                                 {-1em}%
                                                 {\normalfont\normalsize\itshape}}

\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\geometry{a4paper,left=3cm,right=3cm,headheight=30pt,top=3.6cm,bottom=3cm,footnotesep=1.6em}
  \renewcommand*{\headrulewidth}{0.8pt}
  % foot
  \fancyfoot[C]{}
  % head --- L
  \fancyhead[L]
  {\begin{tabular}[b]{@{}l@{}}
    \includegraphics[height=2.12em]{phylogo.pdf}
  \end{tabular}}
  % head --- C
  \fancyhead[C]
  {\begin{tabular}[b]{@{}c@{}}
    \large 
    \ifphyasgn@opt@asgnnum
      第~\phyasgn@opt@setasgnnum~次课程作业
    \else
      课~~程~~作~~业
    \fi
    \\[-2pt]
    {\scriptsize 姓名:~\phyasgn@opt@stuname\quad 学号:~\phyasgn@opt@stunum}
  \end{tabular}}
  % head --- R
  \fancyhead[R]
  {\begin{tabular}[b]{@{}r@{}}
    {\small 第~\thepage~页, 共~\pageref{LastPage}~页}\\[-2pt]
    {\scriptsize \phyasgn@opt@classname}
  \end{tabular}}
\pagestyle{fancy}





\makeatletter
% 设置标题格式
\renewcommand*\maketitle{%
    \begin{center}
        {\bfseries\LARGE\@title \par}
        \vskip 0.5em
        \@author\par%{\global\let\author\@empty}
        \@date%{\global\let\date\@empty}%
        \thispagestyle{fancy}
    \end{center}
    \@thanks
    \setcounter{footnote}{0}
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
}
% 设置目录格式, 其他的禁止修改, 否则ztx就要生气了!!!
\let\TableOfContents\tableofcontents
\renewcommand\tableofcontents{\TableOfContents\par\vspace{1.2em}}
% 设置摘要格式
\renewcommand\abstractname{摘\hspace{0.6em}要}
\makeatother

\RequirePackage{tcolorbox}
\newtcbox{FootnoteBox}{arc = 0pt, outer arc = 0pt,
colback = white, colframe = black,
boxsep = 0pt, left = 0.2ex, right = 0.2ex, top = 0.1ex, bottom = 0.2ex,
boxrule = 0.4pt}
\renewcommand\thefootnote{\FootnoteBox{\arabic{footnote}}}
\usepackage[perpage]{footmisc}

\RequirePackage{enumitem}
\setlist[enumerate]{topsep=0.25em,labelwidth=2em,labelsep=0.25em,leftmargin=0em,itemindent=4em,listparindent=2em,parsep=0em}
\renewcommand\labelenumi{\makebox[1.75em][l]{\textbf{\theenumi.}}}
\renewcommand\theenumii{\arabic{enumii}}
\renewcommand\labelenumii{\makebox[1.75em][l]{(\theenumii)}}
\renewcommand\theenumiii{\roman{enumiii}}
\renewcommand\labelenumiii{\makebox[1.75em][l]{\theenumiii.}}
\renewcommand\theenumiv{\roman{enumiv}}
\renewcommand\labelenumiv{\makebox[1.75em][l]{(\theenumiv)}}
\setlist[itemize]{topsep=\parskip,labelwidth=0.5em,labelsep=0.5em,leftmargin=0em,itemindent=3em,listparindent=2em,parsep=0em}

\RequirePackage{multicol}
\setlength{\columnseprule}{0.5pt}
\setlength{\columnsep}{2em}
\RequirePackage[toc]{multitoc}

\newenvironment{sol}{\par\textbf{解}\hspace{1em}\ignorespaces}{}
\newenvironment{pf}{\par\textbf{证明}\hspace{1em}\ignorespaces}{\hfill\rule{0.7em}{0.7em}}



\DeclareSymbolFont{lettersA}{U}{txmia}{m}{it}
\DeclareMathSymbol{\alphaup}{\mathord}{lettersA}{11}
\DeclareMathSymbol{\betaup}{\mathord}{lettersA}{12}
\DeclareMathSymbol{\gammaup}{\mathord}{lettersA}{13}
\DeclareMathSymbol{\deltaup}{\mathord}{lettersA}{14}
\DeclareMathSymbol{\epsilonup}{\mathord}{lettersA}{15}
\DeclareMathSymbol{\zetaup}{\mathord}{lettersA}{16}
\DeclareMathSymbol{\etaup}{\mathord}{lettersA}{17}
\DeclareMathSymbol{\thetaup}{\mathord}{lettersA}{18}
\DeclareMathSymbol{\iotaup}{\mathord}{lettersA}{19}
\DeclareMathSymbol{\kappaup}{\mathord}{lettersA}{20}
\DeclareMathSymbol{\lambdaup}{\mathord}{lettersA}{21}
\DeclareMathSymbol{\muup}{\mathord}{lettersA}{22}
\DeclareMathSymbol{\nuup}{\mathord}{lettersA}{23}
\DeclareMathSymbol{\xiup}{\mathord}{lettersA}{24}
\DeclareMathSymbol{\piup}{\mathord}{lettersA}{25}
\DeclareMathSymbol{\rhoup}{\mathord}{lettersA}{26}
\DeclareMathSymbol{\sigmaup}{\mathord}{lettersA}{27}
\DeclareMathSymbol{\tauup}{\mathord}{lettersA}{28}
\DeclareMathSymbol{\upsilonup}{\mathord}{lettersA}{29}
\DeclareMathSymbol{\phiup}{\mathord}{lettersA}{30}
\DeclareMathSymbol{\chiup}{\mathord}{lettersA}{31}
\DeclareMathSymbol{\psiup}{\mathord}{lettersA}{32}
\DeclareMathSymbol{\omegaup}{\mathord}{lettersA}{33}
\DeclareMathSymbol{\varepsilonup}{\mathord}{lettersA}{34}
\DeclareMathSymbol{\varthetaup}{\mathord}{lettersA}{35}
\DeclareMathSymbol{\varpiup}{\mathord}{lettersA}{36}
\DeclareMathSymbol{\varrhoup}{\mathord}{lettersA}{37}
\DeclareMathSymbol{\varsigmaup}{\mathord}{lettersA}{38}
\DeclareMathSymbol{\varphiup}{\mathord}{lettersA}{39}
\def\upalpha{\ensuremath{\alphaup}}
\def\upbeta{\ensuremath{\betaup}}
\def\upgamma{\ensuremath{\gammaup}}
\def\updelta{\ensuremath{\deltaup}}
\def\upepsilon{\ensuremath{\epsilonup}}
\def\upzeta{\ensuremath{\zetaup}}
\def\upeta{\ensuremath{\etaup}}
\def\uptheta{\ensuremath{\thetaup}}
\def\upiota{\ensuremath{\iotaup}}
\def\upkappa{\ensuremath{\kappaup}}
\def\uplambda{\ensuremath{\lambdaup}}
\def\upmu{\ensuremath{\muup}}
\def\upnu{\ensuremath{\nuup}}
\def\upxi{\ensuremath{\xiup}}
\def\uppi{\ensuremath{\piup}}
\def\uprho{\ensuremath{\rhoup}}
\def\upsigma{\ensuremath{\sigmaup}}
\def\uptau{\ensuremath{\tauup}}
\def\upupsilon{\ensuremath{\upsilonup}}
\def\upphi{\ensuremath{\phiup}}
\def\upchi{\ensuremath{\chiup}}
\def\uppsi{\ensuremath{\psiup}}
\def\upomega{\ensuremath{\omegaup}}
\def\upvarepsilon{\ensuremath{\varepsilonup}}
\def\upvartheta{\ensuremath{\varthetaup}}
\def\upvarpi{\ensuremath{\varpiup}}
\def\upvarrho{\ensuremath{\varrhoup}}
\def\upvarsigma{\ensuremath{\varsigmaup}}
\def\upvarphi{\ensuremath{\varphiup}}

\def\const{\ensuremath{\mathrm{const}}}

\RequirePackage{amsfonts}
\def\R{\mathbb{R}}
\def\C{\mathbb{C}}
\def\Z{\mathbb{Z}}
\def\N{\mathbb{N}}
\def\Q{\mathbb{Q}}
\def\e{\mathrm{e}}
\def\oldRe{\Re}
\def\oldIm{\Im}

% i 和 j
\let\iWithoutDot\i
\let\i\relax
\def\i
{
  \ifmmode\mathrm{i}
  \else\iWithoutDot
  \fi
}

\let\jWithoutDot\j
\let\j\relax
\def\j
{
  \ifmmode\mathrm{j}
  \else\jWithoutDot
  \fi
}



\newcommand\open{\mathopen{}\mathclose\bgroup\left}
\newcommand\close{\aftergroup\egroup\right}

\def\diff{\mathrm{d}}
\def\dif{\mathop{}\hphantom{\mskip-\thinmuskip}\mathrm{d}}%
\let\daccent\d
\let\d\relax
\newcommand\d{\ifmmode\dif\else\expandafter\daccent\fi}
\DeclareDocumentCommand\dx{}{\ensuremath{\dif x}}
\DeclareDocumentCommand\dy{}{\ensuremath{\dif y}}
\DeclareDocumentCommand\dz{}{\ensuremath{\dif z}}
\DeclareDocumentCommand\dt{}{\ensuremath{\dif t}}

\DeclareDocumentCommand\tdv{ m m }{\mathrm{d}#1/\mathrm{d}#2}
\DeclareDocumentCommand\dv{ m m }{\frac{\mathrm{d}#1}{\mathrm{d}#2}}



\everymath{\displaystyle}
\setlength{\lineskip}{4pt}
\setlength{\lineskiplimit}{2pt}
\endinput
