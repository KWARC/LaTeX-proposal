%%
%% This is file `dfgproposal.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% dfgproposal.dtx  (with options: `cls')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{dfgproposal}[2020/08/21 v1.5 DFG Proposal]
\newif\ifgeneral\generalfalse
\DeclareOption{general}{\generaltrue}
\DeclareOption{german}{\PassOptionsToPackage{\CurrentOption}{dfgpdata}}
\PassOptionsToClass{11pt}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{proposal}}
\ProcessOptions
\LoadClass{proposal}
\RequirePackage{eurosym}
\RequirePackage{dfgpdata}
\ifdeutsch\RequirePackage[ngerman]{babel}
\else\RequirePackage[ngerman,english]{babel}\fi
\RequirePackage[scaled=.90]{helvet}
\renewcommand{\familydefault}{\sfdefault}
\newenvironment{sitedescription}[2][]%
{\def\@test{#1}\def\@@title{\ifx\@test\@empty\pdataref{site}{#2}{acronym}\else #1\fi:
\textsc{\pdataref{site}{#2}{name}}}
\@for\@I:=#2\do{\pdata@target{site}\@I{}}\subsubsection\@@title}
{}
\renewenvironment{prop@proposal}
{\ifsubmit\setcounter{page}{1}\else\thispagestyle{empty}\fi
\begin{center}
{\LARGE \prop@gen@instrument}\\[.2cm]
{\LARGE\textbf{\prop@gen@title}}\\[.3cm]
\ifx\prop@gen@acronym\@empty\else{\LARGE Acronym: {\prop@gen@acronym}}\\[.2cm]\fi
{\large\today}\\[1em]
\begin{tabular}{c*{\the@PIs}{c}}
\prop@tl\prop@gen@PIs{\pdataref@safe{PI}\tl@ext{name}}\\
\prop@tl\prop@gen@PIs{\pdataref@safe{PI}\tl@ext{affiliation}}\\
\prop@tl\prop@gen@PIs{\pdataref@safe{PI}\tl@ext{dept}}\\
\end{tabular}\\[2cm]
\end{center}
\ifgeneral
\ifsubmit\else
\setcounter{section}{-1}
\edef\keep@tocdepth{\value{tocdepth}}
\setcounter{tocdepth}{2}\tableofcontents
\setcounter{tocdepth}{\keep@tocdepth}
\newpage\thispagestyle{empty}
\ifdeutsch\section{Allgemeine Angaben (nur f\"ur ELAN)}\else
\section{General Information (for the ELAN system only)}\fi
\dfg@topic
\dfg@area@field
\ifdeutsch\subsection{Voraussichtliche Gesamtdauer}\else
\subsection{Anticipated total duration \deu{(Voraussichtliche Gesamtdauer)}}
\fi% ifdeutsch
\@ifundefined{prop@gen@totalduration}{????}{\prop@gen@totalduration};
\ifdeutsch
\@ifundefined{prop@gen@since}{Erstantrag}{Fortsetungsantrag, das Project l\"auft seit
  \prop@gen@since.}
\else
\@ifundefined{prop@gen@since}{initial proposal}{continuation proposal, the project started
  \prop@gen@since.}
\fi%ifdeutsch
\ifdeutsch
\subsection{Schl\"usselw\"orter}\prop@gen@Dkeywords
\else\subsection{Keywords}\prop@gen@keywords
\fi
\ifdeutsch\subsection{Antragszeitraum}\else
\subsection{Application period \deu{(Antragszeitraum)}}\fi
\prop@gen@months\quad Months starting \prop@gen@start
\@ifundefined{prop@gen@fundsuntil}{}
{ (\ifdeutsch Mittel reichen bis\else funds last until\fi\ \prop@gen@fundsuntil)}
\ifdeutsch\else\selectlanguage{english}\fi
\newpage
\setcounter{page}{0}%
\fi\fi}% ifsubmit ifgeneral
{}
\ifdeutsch
\def\prop@warnpubs@message{Viele der Publikationen der Antragsteller sind verf\"ugbar unter folgenden URLs:}
\def\prop@warnpubs@title{Literatur}
\fi
\newcommand\attachments{\ifdeutsch\section{Verzeichnis der Anlagen}\else
\section{List of Attachments \deu{(Verzeichnis der Anlagen)}}\fi
\begin{itemize}
\@for\@I:=\prop@gen@PIs\do{%
 \item\ifdeutsch Lebenslauf und Publikatinsverzeichnis\else Curriculum Vitae and list of publications for \fi
   \pdataref{PI}\@I{title}\pdataref{PI}\@I{name}}
\end{itemize}}
\ifgeneral
\newenvironment{Zusammenfassung}{\thispagestyle{empty}\subsection{Zusammenfassung}\begin{otherlanguage}{ngerman}}
{\end{otherlanguage}\newpage\setcounter{page}1}
\newenvironment{Summary}{\thispagestyle{empty}\subsection{Summary}}
{\newpage\setcounter{page}1}
\else
\excludecomment{Summary}
\excludecomment{Zusammenfassung}
\fi
\endinput
%%
%% End of file `dfgproposal.cls'.
