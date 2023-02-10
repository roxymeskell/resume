% RESUME DOCUMENT STYLE
% Copyright (C) 2019 by Roxanna Meskell

\typeout{Document Style `resume' <24 Apr 19>.}


\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{resume}[2019/04/24 Resume]
\LoadClass[10pt]{article}
\reversemarginpar % Puts the section titles on left side of page

\RequirePackage{kvoptions}

\RequirePackage[
    paper=letterpaper, margin=.4in,
    headheight=1.2em, headsep=0.75em, includehead
]{geometry}

%% OPTIONS
% Show frame / bounding boxes?
% Is coverletter..?
%  * Center on page?
% Font size?
%  * Header font size
%  * Header info font size
%  * Header info subfont size
% Margins?
% Section title width?
% SeperationAnsd

\DeclareBoolOption[false]{showluaboxes}
\DeclareBoolOption[false]{showframe}
\DeclareBoolOption[false]{showboundingboxes}

\DeclareBoolOption[true]{resume}
\DeclareComplementaryOption{coverletter}{resume}

\ProcessKeyvalOptions*


%% SET UP PAGE
\ifresume@resume
    %\setlength{\headeroffset}{\marginparwidth + \marginparsep}
    \geometry{
        top=.4in, right=.4in, left=.4in, bottom=0in,
        marginparwidth=1.4in,  % Length of section titles
        marginparsep=.05in,    % Space between titles and text
        includemp,
        headheight=22.70006pt, headsep=-3.20008pt
    }
    %\reversemarginpar % Puts the section titles on left side of page
\else
    \setlength{\headeroffset}{.85in}
    \geometry{
        top=.4in, bottom=.79in, right=1.25in, left=1.25in,
        headheight=0.25in, headsep=0.14in
        %headheight=22.70006pt, headsep=-3.20008pt
    }
\fi

\ifresume@showluaboxes%
  \ifx
  \directlua\pgf@gd@undefined@donotuse{%
    \errmessage{Cannot draw boxes if not using LuaLatex.}%
  }%
  \else
  \directlua{ require("drawboxes")}%
  \RequirePackage{graphicx,atbegshi}%
  \AtBeginShipout {\directlua{drawboxes.visual_debug()}}%
  \fi%
\fi%



%% SET UP FRAME / BOUND BOXES IF SHOWN
\ifresume@showframe\geometry{showframe}\fi
\ifresume@showboundingboxes
% SHOWS MARGIN AND OTHER BOUNDING BOXES FROM RESUME
\RequirePackage{tikz}
\RequirePackage[pages=all]{background}
\RequirePackage{color}

% 1em = 10pt = 0.13847in...?
% Baselineskip=12pt ~= 0.207705in ~- .2in
% -(1in + \topmargin) = -1in-\topmargin = -.4in
% (\oddsidemargin + 1in) - (\marginparwidth + \marginparsep) = side margins
\backgroundsetup{
scale=1,
color=black,
opacity=0.6,
angle=0,
contents={%
  %\resizebox{\paperwidth}{\painperheight}{%
    \begin {tikzpicture}
      %%% GRID %%%
      \draw[gray, step=1em] (0,0) grid (\paperwidth,-\paperheight);
      %%%%%%%%%%%%
      %\message{^^JTMargin: \tmargin \top^^J}
      \draw[red](0,-1in-\topmargin) -- ++ (\paperwidth,0);
      %\draw[blue](0,-1in-\topmargin-18pt-1.2pt) -- ++ (\paperwidth,0);
      %\draw[blue](0,-1in-\topmargin-25.30011pt) -- ++ (\paperwidth,0);
      \draw[purple](0,-1in-\topmargin-\headheight) -- ++ (\paperwidth,0);
      %\draw[purple](0,-1in-\topmargin-1.2em) -- ++ (\paperwidth,0);
      \draw[green](0,-1in-\topmargin-\headheight-\headsep) -- ++ (\paperwidth,0);
      %\draw[green](0,-1in-\topmargin-1.95em) -- ++ (\paperwidth,0);
      %\draw[blue](0,-1in-\topmargin-\headheight-\headsep-\topskip) -- ++ (\paperwidth,0);
      %
      %\draw[blue](0,-.65in) -- ++ (\paperwidth,0);
      %\draw[blue](0,-0.4in-1.2em-6pt) -- ++ (\paperwidth,0); % 1.5\baselineskip
      %\draw[green](0,-0.65in-0.07in) -- ++ (\paperwidth,0);
      %
      %
      \draw[red](\oddsidemargin + 1in - \marginparwidth - \marginparsep,0) -- ++ (0, -\paperheight);
      \draw[green](\paperwidth - \oddsidemargin - 1in + \marginparwidth + \marginparsep,0) -- ++ (0, -\paperheight);
      \draw[purple](\oddsidemargin + 1in - \marginparsep,0) -- ++ (0, -\paperheight);
      \draw[cyan](\oddsidemargin + 1in,0) -- ++ (0, -\paperheight);
      \draw[blue](0,0) -- ++ (\paperwidth,-\paperheight);
    \end {tikzpicture}
    %}%
  }%
}
\fi



%% REQUIRE PACKAGES
\PassOptionsToPackage{resume}{headings}
\RequirePackage{headings}
\PassOptionsToPackage{showboundingboxes}{colHelper}
\RequirePackage{colHelper}
\ifresume@resume
    \RequirePackage{resutil}
    \RequirePackage{projects}
    \RequirePackage{workexp}
    \RequirePackage{extracurr}
    \RequirePackage{skills}
\fi

%\setlength{\headheight}{37.3001pt}

%% OPTIONS AFTER LOADING
% Need to set name
% Need to set location
% Need to set phone
% Need to set email
% Need to set github
% Need to set linkedin
% All of the above part of header
