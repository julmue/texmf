\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myLetter}[2016/12/03 My Letter Class]

\LoadClass[
  fontsize=11pt,
  paper=a4,
  parskip=half,
  enlargefirstpage=on,    % More space on first page
  fromalign=right,        % PLacement of name in letter head
  fromphone=on,           % Turn on phone number of sender
  fromrule=aftername,     % Rule after sender name in letter head
  addrfield=on,           % Adress field for envelope with window
  backaddress=on,         % Sender address in this window
  subject=beforeopening,  % Placement of subject
  locfield=narrow,        % Additional field for sender
  foldmarks=on,           % Print foldmarks
  fromemail=on            % Email adress
]{scrlttr2}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrlttr2}}
\ProcessOptions\relax

% Language
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[german]{babel}

% Font
\usepackage{microtype}
\usepackage[osf,sc]{mathpazo}
\usepackage{microtype}
\linespread{1.05}

% Letter configuration
\LoadLetterOption{DIN}
\setkomavar{backaddressseparator}{\enspace\textperiodcentered\enspace}
\setkomavar{enclseparator}{: }
% \setkomavar{fromname}{\value}

% Color
\RequirePackage{xcolor}
\usepackage{mySummerColors}
\addtokomafont{backaddress}{\normalfont}
\addtokomafont{fromname}{\color{magma}}
\addtokomafont{subject}{\color{magma}}
\color{textgray}

% Signature to the left
\renewcommand*{\raggedsignature}{\raggedright}

% Misc
\RequirePackage{blindtext}

% Someone from the interwebs told me how to capitalize the subject
\RequirePackage{etoolbox}
\RequirePackage{textcase}

\patchcmd{\@subjfield}
  {\usekomavar{subject}}
  {\textls[160]{\MakeUppercase{\usekomavarexp{subject}}}}
  {}{}
\newcommand\usekomavarexp[1]{\@nameuse{scr@#1@var}}
