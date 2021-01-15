\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nitocs}
 [2015/7/15 v1.0 大分高専　情報工学科卒業研究関連クラス]



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{color}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% Document Styles %%%%%%
\newif\ifDS@summary \DS@summaryfalse
\newif\ifDS@interim \DS@interimfalse
\newif\ifDS@gradrep \DS@gradrepfalse

\DeclareOption{gradrep}{\DS@gradreptrue\def\@type{GRADREP}}
\DeclareOption{summary}{\DS@gradrepfalse\DS@summarytrue\def\@type{SUMMARY}}
\DeclareOption{interim}{\DS@gradrepfalse\DS@interimtrue\def\@type{INTERIM}}



%%% parameter %%%%%%%%%
\unitlength=1mm
\predisplaypenalty=0
%%%%%%%%%%%%%%%%%%%%%%%

%%A4: 210mm, 297mm 
\newcounter{@paper}
\newif\if@landscape \@landscapefalse
\newcommand{\@ptsize}{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue

\newif\if@stysize \@stysizefalse
\newif\if@enablejfam \@enablejfamtrue
\DeclareOption{a4paper}{\setcounter{@paper}{1}%
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}{\setcounter{@paper}{2}%
  \setlength\paperheight {210mm}
  \setlength\paperwidth  {148mm}}
\DeclareOption{b4paper}{\setcounter{@paper}{3}%
  \setlength\paperheight {364mm}
  \setlength\paperwidth  {257mm}}
\DeclareOption{b5paper}{\setcounter{@paper}{4}%
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {182mm}}
\DeclareOption{a4j}{\setcounter{@paper}{1}\@stysizetrue
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{a5j}{\setcounter{@paper}{2}\@stysizetrue
  \setlength\paperheight {210mm}
  \setlength\paperwidth  {148mm}}
\DeclareOption{b4j}{\setcounter{@paper}{3}\@stysizetrue
  \setlength\paperheight {364mm}
  \setlength\paperwidth  {257mm}}
\DeclareOption{b5j}{\setcounter{@paper}{4}\@stysizetrue
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {182mm}}
\DeclareOption{a4p}{\setcounter{@paper}{1}\@stysizetrue
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{a5p}{\setcounter{@paper}{2}\@stysizetrue
  \setlength\paperheight {210mm}
  \setlength\paperwidth  {148mm}}
\DeclareOption{b4p}{\setcounter{@paper}{3}\@stysizetrue
  \setlength\paperheight {364mm}
  \setlength\paperwidth  {257mm}}
\DeclareOption{b5p}{\setcounter{@paper}{4}\@stysizetrue
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {182mm}}
\if@compatibility
  \renewcommand{\@ptsize}{0}
\else
  \DeclareOption{10pt}{\renewcommand{\@ptsize}{0}}
\fi
\DeclareOption{11pt}{\renewcommand{\@ptsize}{1}}
\DeclareOption{12pt}{\renewcommand{\@ptsize}{2}}
\DeclareOption{landscape}{\@landscapetrue
  \setlength\@tempdima{\paperheight}%
  \setlength\paperheight{\paperwidth}%
  \setlength\paperwidth{\@tempdima}}

\DeclareOption{mentuke}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{\z@}%
  \maketombowbox}
\DeclareOption{tate}{%
  \AtBeginDocument{\tate\message{《縦組モード》}%
                   \adjustbaseline}%
}
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}}
\if@compatibility
\else
  \DeclareOption{disablejfam}{\@enablejfamfalse}
\fi

\setlength\overfullrule{0pt}
%%
%% Option
%%
\ExecuteOptions{a4paper,10pt,twoside,twocolumn,gradrep}%!!
\ProcessOptions\relax


% 
\newdimen\h
  \h=0.25mm
\newdimen\JQ
  \JQ=0.7392507pt
\newdimen\Q
  \Q=0.71144pt

\newdimen\@Q \@Q=0.25mm


%%
%% Font
%%


%% 
\expandafter\let\csname JY1/mc/m/n/10\endcsname\relax
\expandafter\let\csname JY1/gt/m/n/10\endcsname\relax
%%%
\DeclareFontShape{JT1}{gt}{m}{it}{<-> ssub*gt/m/n}{}
\DeclareFontFamily{JT1}{mdg}{}
\DeclareFontShape{JT1}{mdg}{m}{n}{<-> ssub*gt/m/n}{}
\DeclareFontFamily{JT1}{gmb}{}
\DeclareFontShape{JT1}{gmb}{m}{n}{<-> ssub*gt/m/n}{}
\DeclareFontShape{JT1}{gmb}{bx}{n}{<-> ssub*gt/m/n}{}
\DeclareFontFamily{JT1}{sg}{}
\DeclareFontShape{JT1}{sg}{m}{n}{<-> ssub*gt/m/n}{}
\DeclareFontShape{JT1}{sg}{bx}{n}{<-> ssub*gt/m/n}{}
\DeclareFontFamily{JT1}{gbm}{}
\DeclareFontShape{JT1}{gbm}{m}{n}{<-> ssub*gt/m/n}{}
\DeclareFontShape{JT1}{gbm}{bx}{n}{<-> ssub*gt/m/n}{}
\DeclareFontFamily{JT1}{jun}{}
\DeclareFontShape{JT1}{jun}{b}{n}{<-> ssub*gt/m/n}{}
\DeclareFontShape{JT1}{jun}{m}{n}{<-> ssub*gt/m/n}{}
\DeclareFontShape{JT1}{jun}{bx}{n}{<-> ssub*gt/m/n}{}
\DeclareFontShape{JT1}{mc}{m}{it}{<-> ssub*mc/m/n}{}
\DeclareFontShape{JY1}{mc}{m}{it}{<-> ssub*mc/m/n}{}%% v1.4
%
\DeclareFontShape{JT1}{mc}{bx}{it}{<-> ssub*gt/m/n}{}%% v1.4
\DeclareFontShape{JY1}{mc}{bx}{it}{<-> ssub*gt/m/n}{}%% v1.4


%%%
\DeclareFontShape{JT1}{mc}{m}{sc}{<-> ssub*mc/m/n}{}
\DeclareFontShape{JY1}{mc}{m}{sc}{<-> ssub*mc/m/n}{}

\DeclareFontShape{JY1}{mc}{m}{n}{<5>jis <6> jis
 <7> s * [1.05571] jis
 <8> s * [1.01625] jis
 <9> s * [0.98556] jis
 <10> s * [0.961] jis
 <10.95> s * [0.94516] jis
 <12> s * [0.98567] jis
 <14.4> s * [0.92406] jis
 <17.28> s * [0.85561] jis
 <20.74> s * [0.88545] jis
 <24.88> s * [0.9508] jis 
 <-> jis
 }{}
%
\DeclareFontShape{JY1}{gt}{m}{n}{<5>jisg <6> jisg
 <7> s * [1.05571] jisg 
 <8> s * [1.01625] jisg 
 <9> s * [0.98556] jisg
 <10> s * [0.961] jisg
 <10.95> s * [0.94516] jisg
 <12> s * [0.98567] jisg
 <14.4> s * [0.92406] jisg
 <17.28> s * [0.85561] jisg
 <20.74> s * [0.88545] jisg
 <24.88> s * [0.9508] jisg  
 <-> jisg
 }{}


