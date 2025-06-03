\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{slides}
[2023/02/23 v0.0.1 custom beamer sub-class]
% options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=slides,prefix=slides@}
\DeclareStringOption[]{logo}
\DeclareStringOption[000000]{color}
\DeclareStringOption[1.2]{stretch}
\DeclareBoolOption[true]{sectionslide}
\DeclareBoolOption[true]{pause}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ExecuteOptions{}
\ProcessKeyvalOptions*
\ProcessOptions\relax
\LoadClass[usepdftitle=false]{beamer}
% fonts
\RequirePackage{setspace}
\RequirePackage{newtxsf}
\RequirePackage[tabular,osf,sfdefault]{gandhi}
\RequirePackage[italic]{mathastext}
\let\obfseries\bfseries\renewcommand\bfseries{\boldmath\obfseries}
\let\oframetitle\frametitle\renewcommand{\frametitle}[1]{\oframetitle{#1}\setstretch{\slides@stretch}}
% theme
\usetheme{Malmoe}
\definecolor{slides}{HTML}{\slides@color}
\setbeamercolor*{palette primary}  {fg=white,bg=slides}
\setbeamercolor*{palette secondary}{fg=white,bg=slides}
\setbeamercolor*{palette tertiary} {fg=white,bg=slides}
\setbeamercolor*{structure}{fg=slides}
\setbeamercolor*{frametitle}{bg=black!05!white,fg=slides}
\setbeamercolor*{titlelike}{bg=black!05!white,fg=slides}
\setbeamertemplate{itemize items}[circle]
\setbeamertemplate{navigation symbols}{}
\setbeamersize{text margin left=16pt,text margin right=16pt}
\setlength{\leftmargini}{1.5em}
% headline
\ifx\slides@logo\@empty\else\addtobeamertemplate{headline}{}{%
    \llap{\includegraphics[height=\@tempdimb]{\slides@logo}}}\fi
% structure
\newcommand{\nfill}[1][1]{\hskip0pt plus #1fill}
\expandafter\def\expandafter\insertshorttitle\expandafter{\insertshorttitle\linesep\insertframenumber}
\expandafter\def\expandafter\insertshortauthor\expandafter{\insertshortauthor\linesep\@contact}
\newcommand{\linebox}[2]{\leavevmode\hbox{%
  \begin{beamercolorbox}[wd=\paperwidth,ht=2.5ex,dp=1.125ex,leftskip=3mm,rightskip=3mm]{#1 in head/foot}%
    \usebeamerfont{#1 in head/foot}\usebeamercolor[fg]{#1 in head/foot}#2
  \end{beamercolorbox}}\vskip0pt}
\ifbeamer@compress % no color or logo
  \newcommand{\linesep}{\hskip2em}
  \defbeamertemplate*{headline}{split theme sec}{\linebox{section}{%
    \insertsectionnavigationhorizontal{\dimexpr\paperwidth-6mm}{}{\linesep}}}
  \defbeamertemplate*{footline}{split theme sec}{\linebox{author}{%
    \insertshortauthor\nfill[999]\insertshorttitle}}
\else\newcommand{\linesep}{\nfill[999]}\fi
% section frame
\ifslides@sectionslide\AtBeginSection{%
  \begin{frame}\centering\begin{beamercolorbox}[center,sep=8pt]{title}
      \usebeamerfont{title}\insertsection\par%
    \end{beamercolorbox}\end{frame}}\fi
% misc
\ifslides@pause\beamerdefaultoverlayspecification{<+(1)->}\fi
\newcommand{\contact}[1]{\gdef\@contact{#1}}\contact{}
\newcommand{\paragraph}{\@ifstar{\@paragraph}{\ifslides@pause\pause\fi\@paragraph}}
\newcommand{\@paragraph}[1]{\par\textbf{#1}\par}
\newcommand{\itom}{\@ifstar{\@itom}{\ifslides@pause\pause\fi\@itom}}
\newcommand{\@itom}{\par\leavevmode%
  \hskip\dimexpr\leftmargini-\labelwidth-\labelsep
  \hbox to\labelwidth{\hss\usebeamercolor[fg]{itemize item}\usebeamertemplate{itemize item}}%
  \hskip\labelsep}
\setlength{\abovecaptionskip}{1ex}
\setlength{\belowcaptionskip}{1ex}
\frenchspacing
% TODO: enumitem?
