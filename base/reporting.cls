%%
%% This is file `reporting.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% proposal.dtx  (with options: `reporting')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesPackage{reporting}[2016/04/15 v1.5 Project Reporting]
\newif\if@wpsubsection\@wpsubsectionfalse
\newif\ifsubmit\submitfalse
\newif\ifgrantagreement\grantagreementfalse
\newif\ifpublic\publicfalse
\newif\ifkeys\keysfalse
\newif\ifdelivs\delivsfalse
\newif\ifwork@areas\work@areastrue
\newif\if@RAM\@RAMfalse
\newif\if@svninfo\@svninfofalse
\newif\if@gitinfo\@gitinfofalse
\def\proposal@class{article}
\DeclareOption{wpsubsection}{\@wpsubsectiontrue}
\DeclareOption{submit}{\submittrue}
\DeclareOption{grantagreement}{\grantagreementtrue}
\DeclareOption{gitinfo}{\@gitinfotrue}
\DeclareOption{svninfo}{\@svninfotrue}
\DeclareOption{public}{\publictrue}
\DeclareOption{noworkareas}{\work@areasfalse\PassOptionsToClass{\CurrentOption}{pdata}}
\DeclareOption{RAM}{\@RAMtrue}
\DeclareOption{report}{\def\proposal@class{report}}
\DeclareOption{keys}{\keystrue}
\DeclareOption{deliverables}{\delivstrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[a4paper,twoside]{\proposal@class}
\RequirePackage{amssymb}
\RequirePackage{wasysym}
\RequirePackage{url}
\RequirePackage{graphicx}
\RequirePackage{colortbl}
\RequirePackage{xcolor}
\RequirePackage{rotating}
\RequirePackage{fancyhdr}
\RequirePackage{array}
\RequirePackage{xspace}
\RequirePackage{comment}
\AtBeginDocument{\ifpublic\excludecomment{private}\fi}
\RequirePackage{tikz}
\RequirePackage{paralist}
\RequirePackage[a4paper,margin=18mm]{geometry}
\RequirePackage{boxedminipage}
\renewcommand{\thempfootnote}{\roman{mpfootnote}}
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage[scaled=.90]{helvet}
\RequirePackage{textcomp}
\RequirePackage[hyperref=auto,style=alphabetic,defernumbers=true,backend=bibtex,backref=true,firstinits=true,maxbibnames=6]{biblatex}[2010/11-19]
\RequirePackage{csquotes}
\RequirePackage{mdframed}
\RequirePackage{pdata}
\definecolor{darkblue}{rgb}{0,0,.7}
\ifsubmit\def\prop@link@color{darkblue}\else\def\prop@link@color{blue}\fi
\RequirePackage[bookmarks=true,linkcolor=\prop@link@color,
 citecolor=\prop@link@color,urlcolor=\prop@link@color,colorlinks=true,
 breaklinks=true, bookmarksopen=true]{hyperref}
\ifsubmit
\RequirePackage[hide]{ed}
\if@svninfo\RequirePackage[final,today]{svninfo}\fi
\else
\RequirePackage[show]{ed}
\if@svninfo\RequirePackage[eso-foot,today]{svninfo}\fi
\if@gitinfo\RequirePackage[mark]{gitinfo2}\fi
\fi
\renewcommand\ednoteshape{\sl\footnotesize}
\ifpublic\excludecomment{private}\else\includecomment{private}\fi
\setcounter{secnumdepth}{3}
\newif\ifofpage\ofpagefalse
\ifgrantagreement
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.4pt}
\else
\fancyhead[RE,LO]{\prop@gen@acronym}
\fancyhfoffset{0pt}
\fi
\fancyfoot[C]{}
\newcommand\prop@of@pages[2]{page~#1\ifofpage~of~#2\fi}
\ifgrantagreement
\fancyfoot[L]{\prop@gen@proposalnumber\quad \prop@gen@acronym\quad --\quad Part B}
\fancyfoot[R]{\thepage}
\else
\fancyhead[LE,RO]{\prop@of@pages\thepage{\pdataref@num{prop}{page}{last}}}
\fi
\pagestyle{fancyplain}
\newif\if@report\@reportfalse
\newenvironment{report}[1][]%
{\@reporttrue\readpdata\jobname%
\ofpagetrue\setkeys{prop@gen}{#1}%
\pdata@open\jobname%
\@ifundefined{prop@gen@PIs}{}{\newcounter{@PIs}\@for\@I:=\prop@gen@PIs\do{\stepcounter{@PIs}}}%
\@ifundefined{prop@gen@sites}{}{\newcounter{@sites}\@for\@I:=\prop@gen@sites\do{\stepcounter{@sites}}}%
\setcounter{page}{0}%
\begin{prop@report}}
{\end{prop@report}%
\pdata@def{prop}{page}{last}{\thepage}\ofpagefalse\newpage
\printbibliography[heading=warnpubs]
\pdata@close}
\newenvironment{prop@report}
{\begin{center}
  {\LARGE Final Project Report}\\[.2cm]
  {\LARGE\textbf{\prop@gen@title}}\\[.3cm]
  {\LARGE Acronym: {\prop@gen@acronym}}\\[.2cm]
  {\large\today}\\[1em]
  \begin{tabular}{c*{\the@PIs}{c}}
    \prop@tl\prop@gen@PIs{\wa@ref3{person}\tl@ext{name}}\\
    \prop@tl\prop@gen@PIs{\wa@ref3{institution}{\wa@ref3{person}\tl@ext{affiliation}}{name}}
 \end{tabular}\\[2cm]
\end{center}
\setcounter{tocdepth}{2}\tableofcontents\newpage\setcounter{page}{1}}
{}
\newcommand\deliv@error{\PackageError{proposal}
{To use use deliverables, you have to specify the option 'deliverables'}}
\newenvironment{wpdelivs}{\begin{wp@delivs}}{\end{wp@delivs}}
\newenvironment{wp@delivs}
{\ifdelivs\textbf\deliv@legend@delivs:\\[-3ex]%
\begin{compactdesc}\else\deliv@error\fi}
{\ifdelivs\end{compactdesc}\fi}
\newcommand\deliv@legend@delivs{Deliverables}
\newenvironment{wadelivs}
{\textbf\deliv@legend@delivs:\\[-3ex]\begin{wp@delivs}}
{\end{wp@delivs}}
\newcommand\lec[1]{\strut\hfil\strut\null\nobreak\hfill\hbox{$\leadsto$#1}\par}
\newcommand\deliv@label[1]{D{#1}}
\newcommand\delivref[2]{\pdataRef{deliv}{#1@#2}{label}}
\newcommand\localdelivref[1]{\delivref{\wp@id}{#1}}
\newcommand\delivtref[2]{\delivref{#1}{#2}: \pdataRefFB{deliv}{#1@#2}{short}{title}}
\newcommand\localdelivtref[1]{\delivtref{\wp@id}{#1}}
\define@key{deliv}{id}{\def\deliv@id{#1}}
\define@key{deliv}{due}{\def\deliv@due{#1}}
\define@key{deliv}{dissem}{\def\deliv@dissem{#1}}
\define@key{deliv}{nature}{\def\deliv@nature{#1}}
\define@key{deliv}{miles}{\def\deliv@miles{#1}}
\define@key{deliv}{short}{\def\deliv@short{#1}}
\define@key{deliv}{lead}{\def\deliv@lead{#1}}
\define@key{deliv}{issue}{\def\deliv@issue{#1}}
\newcounter{deliverable}
\newcommand{\wpg@deliv}[3]{% keys, title, type
\stepcounter{deliverable}
\let\deliv@miles=\relax% clean state
\def\@type{#3}\def\@wp{wp}% set up ifx
\def\wpg@id{\csname #3@id\endcsname}
\setkeys{deliv}{#1}\stepcounter{deliv}% set state
\ifx\@type\@wp\def\current@label{\deliv@label{\ifwork@areas\thewa.\fi\thewp.\thedeliv}}
\else\def\current@label{\deliv@label{\thewa.\thedeliv}}\fi
\pdata@def{deliv}{\taskin\deliv@id\wpg@id}{label}{\current@label}
\pdata@def{deliv}{\taskin\deliv@id\wpg@id}{title}{#2}
\pdata@def{deliv}{\taskin\deliv@id\wpg@id}{page}{\thepage}%
\@ifundefined{deliv@short}
{\pdata@def{deliv}{\taskin\deliv@id\wpg@id}{short}{#2}}
{\pdata@def{deliv}{\taskin\deliv@id\wpg@id}{short}{\deliv@short}}
\@ifundefined{deliv@nature}
{\protect\G@refundefinedtrue\@latex@warning{key 'nature' for Deliv \wpg@id undefined}}
{\pdata@def{deliv}{\taskin\deliv@id\wpg@id}{nature}{\deliv@nature}}
\@ifundefined{deliv@dissem}
{\protect\G@refundefinedtrue\@latex@warning{key 'dissem' for Deliv \wpg@id undefined}}
{\pdata@def{deliv}{\taskin\deliv@id\wpg@id}{dissem}{\deliv@dissem}}
\@ifundefined{deliv@lead}
{\protect\G@refundefinedtrue\@latex@warning{key 'lead' for Deliv \wpg@id  undefined}}
{\pdata@def{deliv}{\taskin\deliv@id\wpg@id}{lead}{\deliv@lead}}
\@ifundefined{deliv@due}{}{%
\@ifundefined{deliv@issue}{}{\pdata@def{deliv}{\taskin\deliv@id\wpg@id}{issue}{\deliv@issue}}
\@for\@I:=\deliv@due\do{\protected@write\wpg@delivs{}{\string\deliverable%
{\ifnum\@I<10 0\@I\else\@I\fi}% sort key
{\@I}% due date
{\current@label}% label
{\@ifundefined{deliv@id}{??}{\taskin\deliv@id\wpg@id}}% id
{\@ifundefined{deliv@dissem}{??}{\deliv@dissem}}% dissemination level
{\@ifundefined{deliv@nature}{??}{\deliv@nature}}% nature
{#2}
{\ifx\@type\@wp{WP\ifwork@areas\thewa.\fi\thewp}\else{WA\thewa}\fi}%WP
{\@ifundefined{deliv@lead}{??}{\string\site{\deliv@lead}}}}}}% lead
\item[\current@label\ (%
\delivs@legend@due: \@ifundefined{deliv@due}{??}{\deliv@due},
\delivs@legend@nature: \@ifundefined{deliv@nature}{??}{\deliv@nature},
\delivs@legend@dissem: \@ifundefined{deliv@dissem}{??}{\deliv@dissem},
\delivs@legend@lead: \@ifundefined{deliv@lead}{??}{\site{\deliv@lead}})]
 \pdata@target{deliv}{\taskin\deliv@id\wpg@id}{\textit{#2}}
\@ifundefined{deliv@miles}{}{% print the milestones and update their deliverables
\let\m@sep=\relax% do not print the separator the first time round
\lec{\@for\@I:=\deliv@miles\do{% Iterate over the milestones mentioned
\m@sep\pdataRef{mile}{\@I}{label}% print the milestone reference
\let\m@sep=,}}%set the separator for the next times
\def\d@sep{,}
 \@for\@I:=\deliv@miles\do{% Iterate over the milestones mentioned
 \expandafter\ifx\csname\@I delivs\endcsname\relax% Check that the miles@delivs is empty
  {\expandafter\xdef\csname\@I delivs\endcsname{\wpg@id @\deliv@id}}% if so, skip the separator
   \else\expandafter\xdef\csname\@I delivs\endcsname%if not add it
      {\csname\@I delivs\endcsname\d@sep\wpg@id @\deliv@id}\fi}}}
\newenvironment{wadeliv}[2][]{\ifdelivs\wpg@deliv{#1}{#2}{wa}\else\deliv@error\fi}{}
\newenvironment{wpdeliv}[2][]{\ifdelivs\wpg@deliv{#1}{#2}{wp}\else\deliv@error\fi}{}
\newcommand\milestone@label[1]{M{#1}}
\newcommand\mileref[1]{\pdataRef{mile}{#1}{label}}
\newcommand\miletref[1]{\mileref{#1}: \pdataRefFB{mile}{#1}{short}{title}}
\newcounter{milestone}
\define@key{milestone}{id}{\gdef\mile@id{#1}}
\define@key{milestone}{month}{\gdef\mile@month{#1}}
\newcommand\milestone[3][]{%
\ifdelivs%
\setkeys{milestone}{#1}\stepcounter{milestone}%
\pdata@def{mile}\mile@id{label}{\milestone@label{\themilestone}}%
\pdata@def{mile}\mile@id{month}{\mile@month}%
\pdata@def{mile}\mile@id{title}{#2}%
\pdata@def{mile}\mile@id{description}{#3}%
\@ifundefined{mile@stones}%
{\xdef\mile@stones{\mile@id}}%
{\xdef\mile@stones{\mile@stones,\mile@id}}%
\@milestone{\mile@id}{#2}{#3}% presentation
\else\deliv@error\fi}
\newcommand\@milestone[3]{% id, title, description
\item \textbf{\miles@legend@milestone\xspace\pdata@target{mile}\mile@id{\pdataref{mile}{#1}{label}}
(\miles@legend@month \pdataref{mile}\mile@id{month})
\textbf{#2}} #3}
\newcommand\miles@legend@month{Month}
\newcommand\miles@legend@milestone{Milestone}
\newenvironment{milestones}%
{\ifdelivs\begin{@milestones}\else\deliv@error\fi}
{\ifdelivs\pdata@def{all}{mile}{ids}{\mile@stones}%
\pdata@def{all}{mile}{count}{\themilestone}%
\end{@milestones}\fi}
\newenvironment{@milestones}{\begin{enumerate}}{\end{enumerate}}
\newcommand{\deliverable}[9]{\pdataRef{deliv}{#4}{label}&#7&#8&#9&#6&#5&#2\\\hline}%sortkey,due,label,id,title,type,level,lead
\newenvironment{deliverables}[1]{\ifdelivs\begin{longtable}{|l|p{#1}|l|l|l|l|l|}\hline%
\#&\textbf{\delivs@legend@name}&%
\textbf{\delivs@legend@wp}&%
\textbf{\delivs@legend@lead}&%
\textbf{\delivs@legend@nature}&%
\textbf{\delivs@legend@level}&%
\textbf{\delivs@legend@due}\\\hline\hline%
\endhead%
\else\deliv@error\fi}
{\ifdelivs\end{longtable}\fi}
\newcommand\delivs@legend@name{Deliverable name}
\newcommand\delivs@legend@wp{WP}
\newcommand\delivs@legend@nature{Type}
\newcommand\delivs@legend@level{Level}
\newcommand\delivs@legend@due{Due}
\newcommand\delivs@legend@dissem{Dissem.}
\newcommand\delivs@legend@lead{Lead}
\newcommand{\inputdelivs}[1]{%
\begin{deliverables}{#1}%
\IfFileExists{\jobname.deliverables}%
{\input{\jobname.deliverables}}%
{\IfFileExists{\jobname.delivs}{\input{\jobname.delivs}}{}}
\end{deliverables}}
\defbibheading{empty}{}
\newif\if@allpapers\@allpaperstrue
\newcommand\prop@ppl[3][]{\@allpapersfalse\message{ppl processing: #2}%
\printbibliography[heading=subbibliography,type=#2,title=#3#1]%
\@ifundefined{prop@rl}{\xdef\prop@rl{#2}}{\xdef\prop@rl{\prop@rl, #2}}}
\newcommand\prop@prl[1]{\message{unclassified: #1}%
\printbibliography[heading=subbibliography,title=Unclassified,#1]}%
\define@key{paperlist}{unclassified}[true]{\message{unclass: \prop@rl}\prop@prl\prop@rl}
\define@key{paperlist}{articles}[true]{\prop@ppl{article}{Articles}}
\define@key{paperlist}{chapters}[true]{\prop@ppl{inbook}{Book Chapters}}
\define@key{paperlist}{confpapers}[true]{\prop@ppl[,keyword=conference]{inproceedings}{Conference Papers}}
\define@key{paperlist}{wspapers}[true]{\prop@ppl[,notkeyword=conference]{inproceedings}{Workshop Papers}}
\define@key{paperlist}{theses}[true]{\prop@ppl{thesis}{Theses}}
\define@key{paperlist}{submitted}[true]{\prop@ppl[,keyword=submitted]{unpublished}{Submitted}}
\define@key{paperlist}{books}[true]{\prop@ppl{book}{Monographs}}
\define@key{paperlist}{techreports}[true]{\prop@ppl{techreport}{Technical Reports}}
\DeclareBibliographyCategory{featured}
\newcommand\prop@paperlist[2][]{%
\let\biboldfont\bibfont%
\renewcommand{\bibfont}{\footnotesize}%
\renewcommand{\baselinestretch}{.9}%
\nocite{#2}\def\do##1{\addtocategory{featured}{##1}}\docsvlist{#2}%
\setkeys{paperlist}{#1}
\@ifundefined{prop@rl}{}{\@latex@warning{some papers are not classified!}}
\if@allpapers\printbibliography[category=featured,heading=empty]\fi%
\let\bibfont\biboldfont}
\def\prop@warnpubs@message{Many of the proposers' publications are online at one of the following URIs:}
\def\prop@warnpubs@title{References}
\defbibheading{warnpubs}{\section*{\prop@warnpubs@title}%
  \@ifundefined{prop@gen@pubspages}
 {\@latex@warning{No publication pages specified;
                   use the pubspage key in the proposal environment!}}
  {\prop@warnpubs@message%
 \@for\@I:=\prop@gen@pubspages\do{\par\noindent\csname\@I\endcsname}}}
\endinput
%%
%% End of file `reporting.cls'.
