%%
%% This is file `proposal.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% proposal.dtx  (with options: `cls')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{proposal}[2016/10/26 v1.6 Project Proposal]
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
\RequirePackage{proposal}
\renewbibmacro*{event+venue+date}{}
\renewbibmacro*{doi+eprint+url}{%
  \iftoggle{bbx:doi}
    {\printfield{doi}\iffieldundef{doi}{}{\clearfield{url}}}
    {}%
  \newunit\newblock
  \iftoggle{bbx:eprint}
    {\usebibmacro{eprint}}
    {}%
  \newunit\newblock
  \iftoggle{bbx:url}
    {\usebibmacro{url+urldate}}
    {}}
\endinput
%%
%% End of file `proposal.cls'.
