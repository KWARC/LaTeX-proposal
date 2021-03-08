%%
%% This is file `dfgreporting.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% dfgproposal.dtx  (with options: `reporting')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesPackage{dfgreporting}[2020/08/21 v1.5 DFG Project Reporting]
\DeclareOption{german}{\PassOptionsToPackage{\CurrentOption}{dfgpdata}}
\PassOptionsToClass{11pt}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{reporting}}
\ProcessOptions
\LoadClass{reporting}
\RequirePackage{eurosym}
\RequirePackage{dfgpdata}
\ifdeutsch\RequirePackage[ngerman]{babel}
\else\RequirePackage[ngerman,english]{babel}\fi
\RequirePackage[scaled=.90]{helvet}
\renewcommand{\familydefault}{\sfdefault}
\define@key{prop@gen}{reportperiod}{\def\prop@gen@reportperiod{#1}}
\define@key{prop@gen}{applareas}{\def\prop@gen@applareas{#1}}
\define@key{prop@gen}{key}{\@dmp{key=#1}%
\@ifundefined{prop@gen@keys}{\xdef\prop@gen@keys{#1}}{\xdef\prop@gen@keys{\prop@gen@keys,#1}}}
\define@key{prop@gen}{coop}{\@dmp{coop=#1}%
\@ifundefined{prop@gen@coops}{\xdef\prop@gen@coops{{#1}}}{\xdef\prop@gen@coops{\prop@gen@coops,{#1}}}}
\define@key{prop@gen}{projpapers}{\def\prop@gen@projpapers{#1}}
\newcommand\prop@assoc[2]{\let\@tmpop=\relax\@for\@I:=#2\do{\@tmpop\@I\let\@tmpop=#1}}
\newcommand\show@prop@gen@keys{\def\@cb{, }\@ifundefined{prop@gen@keys}{??:???? ?/?}{\prop@assoc\@cb\prop@gen@keys}}
\renewenvironment{prop@report}
{\ifsubmit\setcounter{page}{1}\else\thispagestyle{empty}\fi%
\begin{center}
{\LARGE \prop@gen@instrument}\\[.2cm]
{\LARGE\textbf{\prop@gen@title}}\\[.3cm]
\ifx\prop@gen@acronym\@empty\else{\LARGE Acronym: {\prop@gen@acronym}}\\[.2cm]\fi
{\large\today}\\[1em]
\edef\the@PIs{\pdataref{all}{PI}{count}}
\edef\prop@gen@PIs{\pdataref{all}{PI}{ids}}
\begin{tabular}{c*{\the@PIs}{c}}
\prop@tl\prop@gen@PIs{\pdataref@safe{PI}\tl@ext{name}}\\
\prop@tl\prop@gen@PIs{\pdataref@safe{PI}\tl@ext{affiliation}}\\
\prop@tl\prop@gen@PIs{\pdataref@safe{PI}\tl@ext{dept}}\\
\end{tabular}\\[2cm]
\end{center}
\setcounter{section}{-1}
\edef\keep@tocdepth{\value{tocdepth}}
\setcounter{tocdepth}{2}\tableofcontents
\setcounter{tocdepth}{\keep@tocdepth}
\newpage\thispagestyle{empty}
\ifdeutsch\section{Allgemeine Angaben (nur f\"ur ELAN)}\else
\section{General Information (for the ELAN system only)}\fi
\subsection{Reference Numbers}
\show@prop@gen@keys
\subsection{Report and Funding Period}
\prop@gen@reportperiod
\dfg@area@field
\subsection{Application Areas}\prop@gen@applareas
\dfgprojpapers\prop@gen@projpapers}
{}
\endinput
%%
%% End of file `dfgreporting.cls'.
