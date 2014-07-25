%
% foithesis.cls v.0.02
%
% A LaTeX2e template for the Faculty of Organization and Informatics
% Varazdin, Croatia (http://www.foi.hr)
%
% date:   28.09.2009.
% author: Markus Schatten

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{foi}[2011/10/28 Faculty of Organization and Informatics Thesis template class]

\LoadClass{report}


\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}

\usepackage[margin=3cm]{geometry}

\usepackage{listings}
\usepackage{color}

\usepackage[croatian]{babel}
\usepackage[utf8x]{inputenc}
\usepackage{url}
\usepackage[pdftex]{graphicx}
\DeclareGraphicsExtensions{.png,.pdf,.jpg,.jpeg}
\usepackage{sfmath}
\renewcommand{\rmdefault}{\sfdefault}
\renewcommand{\scdefault}{\sfdefault}

\usepackage[pdftex,
bookmarks=true,
bookmarksnumbered=true,
pdfpagemode=UseNone,
pdfstartview=FitH,
pdfpagelayout=SinglePage,
colorlinks=false,
urlcolor=black,
pdfborder={0 0 0}
]{hyperref}

% headers and footers includes for your document
\usepackage{fancyheadings}

% count the number of pages for display on footer
\usepackage{lastpage}

\usepackage{setspace}

\usepackage{ifthen}

\newcommand{\naslov}{Proaktivni agent koji igra single player igru}
\newcommand{\kolegij}{Višeagentni sustavi}
\newcommand{\autorA}{LorenaTomić}
\newcommand{\brIndeksaA}{41686}
\newcommand{\brojAutora}{1}
\newcommand{\vrstaRada}{Projekt}

\newcommand{\mentor}{Doc. dr. sc. Markus Schatten}

\newcommand{\fakultet}{\includegraphics[width=0.7\textwidth]{FOI.jpg}}
\newcommand{\grad}{Vara\v{z}din}

%document headers and footers
\lhead{ \naslov ~-- \vrstaRada}
\chead{}
\rhead{  }
\lfoot{Kolegij: \kolegij}
\cfoot{}
\rfoot{\thepage/\pageref{LastPage}} % \today -> \rfoot{\number\month/\number\day/\number\year} 
\pagestyle{fancyplain}

\def\authorblock[#1]#2{\textbf{\normalsize #1} \\#2}
\def\brin#1{\normalsize br. indeksa: #1}

\newcommand{\autori}[1]
{
\ifthenelse{\equal{#1}{1}}{
	\authorblock[\autorA]{
	\brin{\brIndeksaA}}}{}

\ifthenelse{\equal{#1}{2}}{
	\authorblock[\autorA]{
	\brin{\brIndeksaA}} \\
	\authorblock[\autorB]{
	\brin{\brIndeksaB}}}{}

\ifthenelse{\equal{#1}{3}}{
	\authorblock[\autorA]{
	\brin{\brIndeksaA}} \\
	\authorblock[\autorB]{
	\brin{\brIndeksaB}} \\
	\authorblock[\autorC]{
	\brin{\brIndeksaC}}}{}

\ifthenelse{\equal{#1}{4}}{
	\authorblock[\autorA]{
	\brin{\brIndeksaA}} \\
	\authorblock[\autorB]{
	\brin{\brIndeksaB}} \\
	\authorblock[\autorC]{
	\brin{\brIndeksaC}} \\
	\authorblock[\autorD]{
	\brin{\brIndeksaD}}}{}

\ifthenelse{\equal{#1}{5}}{
	\authorblock[\autorA]{
	\brin{\brIndeksaA}} \\
	\authorblock[\autorB]{
	\brin{\brIndeksaB}} \\
	\authorblock[\autorC]{
	\brin{\brIndeksaC}} \\
	\authorblock[\autorD]{
	\brin{\brIndeksaD}} \\
	\authorblock[\autorE]{
	\brin{\brIndeksaE}}}{}

\ifthenelse{\equal{#1}{6}}{
	\authorblock[\autorA]{
	\brin{\brIndeksaA}} \\
	\authorblock[\autorB]{
	\brin{\brIndeksaB}} \\
	\authorblock[\autorC]{
	\brin{\brIndeksaC}} \\
	\authorblock[\autorD]{
	\brin{\brIndeksaD}} \\
	\authorblock[\autorE]{
	\brin{\brIndeksaE}} \\
	\authorblock[\autorF]{
	\brin{\brIndeksaF}}}{}
}

\renewcommand{\maketitle}
{
\thispagestyle{empty}
\begin{center}
\sc{\fakultet} \\
\vspace{0.3\pdfpageheight}
\textbf{\sc{\Huge{\naslov}}} \\
\sc{\large{\vrstaRada}} \\
\end{center}
\vfill
\noindent
\begin{minipage}{\textwidth}
\begin{minipage}{0.3\textwidth}
\begin{flushleft}
    \autori{\brojAutora}
\end{flushleft}
\end{minipage}
\hfill
\begin{minipage}{0.5\textwidth}
\begin{flushright}
    Mentor: \\ 
    \textbf{\mentor}
\end{flushright}
\end{minipage}
\vspace{0.1\pdfpageheight}
\vfill
\centering{\sc{{\grad}, \@date}}
\end{minipage}
\normalfont
\newpage
\setcounter{page}\@ne
}

\usepackage{natbib}
\bibliographystyle{foi} % plainnat
\bibpunct{(}{)}{,}{a}{,}{;}


