%%
%% This is file `proposal.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% proposal.dtx  (with options: `cls')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{proposal}[2020/08/21 v1.7 Project Proposal]
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
\newif\if@numericcites\@numericcitesfalse
\newif\if@longtasklabels\@longtasklabelsfalse
\newif\if@attachments\@attachmentsfalse
\def\proposal@class{article}
\DeclareOption{wpsubsection}{\@wpsubsectiontrue}
\DeclareOption{submit}{\submittrue}
\DeclareOption{grantagreement}{\grantagreementtrue}
\DeclareOption{gitinfo}{\@gitinfotrue}
\DeclareOption{numericcites}{\@numericcitestrue}
\DeclareOption{svninfo}{\@svninfotrue}
\DeclareOption{public}{\publictrue}
\DeclareOption{noworkareas}{\work@areasfalse\PassOptionsToClass{\CurrentOption}{pdata}}
\DeclareOption{RAM}{\@RAMtrue}
\DeclareOption{report}{\def\proposal@class{report}}
\DeclareOption{keys}{\keystrue}
\DeclareOption{deliverables}{\delivstrue}
\DeclareOption{longtasklabels}{\@longtasklabelstrue}
\DeclareOption{attachments}{\@attachmentsfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\proposal@class}}
\ProcessOptions
\LoadClass[a4paper,twoside]{\proposal@class}
\RequirePackage{proposal}


\endinput
%%
%% End of file `proposal.cls'.
