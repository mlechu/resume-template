\ProvidesClass{resume-class}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dependencies
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\LoadClass{article}

\usepackage[
  % showframe, % add "showframe" to check h alignment
  noheadfoot, 
  nomarginpar, 
  hmargin=\dimexpr2\tabcolsep, 
  vmargin=0cm
]{geometry} 
\usepackage{nopageno}
\usepackage[hidelinks]{hyperref}
\usepackage{colortbl} % for coloured horizontal lines
\usepackage{enumitem}\setlist{nosep} % Makes lists more compact and the first list's spacing consistent with the rest
\usepackage{titlesec} % Consistent section title formatting
\usepackage{xcolor} % Colors
\usepackage{fontspec} % Fonts
\usepackage{fontawesome5} % Icons
\usepackage{bookmark} % to get rid of some warning 
\usepackage{graphicx} % to insert photos with advanced options
\usepackage{tikz} % just for the external link icon lol
\usepackage{lipsum} % to generate filler text


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spacing constants
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\arraystretch}{0.75}  % vertical cell spacing
\setlength{\tabcolsep}{4pt}         % horizontal cell padding, used as a reference through whole document
\setlength{\arrayrulewidth}{1.5pt}  % table borders
\setlength\parindent{0pt}           % pesky indents

% Couldn't figure out how to fill the "rest of the page" after the header. This number will need to be changed if the header changes height.
\newlength{\MagicVFill} \setlength{\MagicVFill}{701.8pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colours
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{MainTheme}{HTML}{2b2b2b}
\definecolor{LightTheme}{HTML}{707070}
\definecolor{LeftTheme}{HTML}{003166}
\definecolor{RightTheme}{HTML}{40B4E5}
% \definecolor{LeftTheme}{HTML}{40B4E5}
% \definecolor{RightTheme}{HTML}{003166}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setmainfont{SourceSansPro}[
  Path = fonts/source-sans-pro/,
  Scale = 1,
  UprightFont = *-Light,
  BoldFont = *-Regular,
  ItalicFont = *-LightItalic,
  BoldItalicFont = *-Italic,
  Color = MainTheme
] 

% \newfontfamily\MyFont{FontFilePrefix} [Path = fonts/myfont/, Scale=?, UprightFont= *-Reg]
% where regular font file is called FontFilePrefix-Reg

% \newfontfamily\RalewayFont{Raleway}  [Path = fonts/raleway/,  Scale = MatchUppercase, UprightFont = *-Medium,  BoldFont = *-Bold,    ItalicFont = *-Italic,      BoldItalicFont = *-BoldItalic]
% \newfontfamily\RobotoFont{Roboto}         [Path = fonts/roboto/,   Scale = MatchUppercase, UprightFont = *-Regular, BoldFont = *-Bold,    ItalicFont = *-Italic,      BoldItalicFont = *-BoldItalic]
% \newfontfamily\RobotoFont{Roboto}    [Path = fonts/roboto/,   Scale = MatchUppercase, UprightFont = *-Light, BoldFont = *-Medium,    ItalicFont = *-LightItalic,      BoldItalicFont = *-Italic]

\newfontfamily\OpenSansFont{OpenSans}     [Path = fonts/opensans/, Scale = MatchUppercase, UprightFont = *-Regular, BoldFont = *-Bold,    ItalicFont = *-Italic,      BoldItalicFont = *-BoldItalic]
\newfontfamily\OpenSansLightFont{OpenSans}[Path = fonts/opensans/, Scale = MatchUppercase, UprightFont = *-Light, BoldFont = *-SemiBold,    ItalicFont = *-LightItalic,      BoldItalicFont = *-SemiBoldItalic]

\newfontfamily\SourceSansProFont{SourceSansPro}[Path = fonts/source-sans-pro/, Scale = MatchUppercase, UprightFont = *-Regular, BoldFont = *-SemiBold,    ItalicFont = *-Italic,      BoldItalicFont = *-BoldItalic]
\newfontfamily\SourceSansProLightFont{SourceSansPro}[Path = fonts/source-sans-pro/, Scale = MatchUppercase, UprightFont = *-Light, BoldFont = *-Regular,    ItalicFont = *-LightItalic,      BoldItalicFont = *-SemiBoldItalic]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section and subsection formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \newcommand{\myline}{\par
%   \hrule height \arrayrulewidth
% }

% \titlespacing{command}{left spacing}{above spacing}{below spacing}[right]

% \titleformat{<command>}[<shape>]{
  % <format>
% }{<label>}{<sec> indent??}{<before-code>}[<after-code>]


% Headings (Experience, projects, skills)
\titlespacing{\section}{0pt}{0\tabcolsep}{0\tabcolsep} % space under sections

\titleformat{\section}{
  \color{RightTheme}
  \fontsize{15pt}{24pt}
  \selectfont
  \SourceSansProFont
  \raggedright
  \uppercase
}{}{0pt}{}[]
  
  
% Subheadings (Job 1, job 2, project 1, project 2)
\titlespacing{\subsection}{0pt}{1.5\tabcolsep}{1\tabcolsep} % ^ subsections

\titleformat{\subsection}[runin]{
  \color{MainTheme}
  \bfseries % Must be high up in this list
  \fontsize{11pt}{10pt}
  \selectfont
  % \RobotoFont
  \SourceSansProFont
  \raggedright
  \uppercase
}{}{0pt}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Name at the top
\newcommand{\BigName}[1]{{%
  \raggedright
  \color{LeftTheme}
  \fontsize{30pt}{0pt}
  \selectfont
  % \SourceSansProLightFont
  \fontspec[Path = fonts/opensans/]{OpenSans-Light}
  \uppercase{
    \mbox{#1}%
  }
}}

% Header Linkedin, github, etc
% Args: {link}{text}
\newcommand{\LittleLink}[2]{
  {%
    \raggedright
    \color{MainTheme}
    \selectfont
    % \OpenSansFont
    \SourceSansProFont
    \href{#1}{#2}
  }%
}

\newcommand{\SubsectionAndLocation}[2]{
  \raggedright
  \subsection{#1}%
  {%
    \raggedleft
    \hfill
    \Location{#2}
  }\\%
}

\newcommand{\DetailAndDate}[2]{
  \raggedright
  \Detail{#1}%
  {%
    \raggedleft
    \hfill
    \Date{#2}
  }\\%
}

% Date (tiny boi)
\newcommand{\Location}[1]{{
  \color{MainTheme}
  % \color{LightTheme}
  % \itshape
  \fontsize{8pt}{0pt}
  \selectfont
  % \RobotoFont
  \SourceSansProFont
  \mbox{\*#1}%
}}

% Date (tiny boi)
\newcommand{\Date}[1]{{%
  % \color{LightTheme}
  \color{MainTheme}
  \itshape
  \fontsize{8pt}{0pt}
  \selectfont
  % \RobotoFont
  \SourceSansProLightFont
  \mbox{\*#1}%
}}

% Detail line right under company/project name
\newcommand{\Detail}[1]{{%
  \raggedright
  % \color{LightTheme}
  \color{MainTheme}
  \itshape
  \fontsize{10pt}{0pt}
  \selectfont 
  % \OpenSansFont
  \SourceSansProFont
  {#1}%
}}

% stands for code monkey
\newcommand{\cm}[1]{%
  {%
  \color{LeftTheme}
  \bfseries
  \selectfont
  % \OpenSansLightFont
  \SourceSansProLightFont
  {#1}%
  }%
}

% White text for a "last updated" or similar
\definecolor{WhiteTheme}{HTML}{FFFFFF}
\newcommand{\Sneaky}[1]{
  {%
    \raggedright
    \color{WhiteTheme}
    \fontsize{8pt}{0pt}
    \SourceSansProFont
    \selectfont
    {#1}%
  }%
}

\newcommand{\LinkIcon}{%
  \tikz[x=1.3ex, y=1.3ex, baseline=-0.05ex]{% 
    \begin{scope}[x=1ex, y=1ex]
      \clip (-0.1,-0.1) 
        --++ (-0, 1.2) 
        --++ (0.6, 0) 
        --++ (0, -0.6) 
        --++ (0.6, 0) 
        --++ (0, -1);
      \path[draw, 
        line width = 0.6, 
        rounded corners=0.5] 
        (0,0) rectangle (1,1);
    \end{scope}
    \path[draw, line width = 0.5] (0.4, 0.4) 
      -- (1, 1);
    \path[draw, line width = 0.5] (0.6, 1) 
      -- (1, 1) -- (1, 0.6);
    }‎
    % there is a zero-width space after the bracket on the above line
    % it's a hack to extend the clickable portion of the link around the link icon
  ‎}