%
\DeclareFontShape{OT1}{cmr}{m}{n}%
     {<-5.5>   cmr5%
      <5.5-6.5>   cmr6%
      <6.5-7.5>   cmr7% 
      <7.5-8.5>   cmr8%
      <8.5-11.5>  cmr10%
      <11.5-16.5> cmr12%
      <16.5->   cmr17%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{sl}%
     {  <-8.5>   cmsl8%
      <8.5-9.5>  cmsl9%
      <9.5-11.5> cmsl10%
      <11.5->    cmsl12%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{it}%
     {%
      <-7.5>     cmti7%
      <7.5-8.5>  cmti8%
      <8.5-9.5>  cmti9%
      <9.5-11.5> cmti10%
      <11.5->    cmti12%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{sc}%
     {%
      <->cmcsc10%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{ui}
     {%
      <-> cmu10%
      }{}
%%%%%%% bold series
\DeclareFontShape{OT1}{cmr}{b}{n}
     {%
      <-> cmb10%
      }{}
%%%%%%%% bold extended series
\DeclareFontShape{OT1}{cmr}{bx}{n}
   {%
      <-5.5>     cmbx5
      <5.5-6.5>  cmbx6
      <6.5-7.5>  cmbx7
      <7.5-8.5>  cmbx8
      <8.5-9.5>  cmbx9%
      <9.5-11.5> cmbx10%
      <11.5->    cmbx12%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{sl}
      {%
      <-> cmbxsl10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{it}
      {%
      <-> cmbxti10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{ui}
      {<->sub*cmr/m/ui}{}
%OMScmsy
\DeclareFontShape{OMS}{cmsy}{m}{n}{%
      <-5.5>    cmsy5
      <5.5-6.5> cmsy6
      <6.5-7.5> cmsy7
      <7.5-8.5> cmsy8
      <8.5-9.5> cmsy9
      <9.5->    cmsy10%
      }{}
\DeclareFontShape{OMS}{cmsy}{b}{n}{%
      <-5.5>    cmbsy5
      <5.5-6.5> cmbsy6
      <6.5-7.5> cmbsy7
      <7.5-8.5> cmbsy8
      <8.5-9.5> cmbsy9
      <9.5->    cmbsy10%
      }{}
%OMXcmex
\DeclareFontShape{OMX}{cmex}{m}{n}{%
   <-> cmex10%
   }{}
%OMLcmmi
\DeclareFontShape{OML}{cmm}{m}{it}%
     {<-5.5>    cmmi5
      <5.5-6.5> cmmi6
      <6.5-7.5> cmmi7
      <7.5-8.5> cmmi8
      <8.5-9.5> cmmi9%
      <9.5-11.5>cmmi10%
      <11.5->   cmmi12%
      }{}
\DeclareFontShape{OML}{cmm}{b}{it}{%
      <-5.5>    cmmib5
      <5.5-6.5> cmmib6
      <6.5-7.5> cmmib7
      <7.5-8.5> cmmib8
      <8.5-9.5> cmmib9%
      <9.5->    cmmib10%
      }{}
\DeclareFontShape{OML}{cmm}{bx}{it}%
   {<->ssub*cmm/b/it}{}
%%OT1cmtt
\DeclareFontShape{OT1}{cmtt}{m}{n}
     {%
      <-8.5>     cmtt8
      <8.5-9.5>  cmtt9%
      <9.5-11.5> cmtt10%
      <11.5->    cmtt12%
      }{}
%%%%%% make sure subst shapes are available
\DeclareFontShape{OT1}{cmtt}{m}{it}
     {%
      <-> cmitt10%
      }{}
\DeclareFontShape{OT1}{cmtt}{m}{sl}
     {%
      <-> cmsltt10%
      }{}
\DeclareFontShape{OT1}{cmtt}{m}{sc}
     {%
      <-> cmtcsc10%
      }{}
\DeclareFontShape{OT1}{cmtt}{m}{ui}
  {<->ssub*cmtt/m/it}{}
\DeclareFontShape{OT1}{cmtt}{bx}{n}
  {<->ssub*cmtt/m/n}{}
\DeclareFontShape{OT1}{cmtt}{bx}{it}
  {<->ssub*cmtt/m/it}{}
\DeclareFontShape{OT1}{cmtt}{bx}{ui}
  {<->ssub*cmtt/m/it}{}
%umsa
\DeclareFontFamily{U}{msa}{}
\DeclareFontShape{U}{msa}{m}{n}{
  <   -5.5> msam5
  <5.5-6.5> msam6
  <6.5-7.5> msam7
  <7.5-8.5> msam8
  <8.5-9.5> msam9
  <9.5-    > msam10
  }{}
\DeclareFontFamily{U}{msb}{}
\DeclareFontShape{U}{msb}{m}{n}{
  <   -5.5> msbm5
  <5.5-6.5> msbm6
  <6.5-7.5> msbm7
  <7.5-8.5> msbm8
  <8.5-9.5> msbm9
  <9.5-    > msbm10
  }{}

\DeclareFontShape{OT1}{cmss}{m}{n}
     {%
      <-8.5>cmss8%
      <8.5-9.5>cmss9%
      <9.5-11.5>cmss10%
      <11.5-16.5>cmss12%
      <16.5->cmss17%
      }{}
\DeclareFontShape{OT1}{cmss}{m}{it}
      {<->sub*cmss/m/sl}{}
\DeclareFontShape{OT1}{cmss}{m}{sl}
    {%
      <-8.5>cmssi8
      <8.5-9.5>cmssi9%
      <9.5-11.5>cmssi10%
      <11.5-16.5>cmssi12%
      <16.5->cmssi17%
      }{}
\DeclareFontShape{OT1}{cmss}{m}{sc}
       {<->sub*cmr/m/sc}{}
\DeclareFontShape{OT1}{cmss}{m}{ui}
       {<->sub*cmr/m/ui}{}
\DeclareFontShape{OT1}{cmss}{sbc}{n}
     {%
      <->cmssdc10%
     }{}
\DeclareFontShape{OT1}{cmss}{bx}{n}
     {%
      <->cmssbx10%
      }{}
\DeclareFontShape{OT1}{cmss}{bx}{ui}
       {<->sub*cmr/bx/ui}{}
%%for latexsym
\DeclareFontFamily{U}{lasy}{}
\DeclareFontShape{U}{lasy}{m}{n}{
 <   -5.5>lasy5
 <5.5-6.5>lasy6
 <6.5-7.5>lasy7
 <7.5-8.5>lasy8
 <8.5-9.5>lasy9
 <9.5-    >lasy10  }{}
\DeclareFontShape{U}{lasy}{b}{n}{ 
     <  -10> ssub * lasy/m/n
     <10-  > lasyb10  }{}
%%%




%% FutoGo
 \DeclareFontFamily{JY1}{fgb}{}
 \DeclareFontShape{JY1}{fgb}{m}{n}{%
 <-14> s *[0.961] FutoGoB101-Bold-J.tfm%
 <14-> s *[1] FutoGoB101-Bold-J.tfm%
 }{}
 \DeclareFontFamily{JT1}{fgb}{}
 \DeclareFontShape{JT1}{fgb}{m}{n}{%
 <-> s *tmin10%
 }{}

%% FutoMin
 \DeclareFontFamily{JY1}{fmb}{}
 \DeclareFontShape{JY1}{fmb}{m}{n}{%
 <-14> s *[0.961] FutoMinA101-Bold-J.tfm%
 <14-> s *[1] FutoMinA101-Bold-J.tfm%
 }{}
 \DeclareFontFamily{JT1}{fmb}{}
 \DeclareFontShape{JT1}{fmb}{m}{n}{%
 <-> s *tmin10%
 }{}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}


\newskip\ChtE
\newskip\CdpE
\newskip\CwdE
\newskip\CvsE



% normalsize
% J: 13Q x 21H

\renewcommand{\normalsize}{%
    \@setfontsize\normalsize{13\JQ}{21H}%
  \kanjiskip\z@ \@plus .1zw \@minus .05zw
  \abovedisplayskip 9\p@ \@plus 3\p@ \@minus 4\p@
  \abovedisplayshortskip \z@ \@plus 2.5\p@
  \belowdisplayshortskip 5\p@ \@plus 2\p@ \@minus 2\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
 \normalsize
 \setbox0\hbox{\char\euc"A1A1}% "
 \setlength\Cht{\ht0}
 \setlength\Cdp{\dp0}
 \setlength\Cwd{\wd0}
 \setlength\Cvs{\baselineskip}
 \setlength\Chs{\wd0}





% small
% J: 12Q x 20H
\newcommand{\small}{%
  \@setfontsize\small{12\JQ}{20H}%
  \kanjiskip\z@ \@plus .1zw \@minus .05zw
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 3\p@ \@plus \p@ \@minus \p@
              \parsep 1\p@ \@plus \p@ \@minus \p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}


% footnotesize
% J: 11Q x 18H
 \newcommand{\footnotesize}{%
  \@setfontsize\footnotesize{11\JQ}{18H}%
  \kanjiskip\z@ \@plus .1zw \@minus .05zw
  \abovedisplayskip 5\p@ \@plus 1.5\p@ \@minus 3\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 2.5\p@ \@plus \p@ \@minus 1.5\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 2\p@ \@plus\p@ \@minus\p@
              \parsep 1\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

\newcommand{\scriptsize}{\@setfontsize\scriptsize{10\JQ}{16H}}
 \newcommand{\tiny}{\@setfontsize\tiny\@vpt\@vipt}
 \newcommand{\large}{\@setfontsize\large\@xpt{22\JQ}}
 \newcommand{\Large}{\@setfontsize\Large\@xipt{27\JQ}}
 \newcommand{\LARGE}{\@setfontsize\LARGE\@xiipt{33\JQ}}
 \newcommand{\huge}{\@setfontsize\huge\@xivpt{25}}
 \newcommand{\Huge}{\@setfontsize\Huge\@xviipt{30}}



\setlength\floatsep    {1\Cvs \@plus .75\Cvs \@minus .25\Cvs}
\setlength\textfloatsep{1\Cvs \@plus .75\Cvs \@minus .25\Cvs}
\setlength\intextsep   {1\Cvs \@plus .75\Cvs \@minus .25\Cvs}
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}


\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
\def\@listi{\leftmargin\leftmargini
  \parsep 4\p@ \@plus2\p@ \@minus\p@
  \topsep 8\p@ \@plus2\p@ \@minus4\p@
  \itemsep4\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii \advance\labelwidth-\labelsep
   \topsep  4\p@ \@plus2\p@ \@minus\p@
   \parsep  2\p@ \@plus\p@  \@minus\p@
   \itemsep\parsep}
\def\@listiii{\leftmargin\leftmarginiii
   \labelwidth\leftmarginiii \advance\labelwidth-\labelsep
   \topsep 2\p@  \@plus\p@\@minus\p@
   \parsep\z@
   \partopsep \p@ \@plus\z@ \@minus\p@
   \itemsep\topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\paperheight}{297mm}
\setlength{\paperwidth}{210mm}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\setlength\headheight{12\p@}
%\setlength\headsep{4.5mm}

\headheight5mm
\headsep9.5mm
\setlength\topskip{1\Cht}
\setlength\footskip{11.7mm} %

\textwidth 177mm

\ifDS@gradrep
\addtolength{\textwidth}{-5mm}
\setlength\hoffset{3mm}
\fi

 \@settopoint\textwidth
 \textheight 47\Cvs
 \advance \textheight \topskip
 \advance \textheight .4mm %% limit .31mm
 \@settopoint\textheight
 \setlength\marginparsep{5mm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%
\@tempdima\paperwidth
\advance\@tempdima-\textwidth
\@tempdima.5\@tempdima
\advance\@tempdima-1in
\oddsidemargin\@tempdima
\evensidemargin\@tempdima
\setlength{\topmargin}{-17mm}%

\columnsep 8mm





%
\newif\if@enablejfam \@enablejfamtrue%

\setlength\lineskip{1\p@}%
\setlength\normallineskip{1\p@}%
\renewcommand{\baselinestretch}{}%
\newskip\normalbaselineskip

\setlength\parskip{\z@}%
\setlength\parindent{1zw}%


%penalty
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

%%float
\setcounter{topnumber}{8}
\setcounter{bottomnumber}{8}
\setcounter{totalnumber}{16}
\setcounter{dbltopnumber}{2}

\def\topfraction{1}
\def\bottomfraction{1}
\def\textfraction{0}
\def\floatpagefraction{0}
\def\dbltopfraction{1}
\def\dblfloatpagefraction{0}
%

%=================================================================================


\def\SIGHead{大分工業高等専門学校\hskip12\JQ 情報工学科}%%

\def\signame@SUMMARY{}%%
\def\signame@INTERIM{{\SIGHead}\hskip12\JQ 中間発表}%%
\def\signame@GRADREP{\@title (\@thejauthor)}%%

%\def\signame@GRADREP{{\SIGHead}\hskip12\JQ 卒業論文}%%

\def\signame{\csname signame@\@type\endcsname}
\def\type#1{\def\@type{#1}}
%\def\HeadfontJ{\fontsize{12\JQ}{0\h}\bfseries\selectfont}
\def\HeadfontJ{\fontsize{12\JQ}{0\h}\selectfont}
%============================================================



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\ps@plain{\let\@mkboth\@gobbletwo
   \let\ps@jpl@in\ps@plain
   \let\@oddhead\@empty
   \let\@oddfoot\@empty
%   \def\@oddfoot{\reset@font\hfil\thepage\hfil}%
   \let\@evenhead\@empty
   \let\@evenfoot\@oddfoot}
\let\ps@jpl@in\ps@plain

\def\ps@headnombre{\let\@mkboth\@gobbletwo
    \let\ps@jpl@in\ps@headnombre
  \def\@evenhead{\thepage\hfil}%
  \def\@oddhead{\hfil\thepage}%
  \let\@oddfoot\@empty\let\@evenfoot\@empty}
\def\ps@footnombre{\let\@mkboth\@gobbletwo
    \let\ps@jpl@in\ps@footnombre
  \def\@evenfoot{\thepage\hfil}%
  \def\@oddfoot{\hfil\thepage}%
  \let\@oddhead\@empty\let\@evenhead\@empty}


\def\ps@empty{%
 \def\@oddhead{\hfil}%
 \let\@evenhead\@oddhead
 \def\@oddfoot{\hfil}%
 \let\@evenfoot\@oddfoot
 \let\@mkboth\@gobbletwo
}


%===============================================================
\def\bothashira{\fontsize{10\Q}{0\h}\normalfont\selectfont}%
\def\botnomble{\fontsize{13\Q}{0\h}\normalfont\selectfont}

\def\ps@headings{%
 \def\@oddhead{\hfill\llap{\small{\HeadfontJ{\signame}}}}%
%\ifDS@gradrep% 
% \def\@oddhead{\hfill\llap{\small{\HeadfontJ{\signame}}}}%
%\else%
% \def\@oddhead{\rlap{\small{\HeadfontJ{\signame}}}\hfil}%
%\fi%
 \let\@evenhead\@oddhead
 \def\@oddfoot{%
%\rlap{%
%%
{\botnomble%
\ifDS@interim\relax\else{\hfil\thepage\hfil}\fi%
%\ifDS@gradrep{\hfil\thepage\hfil}\else\relax\fi
}
}%
 \let\@evenfoot\@oddfoot
 \let\@mkboth\@gobbletwo
%}
}



%================================================================================
\def\jtitle{\@ifnextchar[% 
 {\d@jtitle}{\s@jtitle}}
\def\d@jtitle[#1]#2{\gdef\hd@title{#1}\gdef\@jtitle{#2}}
\def\s@jtitle#1{\gdef\hd@title{#1}\gdef\@jtitle{#1}}
\def\@jtitle{}
\def\hd@title{}
\def\etitle#1{\gdef\@etitle{#1}}
\def\@etitle{}



%=================================================================================
% author
%=================================================================================
\newcount\author@count
\newcount\label@count
\newcount\email@count
\newcount\affiliate@count
\newcount\offsetemail
\newcount\paffiliate@count


\def\@thejauthor{}
\def\@theeauthor{}

\def\@thejadvisor{}
\def\@theeadvisor{}

\def\author#1#2{%
\def\@thejauthor{#1}
\def\@theeauthor{#2}
}

\def\advisor#1#2{%
\def\@thejadvisor{#1}
\def\@theeadvisor{#2}
}

\def\authoroutput{%
 \mbox{% 
\@thejauthor\hskip 2zw  （指導教員　\@thejadvisor )%
}}

\def\eauthoroutput{%
 \mbox{% 
\@theeauthor\hskip 2zw  (Academic Advisor \quad \@theeadvisor )%
}}

%%(
\def\rparen{)}%%
 
%=================================================================================
% maketitle
%=================================================================================

\def\maketitle{\par
   \begingroup
     \renewcommand{\thefootnote}{\fnsymbol{footnote}}%
     \def\@makefnmark{\hbox{\ifydir $\m@th^{\@thefnmark}$
       \else\hbox{\yoko$\m@th^{\@thefnmark}$}\fi}}%
      \long\def\@makefntext##1{\parindent 1em\noindent
        \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
     \if@twocolumn
      \ifnum \col@number=\@ne \@maketitle
      \else \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
     \fi
      \thispagestyle{headings}
 \@thanks
   \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\p@thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@eauthor\@empty
  \global\let\@date\@empty
%  \global\let\@title\@empty
%  \global\let\title\relax
  \global\let\@etitle\@empty
  \global\let\etitle\relax
%%%
  \global\let\author\relax
  \global\let\eauthor\relax
  \global\let\date\relax
  \global\let\and\relax
\setcounter{footnote}{0}
  }
%%






%=================================================================================
% @maketitle
%=================================================================================

\newskip\Jtitlejauthorsep 
\newskip\Jdatesep
\newskip\Jabstsep
\newskip\Jabstsepjkeyword
\newskip\Jetitleskip
\newskip\Jetitleeauthor

\Jtitlejauthorsep=6mm 
\Jabstsep=2.5mm
\Jabstsepjkeyword=4.0mm
\Jetitleeauthor=4.0mm
\Jetitleskip=3.5mm
\Jdatesep=4mm

%======================================================

\def\@maketitle{%
\newpage\null
\begin{center}
\authortitle
\end{center}
}

\def\authortitle{\csname authortitle\@type\endcsname}

\def\authortitleGRADREP{%
{\jtitlefont%
{\@title}\par}%
%%%%%%%%%%%%%%%%%%%%%%%
\vskip\Jtitlejauthorsep%
%%%%%%%%%%%%%%%%%%%%%%%%
%% author
%======
{\authorfont%
\authoroutput\par}%
%%%%%%%%%%%%%%%%%%%%%%%%%%
\vskip\Jdatesep%
%%%%%%%%%%%%%%%%%%%%%%%%%%
{\jdatefont%
{\@thedate}\par}%
\vskip\Jetitleskip%
{\etitlefont%
{\bfseries{\@etitle}}}\par%
% %%%%%%%%%%%%%%%%%%%%%%
\vskip\Jetitleeauthor%
% %%%%%%%%%%%%%%%%%%%%%%
{\eauthorfont%
\eauthoroutput\par}%

%%%%%%%%%%%%%%%%%%%%%%%%
\vskip\Jabstsep%
%%%%%%%%%%%%%%%%%%%%%%%%
\mbox{\box\@abstractbox}\par%
%%%%%%%%%%%%%%%%%%%%%%%%
\vskip\Jabstsepjkeyword%
%%%%%%%%%%%%%%%%%%%%%%%%
\mbox{\box\@jkeywordbox}\par%
% %%%%%%%%%%%%%%%%%%%%%%
\vskip\Jabstsepjkeyword%
}


\def\authortitleINTERIM{%
{\jtitlefont%
{\@title}\par}%
%%%%%%%%%%%%%%%%%%%%%%%
\vskip\Jtitlejauthorsep%
%%%%%%%%%%%%%%%%%%%%%%%%
{\authorfont%
\authoroutput\par}%
%%%%%%%%%%%%%%%%%%%%%%%%%%
\vskip\Jdatesep%
%%%%%%%%%%%%%%%%%%%%%%%%%%
{\jdatefont%
{\@thedate}\par}%
%%%%%%%%%%%%%%%%%%%%%%%%
\vskip\Jdatesep%
%%%%%%%%%%%%%%%%%%%%%%%%
\mbox{\box\@jkeywordbox}\par%
% %%%%%%%%%%%%%%%%%%%%%%
\vskip\Jabstsepjkeyword%
}

\def\authortitleSUMMARY{%
{\jtitlefont%
{\@title}\par}%
%%%%%%%%%%%%%%%%%%%%%%%
\vskip\Jtitlejauthorsep%
%%%%%%%%%%%%%%%%%%%%%%%%
{\authorfont%
\authoroutput\par}%
%%%%%%%%%%%%%%%%%%%%%%%%%%
\vskip\Jdatesep%
%%%%%%%%%%%%%%%%%%%%%%%%%%
{\jdatefont%
{\@thedate}\par}%
%%%%%%%%%%%%%%%%%%%%%%%%
\vskip\Jabstsepjkeyword%
%%%%%%%%%%%%%%%%%%%%%%%%
%\mbox{\box\@jkeywordbox}\par%
% %%%%%%%%%%%%%%%%%%%%%%
\vskip\Jabstsepjkeyword%
}

%=================================================================================
% maketitle Font
%=================================================================================
% 
% %% Times -> CM
% \def\titleddash{{\usefont{OT1}{cmr}{bx}{n}\selectfont%
% \leavevmode \raise.1zh\hbox to 2zw{---\hss ---}}}
% 
% 
% %% 
\def\jtitlefont{%
\fontsize{27\JQ}{34\h}
\usefont{JY1}{gt}{m}{n}%
\bfseries%
\mathversion{bold}\selectfont%
}


\def\etitlefont{\fontsize{20\Q}{22\h}\mathversion{bold}\selectfont}
% 
\def\authorfont{\fontsize{16\JQ}{22\h}\selectfont}
\def\eauthorfont{\fontsize{14\JQ}{18\h}\scshape\selectfont}%14Qx18
\def\jdatefont{\fontsize{13\JQ}{13\h}\normalfont\selectfont}
\def\keywordfont{\fontsize{13\JQ}{13\h}\normalfont\selectfont}


\def\@thedate{}
\def\date#1{%
\def\@thedate{#1}
}

%==========================================================================================================================

\def\GAIYOU{{\textbf{概要}：}}
\newbox\@abstractbox
\def\abstract{%
 \global\setbox\@abstractbox\hbox\bgroup%
  \begin{minipage}[t]{.8\textwidth}% 12Q 18H
\fontsize{12\JQ}{18\h}\selectfont%
\noindent{\GAIYOU}%
\ignorespaces}


\def\endabstract{%
\par%
\end{minipage}%
\egroup\ignorespaces}

%==========================================================================================================================

 \def\JKEYWORD{\textit{キーワード}：}%
 \newbox\@jkeywordbox

 \def\keyword{\@par%
\global\setbox\@jkeywordbox\hbox\bgroup
  \begin{minipage}[t]{.8\textwidth}%
\centering\keywordfont%
{\noindent{\JKEYWORD}}%
\ignorespaces}

\def\endkeyword{%
\par\end{minipage}%
\egroup\ignorespaces}

%==========================================================================================================================

\setcounter{secnumdepth}{3}
\newcounter{part}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand\thepart{\@Roman\c@part}
\renewcommand\thesection{\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\part{%
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Midasi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newbox\@tempboxb
\newbox\SECTwd

\newlength{\section@height}%
\section@height=\lineskip%
\advance \section@height-\topskip
\advance \section@height \baselineskip

\def\@startsectionA#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssectA{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sectA{#1}{#2}{#3}{#4}{#5}{#6}}}}


\def\@sectA#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{%\protect\rule{0mm}{21.75mm}
\@seccntformatA{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@%\@tempskipa>\z@
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setbox\SECTwd=\hbox{%
\begingroup
\noindent
#6{\@hangfrom{\hskip #3\relax\@svsec}}%
\interlinepenalty \@M {{#8}}%
\endgroup}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setbox\@tempboxb\hbox{#6{%
{\hskip #3\relax{\csname #2@font\endcsname \@svsec}}}}%
%%%%%%%%%%%\the\wd\SECTwd
\ifdim \wd\SECTwd > \columnwidth
%%%%%%%%%%%%
\@tempdima\columnwidth
\advance\@tempdima-\wd\@tempboxb
%%%%%%%%%%%%
\begingroup
   \mbox{}\par%
   \vspace{-\baselineskip}%%
   \addvspace{.65\Cvs}%
   \noindent%
   #6{\@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M 
   %\noindent
   \hangindent\wd\@tempboxb\hangafter=1
   #8\@@par}\nobreak{\par}%
   \addvspace{.74\Cvs}%
\endgroup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\else
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\begingroup
   \mbox{}\par%
   \vspace{-\baselineskip}%%
   \noindent
   {\vbox to 2.43\Cvs{\vfill%
   #6{\@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M {#8}\@@par}%
   \vfill}%
   }\@@par%
\endgroup
\fi
\par\prevdepth=-1000pt%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else%
        \protect\numberline{\csname the#1\endcsname}\hskip1zw%
      \fi%
      {#7}%\vfill
}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else%
         \protect\numberline{\csname the#1\endcsname}%
        \fi%
        #7}}%
  \fi%
  \@xsect{#5}}
\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\z@
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \ignorespaces}

\def\@seccntformatA#1{\csname the#1\endcsname.\hskip1zw}



%%%<<<< 1.02
\def\@ssectA#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
%%%
\begingroup
   \mbox{}\par%
   \vspace{-\baselineskip}%%
   \addvspace{.5\Cvs}%
   \noindent%
%%%
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M #5\@@par}%
   \addvspace{.5\Cvs}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}}
\newif\if@afterindent \@afterindenttrue
\def\@afterheading{%
  \@nobreaktrue
  \everypar{%
    \if@nobreak
      \@nobreakfalse
      \clubpenalty \z@
      \if@afterindent \else
        {\setbox\z@\lastbox}%
      \fi
    \else
      \clubpenalty \@clubpenalty
      \everypar{}%
    \fi}}

%----------------------------------------------------------------------------

%%%%%%%%%%%%%%% C
\def\@startsectionC#1#2#3#4#5#6{\if@noskipsec \leavevmode \fi
  \par  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@    \@tempskipa -\@tempskipa \@afterindentfalse  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty
\ifnum #2=\@ne
       \vskip-\prevdepth \prevdepth\z@ \vskip\Cvs
       \advance\@tempskipa-\Cvs \vspace*{\@tempskipa}%
     \else
\addvspace\@tempskipa
\fi
  \fi
  \@ifstar
    {\@ssectC{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sectC{#1}{#2}{#3}{#4}{#5}{#6}}}}

\def\@sectC#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{%\protect\rule{0mm}{21.75mm}
\@seccntformatC{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
%        \centering
\@hangfrom{\hskip #3\relax\@svsec}%
%          \interlinepenalty \@M \protect\SECTUP{\jidoukintou{#8}}\@@par}%
          \interlinepenalty \@M {#8}\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      {#7}}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}
\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\z@
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \ignorespaces}


\def\@seccntformatC#1{\csname the#1\endcsname\hskip1zw}

\def\@ssectC#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
%        \centering
\@hangfrom{\hskip #1}%
          \interlinepenalty \@M {#5}\@@par}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}}
\newif\if@afterindent \@afterindenttrue
\def\@afterheading{%
  \@nobreaktrue
  \everypar{%
    \if@nobreak
      \@nobreakfalse
      \clubpenalty \z@
      \if@afterindent \else
        {\setbox\z@\lastbox}%
      \fi
    \else
      \clubpenalty \@clubpenalty
      \everypar{}%
    \fi}}
\def\@hangfrom#1{\setbox\@tempboxa\hbox{#1}%
      \hangindent \wd\@tempboxa\noindent\box\@tempboxa}



%===========================================================


\def\@startsectionAPP#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
\ifnum #2=1\relax \vspace*{0mm}\fi%<---------------
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssectC{#3}{#4}{#5}{#6}}%<--------------------
    {\@dblarg{\@sectAPP{#1}{#2}{#3}{#4}{#5}{#6}}}}





\def\@sectAPP#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{%\protect\rule{0mm}{21.75mm}
\@seccntformatAPP{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@%\@tempskipa>\z@
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setbox\SECTwd=\hbox{%
\begingroup
\noindent
#6{\@hangfrom{\hskip #3\relax\@svsec}}%
\interlinepenalty \@M {{#8}}%
\endgroup}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setbox\@tempboxb\hbox{#6{%
{\hskip #3\relax{\csname #2@font\endcsname \@svsec}}}}%
%%%%%%%%%%%\the\wd\SECTwd
\ifdim \wd\SECTwd > \columnwidth
%%%%%%%%%%%%
\@tempdima\columnwidth
\advance\@tempdima-\wd\@tempboxb
%%%%%%%%%%%%
\begingroup
   \mbox{}\par%
   \vspace{-\baselineskip}%%
   \addvspace{.65\Cvs}%
   \noindent%
   #6{\@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M 
   %\noindent
   \hangindent\wd\@tempboxb\hangafter=1
   #8\@@par}\nobreak{\par}%
   \addvspace{.74\Cvs}%
\endgroup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\else
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\begingroup
   \mbox{}\par%
   \vspace{-\baselineskip}%%
   \noindent
   {\vbox to 2.43\Cvs{\vfill%
   #6{\@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M {#8}\@@par}%
   \vfill}%
   }\@@par%
\endgroup
\fi
\par\prevdepth=-1000pt%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else%
        \protect\numberline{\csname the#1\endcsname}\hskip1zw%
      \fi%
      {#7}%\vfill
}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else%
         \protect\numberline{\csname the#1\endcsname}%
        \fi%
        #7}}%
  \fi%
  \@xsect{#5}}
\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\z@
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \ignorespaces}

\def\@seccntformatAPP#1{\csname the#1\endcsname.\hskip1zw}


%----------------------------------------------------------------------------




%-----------------------------------
\newcommand{\section}{\@startsectionA{section}{1}{\z@}%
{.00001\Cvs}% \@plus.3\Cdp \@minus.2\Cdp}% \@plus1.3\Cdp\@minus10.5\Cdp}%
{.00001\Cvs}% \@plus.3\Cdp \@minus.2\Cdp}%
{\reset@font
\fontsize{16\JQ}{21\h}\selectfont%
\bfseries\mathversion{bold}%
}}
%-----------



%=======================
 \newcommand{\subsection}{\@startsectionC{subsection}{2}{\z@}%
{\Cvs}%{.3125\Cvs}%{.3125\Cvs \@plus.2\Cdp \@minus.5\Cdp}% 
{.00001\Cvs}% \@plus.3\Cdp \@minus.2\Cdp}%   {.5\Cvs \@plus.3\Cdp}%
   {\reset@font\normalsize\bfseries\mathversion{bold}}}


%=======================%=======================


\newcommand{\subsubsection}{\@startsectionC{subsubsection}{3}{\z@}%
   {0.00001\Cvs}% \@plus.3\Cdp \@minus.2\Cdp}%{.5\Cvs \@plus.5\Cdp \@minus.2\Cdp}%
   {0.00001\Cvs}% \@plus.3\Cdp \@minus.2\Cdp}%{.5\Cvs \@plus.3\Cdp}%
   {\reset@font\normalsize\bfseries\mathversion{bold}}}


%=======================%=======================



\newcommand{\paragraph}{\@startsectionC{paragraph}{3}{\z@}%
   {0.00001\Cvs}% \@plus.3\Cdp \@minus.2\Cdp}%
   {0.00001\Cvs}% \@plus.3\Cdp \@minus.2\Cdp}%
   {\reset@font\normalsize\bfseries}}

\newcommand{\subparagraph}{\@startsectionC{subparagraph}{3}{\z@}%
   {0.00001\Cvs}% \@plus.3\Cdp \@minus.2\Cdp}%
   {0.00001\Cvs}% \@plus.3\Cdp \@minus.2\Cdp}%
   {\reset@font\normalsize\bfseries}}


%============================================================================

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig, tab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\figurename}{図}
\newcommand{\tablename}{表}

% 
% 
% 
 \def\CaptionType{\def\@captype}
% 
% 
% \newdimen\@abovecapskip
% \newdimen\@belowcapskip
% 
% 
\newcounter{figure}
\renewcommand{\thefigure}{\@arabic\c@figure}
 \def\fps@figure{tbp}
 \def\ftype@figure{1}
 \def\ext@figure{lof}
 \def\fnum@figure{\figurename~\thefigure}
 \def\fnum@efigure{Fig.~\thefigure}
\newenvironment{figure}
   {\@floatenv
    \capwidth65mm\ecapwidth65mm
    \abovecaptionskip1mm\belowcaptionskip\z@\@float{figure}}
   {\end@float}

\newenvironment{figure*}
              {\@floatenv\capwidth.66\textwidth\ecapwidth.66\textwidth
               \abovecaptionskip1mm\belowcaptionskip\z@\@dblfloat{figure}}
              {\end@dblfloat}

% 
% 
% 
\newcounter{table}
\renewcommand{\thetable}{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\def\fnum@etable{Table~\thetable}
\newenvironment{table}
               {\@floatenv
\capwidth\hsize\ecapwidth\hsize
                \abovecaptionskip\z@\belowcaptionskip1mm\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@floatenv\capwidth.66\textwidth\ecapwidth.66\textwidth
                \abovecaptionskip\z@\belowcaptionskip1mm\@dblfloat{table}}
               {\end@dblfloat}



\def \@floatboxreset{%
\reset@font
\footnotesize\baselineskip16\h
\@setminipage
}

 \def\@floatenv{\let\center\Center}


\def\Center{\topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
 \trivlist \centering\item\relax}
\def\endCenter{\endtrivlist}




\long\def\@caption#1[#2]#3{\par
 \begingroup
  \@parboxrestore
  \if@minipage
   \@setminipage
  \fi
   \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
 \endgroup}

\newlength\abovecaptionskip
\newlength\belowcaptionskip

 
\newbox\@tempboxb
\newdimen\capwidth
\newdimen\ecapwidth
 

\long\def\@makecaption#1#2{\footnotesize%
 \vskip\abovecaptionskip
 \setbox\@tempboxa\hbox{\footnotesize{\bfseries%
#1}\hskip1\zw\shortstack[l]{#2}}%
 \@tempdima\ht\@tempboxa \advance \@tempdima\dp\@tempboxa%
 \setbox\@tempboxb\hbox{\footnotesize{\bfseries%
#1}\hskip1\zw}%% <<
 \ifdim \@tempdima > \baselineskip
  \ifdim \wd\@tempboxa > \capwidth
   \hfil\parbox[t]{\capwidth}{\hangindent\wd\@tempboxb 
{\bfseries%
    #1}\hskip1\zw #2}\vskip4\@Q
  \else
   \hfil\parbox[t]{\wd\@tempboxa}{\hangindent\wd\@tempboxb 
{\bfseries%
   #1}\hskip1\zw #2}%\vskip4\@Q
\par\prevdepth=0pt%
\vskip-1.5\h%
  \fi
 \else %% <
  \ifdim \wd\@tempboxa > \capwidth
   \hfil\parbox[t]{\capwidth}{\hangindent\wd\@tempboxb
{\bfseries%
    #1}\hskip1\zw #2}%\vskip4\@Q
%%%
\ifx \@captype\TABLE
      \par\prevdepth=0pt\vskip-1.5mm%
\else
      \par\prevdepth=0pt\vskip-1.5\h%
\fi
%%%
  \else
   \setbox\@tempboxb\hbox{#2}%
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
    \vspace{-\belowcaptionskip}
  \fi
 \fi
 \vspace{\belowcaptionskip}\par
}

 \long\def\ecaption#1{{\footnotesize%
 \setbox\@tempboxa\hbox{\footnotesize{\bfseries%
\csname fnum@e\@captype\endcsname}%
\hskip1\zw\shortstack[l]{#1}}%
 \@tempdima\ht\@tempboxa \advance \@tempdima\dp\@tempboxa
 \setbox\@tempboxb\hbox{\footnotesize{\bfseries%
\csname fnum@e\@captype\endcsname}\hskip1\zw}%% <<
%%%%%%%%%%%%
 \ifdim \@tempdima > \baselineskip
  \ifdim \wd\@tempboxa > \ecapwidth
   \hfil\parbox[t]{\ecapwidth}{\hangindent\wd\@tempboxb 
{\bfseries%
    \csname fnum@e\@captype\endcsname}\hskip1\zw #1}\par
  \else
   \hfil\parbox[t]{\wd\@tempboxa}{\hangindent\wd\@tempboxb 
{\bfseries%
    \csname fnum@e\@captype\endcsname}\hskip1\zw #1}\par
  \fi
%%%
 \else %% <
  \ifdim \wd\@tempboxa > \ecapwidth
   \hfil\parbox[t]{\ecapwidth}{\hangindent\wd\@tempboxb
{\bfseries%
    \csname fnum@e\@captype\endcsname}\hskip1\zw #1}\par
  \else
   \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
 \fi
 }%!!<---
  \vspace{2\belowcaptionskip}\par
 }



% 
%==================================================================================================
%
\leftmargini\Cwd
\leftmarginii.5\Cwd
\leftmarginiii2\Cwd
\leftmarginiv2\Cwd
\leftmarginv2\Cwd
\leftmarginvi2\Cwd

\def\lst@listi{\labelsep\Cwd \labelwidth.25\Cwd
	\rightmargin\z@ \listparindent\z@ \itemindent\z@
	\partopsep\z@ \parsep\z@ \topsep\z@ \itemsep\z@}


\def\@listi{\leftmargin\leftmargini \lst@listi}
\def\@listii{\leftmargin\leftmarginii \lst@listi}
\def\@listiii{\leftmargin\leftmarginiii \lst@listi}
\def\@listiv{\leftmargin\leftmarginiv \lst@listi}
\def\@listv{\leftmargin\leftmarginv \lst@listi}
\def\@listvi{\leftmargin\leftmarginvi \lst@listi}



\@listi

\def\labelenumi{(\,\theenumi\,)} 
\def\theenumi{\arabic{enumi}} 

\def\labelenumii{(\,\theenumii\,)}
\def\theenumii{\alph{enumii}}

\def\p@enumii{\theenumi}
\def\labelenumiii{(\,\theenumiii\,)}
\def\theenumiii{\roman{enumiii}}

\def\p@enumiii{\theenumi(\theenumii)}
\def\labelenumiv{(\,\theenumiv\,)}

\def\theenumiv{\Alph{enumiv}}
\def\p@enumiv{\p@enumiii\theenumiii}

\def\enumerate{\ifnum \@enumdepth >3 \@toodeep\else
	\advance\@enumdepth \@ne 
	\edef\@enumctr{enum\romannumeral\the\@enumdepth}
	\list{\csname label\@enumctr\endcsname}{\usecounter
		{\@enumctr}\def\makelabel##1{##1\hss}%
		\leftmargin2\Cwd \labelwidth2\Cwd \labelsep\z@
\itemsep\z@\topsep\z@\parsep\z@%%!!!
}\fi}


\let\endenumerate\endlist

\def\labelitemi{$\bullet$}
\def\labelitemii{\bf --}
\def\labelitemiii{$\ast$}
\def\labelitemiv{$\cdot$}


\def\itemize{\ifnum \@itemdepth >3 \@toodeep\else \advance\@itemdepth \@ne
	\edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
	\list{\csname\@itemitem\endcsname}{\def\makelabel##1{\hss##1\hss}%
		\labelwidth2\Cwd \labelsep\z@
\itemsep\z@\topsep\z@\parsep\z@%%!!!
}\fi}
\let\enditemize\endlist



\def\description{\list{}{\labelwidth\z@ \labelsep\Cwd
\itemsep\z@\topsep\z@\parsep\z@%%!!!
	\itemindent\labelsep \advance\itemindent-\leftmargin
	\def\makelabel##1{\bf ##1}}}
\let\enddescription\endlist


\let\latex@trivlist\@trivlist
\def\lst@trivlist#1#2{%
\itemsep\z@\topsep\z@\parsep\z@%%!!!
\leftmargin#1\relax
	\itemindent\labelwidth \advance\itemindent\labelsep
	\advance\itemindent#2\relax
	\let\@trivlist\latex@trivlist \@trivlist}

\def\lst@Trivlist{\def\@trivlist{\lst@trivlist\z@\z@}}
\def\Enumerate{\lst@Trivlist \enumerate}
\let\endEnumerate\endlist
\def\Itemize{\lst@Trivlist \itemize}
\let\endItemize\endlist
\def\Description{\lst@Trivlist \description}
\let\endDescription\endlist

\def\lst@TRIVLIST{\def\@trivlist{\lst@trivlist\z@\Cwd}}
\def\ENUMERATE{\lst@TRIVLIST \enumerate}
\let\endENUMERATE\endlist
\def\ITEMIZE{\lst@TRIVLIST \itemize}
\let\endITEMIZE\endlist
\def\DESCRIPTION{\lst@TRIVLIST \description}
\let\endDESCRIPTION\endlist

\def\lst@strivlist{\def\@trivlist{\lst@trivlist\Cwd{-\Cwd}}}
\@namedef{enumerate*}{\lst@strivlist \enumerate}
\@namedef{endenumerate*}{\endlist}
\@namedef{itemize*}{\lst@strivlist \itemize}
\@namedef{enditemize*}{\endlist}
\@namedef{description*}{\lst@strivlist \description}
\@namedef{enddescription*}{\endlist}




\def\verse{\let\\=\@centercr 
	\list{}{%
\itemsep\z@\topsep\z@\parsep\z@%%!!!
\itemindent-\Cwd \listparindent\itemindent 
	\rightmargin\leftmargin \advance\leftmargin\Cwd}\item[]}
\let\endverse\endlist

\def\quotation{\list{}{%
\itemsep\z@\topsep\z@\parsep\z@%%!!!
\listparindent\Cwd	\itemindent\listparindent
	\rightmargin\leftmargin}\item[]}
\let\endquotation\endlist

\def\quote{\list{}{\itemsep\z@\topsep\z@\parsep\z@%%!!!
\rightmargin\leftmargin}\item[]}
\let\endquote\endlist

\def\newtheorem{\@ifstar
	{\theo@newtheorem{\theo@it}{\ }}{\theo@newtheorem{}{\theo@sp}}}
\def\theo@newtheorem#1#2#3{\@namedef{theo@it@#3}{#1}\@namedef{theo@sp@#3}{#2}%
	\@ifnextchar[%]
		     {\@othm{#3}}{\@nthm{#3}}}
\def\@begintheorem#1#2{\DESCRIPTION \csname theo@it@\@currenvir\endcsname
	\item[#1\csname theo@sp@\@currenvir\endcsname #2]}
\def\@opargbegintheorem#1#2#3{\DESCRIPTION
	\csname theo@style@\@currenvir\endcsname
	\item[#1\csname theo@sp@\@currenvir\endcsname #2\ (#3)]}
\let\@endtheorem\endlist
\let\theo@it\relax \let\theo@sp\relax


%==================================================================================================



\newcommand{\refname}{参考文献}
\newdimen\bibindent
\setlength\bibindent{1.5em}
\def\@biblabel#1{[#1]}





\newenvironment{thebibliography}[1]
 {%
\small\baselineskip15\h % 12Qx15H
 \subsection*{{\normalsize%\footnotesize%
\refname}}%
\vspace*{2mm}%%

\def\@mklab##1{##1\hfil } % 

   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep
%
%         
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
         \parskip\z@
	 \topsep\z@\partopsep\z@
         \itemsep1\h
         \parsep\z@
%
   \sloppy
   \clubpenalty\z@
   \@clubpenalty\clubpenalty
   \widowpenalty\z@
   \sfcode`\.\@m
}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist\unskip}
%%%%
\let\@openbib@code\@empty




%==================================================================================================
\setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\footnotesep{10\h}%!!
%
\renewcommand{\footnoterule}{%
  \kern-4\p@
  \hrule width \columnwidth
  \kern 1.6\p@}

\let\footnotes@ve=\footnote
\def\footnote{\inhibitglue\footnotes@ve}
\let\footnotemarks@ve=\footnotemark
\def\footnotemark{\inhibitglue\footnotemarks@ve}


\def\thefootnote{\ifnum\c@footnote>\z@\leavevmode\lower.5ex\hbox{*}\@arabic\c@footnote\fi}

\long\def\@footnotetext#1{\insert\footins{%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{%
       \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}%

\def\footfont{\fontsize{11\JQ}{14\h}\normalfont\selectfont}

\long\def\@makefntext#1{\footfont%
\setbox\z@=\hbox{\makebox[1.58\Cwd][l]{\@makefnmark}}%

\def\par{{\@@par}}
\@tempdima\columnwidth
\advance\@tempdima-\wd\z@
\parshape 1 \wd\z@ \@tempdima
\parindent=1\zw
\noindent
\llap{\unhbox\z@}#1}




%==================================================================================================


\newdimen\mathindent
\AtEndOfClass{\mathindent1\zw}% \leftmargini
\renewcommand\[{\relax
                \ifmmode\@badmath
                \else
                 \parsep  4\p@ \@plus2\p@ \@minus\p@
                 \topsep  8\p@ \@plus2\p@ \@minus4\p@
                 \itemsep 4\p@ \@plus2\p@ \@minus\p@
                  \begin{trivlist}%
                    \@beginparpenalty\predisplaypenalty
                    \@endparpenalty\postdisplaypenalty
                    \item[]\leavevmode
                    \hb@xt@\linewidth\bgroup $\m@th\displaystyle %$
                      \hskip\mathindent\bgroup
                \fi}
\renewcommand\]{\relax
                \ifmmode
                      \egroup $\hfil% $
                    \egroup
                  \end{trivlist}%
                \else \@badmath
                \fi}
\renewenvironment{equation}%
    {\@beginparpenalty\predisplaypenalty
     \@endparpenalty\postdisplaypenalty
     \refstepcounter{equation}%
     \parsep  4\p@ \@plus2\p@ \@minus\p@
     \topsep  8\p@ \@plus2\p@ \@minus4\p@
     \itemsep 4\p@ \@plus2\p@ \@minus\p@
     \trivlist \item[]\leavevmode
       \hb@xt@\linewidth\bgroup $\m@th% $
         \displaystyle
         \hskip\mathindent}%
        {$\hfil % $
         \displaywidth\linewidth\hbox{\@eqnnum}%
       \egroup
     \endtrivlist}
\renewenvironment{eqnarray}{%
    \stepcounter{equation}%
    \parsep  4\p@ \@plus2\p@ \@minus\p@
    \topsep  8\p@ \@plus2\p@ \@minus4\p@
    \itemsep 4\p@ \@plus2\p@ \@minus\p@
    \def\@currentlabel{\p@equation\theequation}%
    \global\@eqnswtrue\m@th
    \global\@eqcnt\z@
    \tabskip\mathindent
    \let\\=\@eqncr
    \setlength\abovedisplayskip{\topsep}%
    \ifvmode
      \addtolength\abovedisplayskip{\partopsep}%
    \fi
    \addtolength\abovedisplayskip{\parskip}%
    \setlength\belowdisplayskip{\abovedisplayskip}%
    \setlength\belowdisplayshortskip{\abovedisplayskip}%
    \setlength\abovedisplayshortskip{\abovedisplayskip}%
    $$\everycr{}\halign to\linewidth% $$
    \bgroup
      \hskip\@centering
      $\displaystyle\tabskip\z@skip{##}$\@eqnsel&%
      \global\@eqcnt\@ne \hskip.8\arraycolsep \hfil${##}$\hfil&%
      \global\@eqcnt\tw@ \hskip.8\arraycolsep
        $\displaystyle{##}$\hfil \tabskip\@centering&%
      \global\@eqcnt\thr@@
        \hb@xt@\z@\bgroup\hss##\egroup\tabskip\z@skip\cr}%
      {\@@eqncr
    \egroup
    \global\advance\c@equation\m@ne$$% $$
    \@ignoretrue
    }

\def\@eqnnum{{\normalfont \normalcolor (\theequation)\hspace*{3mm}}}

%=============================================================================

\newcommand\appendixname{\protect\kintou{5zw}{付録}}




\newcommand\appendix{\par
\def\@seccntformatAPP##1{\csname the##1\endcsname\hskip1zw}
\vspace*{\Cvs}%
\renewcommand{\section}{\@startsectionAPP{section}{1}{\z@}%
{.00001\Cvs}% \@plus.3\Cdp \@minus.2\Cdp}% \@plus1.3\Cdp\@minus10.5\Cdp}%
{.00001\Cvs}% \@plus.3\Cdp \@minus.2\Cdp}%
{\reset@font
\fontsize{16\JQ}{21\h}\selectfont%
\bfseries\mathversion{bold}%
}}%
%-----------
\section*{\appendixname}
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{equation}{0}%
  \setcounter{figure}{0}%
  \setcounter{table}{0}%

\renewcommand\thesection{A.\@arabic\c@section}
\renewcommand\thesubsection{\thesection.\@arabic\c@subsection}
%
\renewcommand\theequation {A.\@arabic\c@equation}

\renewcommand \thefigure {{A$\cdot$\@arabic\c@figure}}
\renewcommand\thetable{{A$\cdot$\@arabic\c@table}}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\def\fnum@table{\tablename~\thetable}
\@addtoreset{equation}{section}
\@addtoreset{figure}{section}
\@addtoreset{table}{section}
}




%=============================================================================

\edef\zw{zw}

\let\Cite\cite



\if@twocolumn
  \setlength\leftmargini {2\Cwd}%
\else
  \setlength\leftmargini {2\Cwd}%
\fi


\if@twocolumn
  \setlength\marginparsep{5mm}
\else
  \setlength\marginparsep{5mm}
\fi


\if@twocolumn
  \twocolumn
  \sloppy
\else
  \onecolumn
\fi

\if@twoside
  \@mparswitchtrue
\else
  \@mparswitchfalse
\fi


\flushbottom
\sloppy



%% \doublerulesep is 1pt (H.N.)
\arraycolsep5pt 
\tabcolsep6pt
\arrayrulewidth.4pt
\doublerulesep1pt 
\tabbingsep.5\Cwd

\skip\@mpfootins\skip\footins
\fboxsep3pt \fboxrule.4pt 


%% SKIP
\def\onelineskip{\par\vspace{1\baselineskip}\par}
\def\halflineskip{\par\vspace{.5\baselineskip}\par}



%% kintou
\def\kintou#1#2{
\@ifundefined{jintercharskip}%
 {\leavevmode\hbox to #1{%
   \kanjiskip\z@ \@plus 1fill \@minus 1fill\xkanjiskip\kanjiskip #2}}%
 {\leavevmode\hbox to #1{\kanjiskip\z@ \@plus 1fill \@minus 1fill
   \jasciikanjiskip\kanjiskip #2}}%
}


%% runy
\def\ruby#1#2{\leavevmode \setbox0=\hbox{#1}\setbox1=\hbox{\tiny #2}%% <
 \ifdim\wd0>\wd1 \dimen0=\wd0 \else \dimen0=\wd1 \fi
 \hbox{\kanjiskip=\fill
 \vbox{\hbox to \dimen0{\tiny \hfil#2\hfil}%
  \nointerlineskip \hbox to \dimen0{\hfil#1\hfil}}}}

%% Proof end
\def\QED{{\unskip\nobreak\hfil\penalty50
 \hskip1\zw\hbox{}\nobreak\hfil \hbox{$\Box$\hskip1\zw}
 \parfillskip\z@ \finalhyphendemerits\z@\par}}



%% 
\def\Hline{\noalign{\hrule height 0.4mm}}



 \def\thepage{\the\c@page}


\hbadness4000
\vbadness10001
\tolerance4000\pretolerance\m@ne
\clubpenalty\z@
\widowpenalty\z@
\displaywidowpenalty\z@
\interdisplaylinepenalty\z@ %%  100
\predisplaypenalty\z@       %% 1000


\pagestyle{headings}





% %==================================================================================================
% %==================================================================================================
% 
% 
\def\long@fig{{\figurename~\nobreak}}
\def\short@fig{{\figurename~\nobreak}}
\def\long@figs{{\figurename~\nobreak}}
\def\short@figs{{\figurename~\nobreak}}

\def\long@tab{{\tablename~\nobreak}}
\def\short@tab{{\tablename~\nobreak}}
\def\long@tabs{{\tablename~\nobreak}}
\def\short@tabs{{\tablename~\nobreak}}
% 
% 
% 
\def\Figref{\bgroup\let\prefix@figtabref\long@fig
                   \@ifstar\figtabref@star\figtabref@}
\def\figref{\bgroup\let\prefix@figtabref\short@fig
                   \@ifstar\figtabref@star\figtabref@}
\def\Figsref{\bgroup\let\prefix@figtabref\long@figs
                   \@ifstar\figtabref@star\figtabref@}
\def\figsref{\bgroup\let\prefix@figtabref\short@figs
                   \@ifstar\figtabref@star\figtabref@}

\def\Tabref{\bgroup\let\prefix@figtabref\long@tab
                   \@ifstar\figtabref@star\figtabref@}
\def\tabref{\bgroup\let\prefix@figtabref\short@tab
                   \@ifstar\figtabref@star\figtabref@}
\def\Tabsref{\bgroup\let\prefix@figtabref\long@tabs
                   \@ifstar\figtabref@star\figtabref@}
\def\tabsref{\bgroup\let\prefix@figtabref\short@tabs
                   \@ifstar\figtabref@star\figtabref@}



\def\figtabref@star#1{\prefix@figtabref\ref{#1}\egroup}

\def\figtabref@#1{%
   \let\bf@or@normal\normalfont
   \@ifundefined{used@#1}{\expandafter\gdef\csname used@#1\endcsname{used}%
                          \let\bf@or@normal\bfseries}{\relax}%
   \bf@or@normal\prefix@figtabref\ref{#1}\egroup}
 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\def\urlj{%
\@ifnextchar[%% ]
{\n@urlj}
{\@urlj}
}

\def\n@urlj[#1]#2{%
\normalfont 
\if #11\relax
入手先\\ \else%
\fi
\normalfont $\langle$\nobreak{#2}\nobreak$\rangle$}

\def\@urlj#1{%
\normalfont 入手先$\langle$\nobreak{#1}\nobreak$\rangle$}


\def\urle{%
\@ifnextchar[%% ]
{\n@urle}
{\@urle}
}


\def\n@urle[#1]#2{%
\normalfont 
\if #11\relax
available \\ from \else%
\if #12\relax
available from \\ \else
\fi\fi
$\langle$\nobreak{#2}\nobreak$\rangle$}


\def\@urle#1{%
\normalfont available from $\langle$\nobreak{#1}\nobreak$\rangle$}


\def\acknowledgment{\par

   {\bfseries{謝辞}}%
\hskip1\zw\ignorespaces%
}



%====================================
% Dannuki-sita
%====================================

\newbox\@dummyfigbox

\def\twocolcaption{\refstepcounter\@captype \@dblarg{\@twocolcaption\@captype}}



\long\def\@twocolcaption#1[#2]#3{\par
 \begingroup
  \@parboxrestore
  \if@minipage
   \@setminipage
  \fi
\footnotesize%%
   \@maketwocolcaption{%
{\bfseries{\csname fnum@#1\endcsname}}}{\ignorespaces #3}\par
 \endgroup}


\newdimen\twocolcapwidth
\twocolcapwidth=.66\textwidth%130mm
\newdimen\twocolecapwidth
\twocolecapwidth=.66\textwidth%130mm


\long\def\@maketwocolcaption#1#2{%
 \vskip\abovecaptionskip
 \setbox\@tempboxa\hbox{#1\hskip1\zw\shortstack[l]{#2}}%
 \@tempdima\ht\@tempboxa \advance \@tempdima \dp\@tempboxa
 \setbox\@tempboxb\hbox{#1\hskip1\zw}%% <<
 \ifdim \@tempdima > \baselineskip
  \ifdim \wd\@tempboxa > \twocolcapwidth
   \hbox to\textwidth{\hfil\parbox[t]{\twocolcapwidth}{\hangindent\wd\@tempboxb 
    #1\hskip1\zw #2}\hfil}\vskip2\@Q
  \else
\hbox to\textwidth{\hss\parbox[t]{\wd\@tempboxa}{\hangindent\wd\@tempboxb 
    #1\hskip1\zw #2}\hss}
\vskip2\@Q
  \fi
 \else %% <
  \ifdim \wd\@tempboxa > \twocolcapwidth
   \hbox to\textwidth{\hfil\begin{tabular}{p{\twocolcapwidth}}\hangindent\wd\@tempboxb 
    #1\hskip1\zw #2\end{tabular}\hfil}\vskip2\@Q
  \else
   \setbox\@tempboxb\hbox{#2}%
   \hbox to\textwidth{\hfil\hbox to\twocolcapwidth
{\hss\box\@tempboxa\hss}\hfil}%

  \fi
 \fi
}



\def\TABLE{table}%%!!




\long\def\twocolecaption#1{\footnotesize%
 \setbox\@tempboxa%
\hbox{{\bfseries%
\csname fnum@e\@captype\endcsname}\hskip1\zw
  \shortstack[l]{#1}}%
 \@tempdima\ht\@tempboxa \advance \@tempdima \dp\@tempboxa
 \setbox\@tempboxb\hbox{{\bfseries%
\csname fnum@e\@captype\endcsname}\hskip1\zw}%% <<
 \ifdim \@tempdima > \baselineskip
  \ifdim \wd\@tempboxa > \twocolecapwidth
\hbox to\textwidth{\hss\parbox[t]{\twocolecapwidth}{\hangindent\wd\@tempboxb 
    {\bfseries%
\csname fnum@e\@captype\endcsname}\hskip1\zw #1}\hss}\par\prevdepth=0pt%
  \else
 \hbox to\textwidth{\hss\parbox[t]{\wd\@tempboxa}{\hangindent\wd\@tempboxb 
    {\bfseries%
\csname fnum@e\@captype\endcsname}\hskip1\zw #1}\hss}\par\prevdepth=0pt%%
\vskip5.9\h%
  \fi
 \else %% <
  \ifdim \wd\@tempboxa > \twocolecapwidth
\hbox to\textwidth{\hfil\begin{tabular}{p{\twocolecapwidth}}\hangindent\wd\@tempboxb 
    {\bfseries%
\csname fnum@e\@captype\endcsname}\hskip1\zw #1\end{tabular}\hfil}
\par\prevdepth=0pt%
\vskip3\h%
  \else
   \hbox to\textwidth{\hfil\hbox to\twocolcapwidth%
{\hss\box\@tempboxa\hss}\hfil}%
\vspace{\belowcaptionskip}\par
  \fi
 \fi
\ifx \@captype\TABLE
\vspace{1mm}%
\else
\fi
}








\def\twocolfig#1{%
\hbox to \columnwidth{%
\hbox to \textwidth{\hss
#1
\hss}\hss}}



\def\dummyfigure#1{%
 \begin{figure}[b]
 \vspace{#1}
 \vskip\abovecaptionskip
 \phantom{\box\@dummyfigbox}\par
 \end{figure}
}

\def\dummyfiguret#1{%
 \begin{figure}[t]
 \vspace{#1}
 \vskip\abovecaptionskip
 \phantom{\box\@dummyfigbox}\par
 \end{figure}
}

%====================================

\def\MARU#1{\raisebox{0.1zh}{{\rm
\ooalign{\hfil
\lower.168ex\hbox{\ifnum#1<10\relax {#1}\else \scalebox{.5}[1]{#1}\fi}%
\hfil\crcr
\mathhexbox20D}}}}


\def\ddash{\leavevmode \raise.1zh\hbox to 2zw{---\hss ---}}

\let\doubledash\ddash

% for ams
\AtBeginDocument{%
\mathindent1em%
\def\tagform@#1{\maketag@@@{(\ignorespaces#1\unskip\@@italiccorr)\hskip1\zw}}%!
}



%% sort cite
\def\@cite@itemsep{,\penalty\@m\ }
\def\@cite@firstdelim{}
\def\@cite@lastdelim{}

\def\@cite#1#2{%
   \ifvmode\leavevmode\fi\nobreak
   \if@tempswa\@cite@without@comment{#1}{#2}%
   \else      \@cite@with@comment{#1}%
   \fi}

\def\@cite@without@comment#1#2{%
   \@cite@firstdelim{#1, #2}\@cite@lastdelim}%

\def\@cite@with@comment#1{%
   \@cite@firstdelim{#1}\@cite@lastdelim
}

\def\@citex[#1]#2{%
   \let\@cite@reference@list\@empty
   \let\@cite@undefined@reference\@empty
   \@for\@tempa:=#2\do{%
      \edef\@tempa{\expandafter\@firstofone\@tempa\@empty}%
      \if@filesw
         \immediate\write\@auxout{\string\citation{\@tempa}}%
      \fi 
      \@ifundefined{b@\@tempa}%
      {\G@refundefinedtrue
          \@latex@warning{Citation `\@tempa' on page
          \thepage \space undefined}%
       \def\@cite@undefined@reference{%
           \@cite@put@itemsep
            \mbox{\reset@font\bfseries ?}}}%
       {\edef\@tempb{{\@nameuse{b@\@tempa}}}%     
        \expandafter\@append@list\expandafter         
           \@cite@reference@list\@tempb}}%
       \@simplify@list\@cite@reference@list
       \@ascending@sort@list\@cite@reference@list\@compare@num 
       \@cite{{\let\@elt\@cite@output@elt
               \def\@cite@put@itemsep{%
                  \def\@cite@put@itemsep{\@cite@itemsep}}%
                \@cite@reference@list
                \@cite@undefined@reference}}%
        {#1}}%


\def\@cite@output@elt#1{%
    \@cite@put@itemsep
    \bgroup[#1]\egroup
}

%%%%%%%%%%%%%%%
\def\@append@list#1#2{%
   \@addto@macro#1{\@elt{#2}}}%

\def\@addto@macro#1#2{%
   \expandafter\def\expandafter#1\expandafter{#1#2}}
       
\def\@simplify@list#1{%
   \begingroup
      \let\@templist\@empty
      \loop\ifx#1\@empty\else
         \@pop@list\@firstterm#1%
         \expandafter\@append@list\expandafter\@templist
             \expandafter{\@firstterm}%
         \expandafter\@remove@from@list\expandafter#1%
             \expandafter{\@firstterm}%
      \repeat
      \expandafter\endgroup\expandafter
         \def\expandafter#1\expandafter{\@templist}}

\def\@remove@from@list#1#2{%
    \begingroup
    \let\@templist\@empty
    \def\@to@be@removed{#2}%
    \let\@elt\@remove@from@list@elt
     #1%
    \expandafter\endgroup\expandafter
      \def\expandafter#1\expandafter{\@templist}}

\def\@remove@from@list@elt#1{%
   \def\@tempa{#1}%
   \ifx\@tempa\@to@be@removed\else
      \@append@list\@templist{#1}%
   \fi}%

\def\@pop@list#1#2{%
   \ifx#2\@empty\let#1\@empty
   \else        \expandafter\@pop@list@#2\@nil#1#2%
   \fi
}

\def\@pop@list@\@elt#1#2\@nil#3#4{%
    \def#3{#1}\def#4{#2}}


\newcount\@compare@result

\def\@compare@num#1#2{%
    \@compare@result#1\relax
    \advance\@compare@result-#2\relax
}

\def\@ascending@sort@list{\@sort@list<}
\def\@descending@sort@list{\@sort@list>}

\def\@sort@list#1#2#3{%
   \begingroup
   \let\@sort@templista\@empty
   \def\@elt##1{%
      \@addto@sorted@list#1\@sort@templista{#3}{##1}}%
   #2%
   \expandafter\endgroup\expandafter
      \def\expandafter#2\expandafter{\@sort@templista}}


\newif\if@ignore@same@item

\def\@addto@sorted@list#1#2#3#4{%
    \begingroup
    \let\@sort@templistb\@empty
    \def\@tempz{\@elt{#4}}%
    \def\@elt##1{%
        #3{##1}{#4}%
        \def\@tempa{\@elt{##1}}%
        \let\@tempb\@empty
        \ifnum\z@#1\@compare@result
           \@csc@t\@tempa\@tempz\@tempa
           \def\@tempb{\@addto@sorted@list@skip}%
        \else
            \ifnum\z@=\@compare@result
                \if@ignore@same@item
                     \def\@tempb{\@addto@sorted@list@skip}%
                \fi
            \fi
        \fi
        \@csc@t\@sort@templistb\@sort@templistb\@tempa
        \@tempb}%
     #2\@addto@sorted@list@{\@elt{#4}}%
     \expandafter\endgroup\expandafter
         \def\expandafter#2\expandafter{\@sort@templistb}}% 

\def\@addto@sorted@list@skip#1\@addto@sorted@list@#2{%
    \@addto@sorted@list@{#1}}

\def\@addto@sorted@list@#1{%
    \@addto@macro\@sort@templistb{#1}}

\def\@csc@t#1#2#3{%
   \expandafter\expandafter\expandafter\def
   \expandafter\expandafter\expandafter#1%
   \expandafter\expandafter\expandafter{%
   \expandafter#2#3}}




%%% kinsoku %%%
\postbreakpenalty`\`=\@M
\prebreakpenalty`'=\@M
\prebreakpenalty`)=\@M
\postbreakpenalty`(=\@M
\prebreakpenalty`]=\@M
\postbreakpenalty`[=\@M
\prebreakpenalty`\}=\@M
\postbreakpenalty`\{=\@M

\prebreakpenalty`・=\@M
\prebreakpenalty`：=\@M
\prebreakpenalty`；=\@M
\prebreakpenalty`？=\@M
\prebreakpenalty`！=\@M

\prebreakpenalty\jis"212D=\@M		% ´
\postbreakpenalty\jis"212E=\@M		% ｀
\postbreakpenalty\jis"2146=\@M		% ‘
\prebreakpenalty\jis"2147=\@M		% ’
\postbreakpenalty\jis"2148=\@M		% “
\prebreakpenalty\jis"2149=\@M		% ”

\prebreakpenalty`）=\@M
\postbreakpenalty`（=\@M
\prebreakpenalty`｝=\@M
\postbreakpenalty`｛=\@M
\prebreakpenalty`］=\@M
\postbreakpenalty`［=\@M
\postbreakpenalty`‘=\@M
\prebreakpenalty`’=\@M

\postbreakpenalty\jis"214C=\@M		%〔
\prebreakpenalty\jis"214D=\@M		% 〕
\postbreakpenalty\jis"2152=\@M		% 〈
\prebreakpenalty\jis"2153=\@M		% 〉
\postbreakpenalty\jis"2154=\@M		% 《
\prebreakpenalty\jis"2155=\@M		% 》
\postbreakpenalty\jis"2156=\@M		% 「
\prebreakpenalty\jis"2157=\@M		% 」
\postbreakpenalty\jis"2158=\@M		% 『
\prebreakpenalty\jis"2159=\@M		% 』
\postbreakpenalty\jis"215A=\@M		% 【
\prebreakpenalty\jis"215B=\@M		% 】

\prebreakpenalty`ー=\@M						% 2.12(6)
\prebreakpenalty`〜=\@M						% 2.12(6)

\prebreakpenalty`ぁ=\@M
\prebreakpenalty`ぃ=\@M
\prebreakpenalty`ぅ=\@M
\prebreakpenalty`ぇ=\@M
\prebreakpenalty`ぉ=\@M
\prebreakpenalty`っ=\@M
\prebreakpenalty`ゃ=\@M
\prebreakpenalty`ゅ=\@M
\prebreakpenalty`ょ=\@M
\prebreakpenalty\jis"246E=\@M		% ゎ
\prebreakpenalty`ァ=\@M
\prebreakpenalty`ィ=\@M
\prebreakpenalty`ゥ=\@M
\prebreakpenalty`ェ=\@M
\prebreakpenalty`ォ=\@M
\prebreakpenalty`ッ=\@M
\prebreakpenalty`ャ=\@M
\prebreakpenalty`ュ=\@M
\prebreakpenalty`ョ=\@M
\prebreakpenalty\jis"256E=\@M		% ヮ
\prebreakpenalty\jis"2575=\@M		% ヵ
\prebreakpenalty\jis"2576=\@M		% ヶ


\def\：{\makebox[1zw][l]{：}}

\def\zdash{{\usefont{OT1}{cmr}{bx}{n}\selectfont\leavevmode \raise.1zh\hbox {---}}}

\def\ndash{{\usefont{OT1}{cmr}{bx}{n}\selectfont\leavevmode \raise.1zh\hbox {--}}}

\endinput






