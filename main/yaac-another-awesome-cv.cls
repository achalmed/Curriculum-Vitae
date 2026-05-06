%% =============================================================================
%% YAAC: Another Awesome CV — Clase de documento LaTeX
%% =============================================================================
%%
%% Autor original: Christophe Roger (Darwiin)
%% Repositorio:    https://github.com/darwiin/yaac-another-awesome-cv
%% Licencia:       LaTeX Project Public License v1.3c o superior
%%                 https://www.latex-project.org/lppl.txt
%%
%% Adaptado y comentado en español por: Edison Achalma (achalmaedison)
%% Licencia de adaptación: CC BY-SA 4.0
%%                         https://creativecommons.org/licenses/by-sa/4.0/
%%
%% MOTOR REQUERIDO: LuaLaTeX o XeLaTeX
%%   Compilar con ene terminal:  
%%   lualatex cv.tex
%%   biber cv     # solo si usas bibliografía
%%   lualatex cv.tex
%%   lualatex cv.tex
%%
%% CORRECCIÓN APLICADA (2024):
%%   Se eliminó \RequirePackage[utf8]{luainputenc} porque es incompatible
%%   con fontspec en LuaLaTeX/XeLaTeX. Estos motores ya manejan UTF-8
%%   de forma nativa, por lo que luainputenc no es necesario y genera
%%   conflictos irresolubles.
%%
%% =============================================================================


%% agregar pdfs
\RequirePackage{pdfpages}

%% =============================================================================
%% 1. IDENTIFICACIÓN DE LA CLASE
%% =============================================================================

\ProvidesClass{yaac-another-awesome-cv}
[2020/03/24 v2.3.1 'YAAC: Another Awesome CV' — Clase de CV profesional]


%% =============================================================================
%% 2. OPCIONES DE TAMAÑO DE FUENTE BASE
%% =============================================================================
%% Opciones disponibles: 10pt (defecto), 11pt, 12pt
%% Ejemplo: \documentclass[11pt]{yaac-another-awesome-cv}

\def\@@ptsize{10pt}

\DeclareOption{10pt}{\def\@@ptsize{10pt}}   % Tamaño de fuente 10 puntos (por defecto)
\DeclareOption{11pt}{\def\@@ptsize{11pt}}   % Tamaño de fuente 11 puntos
\DeclareOption{12pt}{\def\@@ptsize{12pt}}   % Tamaño de fuente 12 puntos

\ProcessOptions\relax


%% =============================================================================
%% 3. CLASE BASE
%% =============================================================================
%% Se carga la clase 'article' estándar con papel A4 y el tamaño de fuente
%% elegido mediante la opción correspondiente.

\LoadClass[a4paper,\@@ptsize]{article}


%% =============================================================================
%% 4. OPCIONES DE COMPORTAMIENTO Y DISEÑO
%% =============================================================================

%% Bandera: mostrar bordes en los hipervínculos (por defecto: ocultos)
\newif\if@showLinks   \@showLinksfalse

%% Bandera: modo compacto (reduce espaciado vertical en experiencias)
\newif\if@isCompact   \@isCompactfalse

%% --- Opciones de color del acento principal ---
%% Solo una de estas opciones debe usarse a la vez.
%% Si no se especifica ninguna, el color por defecto es azul oscuro (#000066).

\DeclareOption{green}{
	% Color verde esmeralda: rgb(0.0, 0.62, 0.38)
	\def\@green{green}
}

\DeclareOption{red}{
	% Color rojo oscuro: #b30000
	\def\@red{red}
}

\DeclareOption{indigo}{
	% Color índigo oscuro: rgb(0.2, 0.07, 0.48)
	\def\@indigo{indigo}
}

\DeclareOption{orange}{
	% Color naranja dorado: #e68a00
	\def\@orange{orange}
}

\DeclareOption{monochrome}{
	% Color negro puro: #000000 (sin color de acento)
	\def\@monochrome{monochrome}
}

%% --- Opciones de fuente ---

\DeclareOption{localFont}{
	% Usar las fuentes incluidas en la subcarpeta fonts/ del proyecto
	% en lugar de las fuentes instaladas en el sistema operativo.
	\def\@local{local}
}

%% --- Opciones de diseño del encabezado ---

\DeclareOption{alternative}{
	% Usar el diseño alternativo del encabezado:
	% nombre + lema a la izquierda, foto a la derecha.
	\def\@alternative{alternate}
}

%% --- Otras opciones de comportamiento ---

\DeclareOption{showLinks}{
	% Mostrar bordes de color en los hipervínculos (útil para depuración)
	\@showLinkstrue
}

\DeclareOption{compact}{
	% Activar modo compacto: reduce el espacio vertical entre entradas
	% de experiencia, útil cuando el CV no cabe en una sola página.
	\@isCompacttrue
}

\ProcessOptions


%% =============================================================================
%% 5. PAQUETES REQUERIDOS
%% =============================================================================
%%
%% NOTA IMPORTANTE sobre la codificación de caracteres:
%% -------------------------------------------------------
%% Al compilar con LuaLaTeX o XeLaTeX, NO se debe usar inputenc ni
%% luainputenc. Estos motores modernos gestionan UTF-8 de forma nativa
%% a través de fontspec. Usar ambos simultáneamente genera conflictos
%% irresolubles (el error que motivó esta corrección).
%%
%% Regla de oro:
%%   pdflatex  → usar inputenc        (pero NO es compatible con fontspec)
%%   lualatex  → NO usar inputenc     (fontspec + UTF-8 nativo)
%%   xelatex   → NO usar inputenc     (fontspec + UTF-8 nativo)

%% Soporte multilingüe: español e inglés
\RequirePackage[spanish,es-nodecimaldot]{babel}

%% ↓↓↓ LÍNEA ELIMINADA — incompatible con fontspec en LuaLaTeX/XeLaTeX ↓↓↓
%\RequirePackage[utf8]{luainputenc}
%% ↑↑↑ Esta línea causaba el error de conflicto de paquetes ↑↑↑

%% Gestión avanzada de fuentes (requiere LuaLaTeX o XeLaTeX)
\RequirePackage{fontspec}

%% Manejo de URLs y espaciado entre párrafos
\RequirePackage{url,parskip}

%% Sistema de colores extendido (nombres de colores y modo dvipsnames)
\RequirePackage[usenames,dvipsnames]{xcolor}

%% Márgenes de página completos (base)
\RequirePackage{fullpage}

%% Control preciso de márgenes de página
\RequirePackage[margin=1.5cm]{geometry}

%% Iconos de Font Awesome 5 (versión con anchos fijos)
\RequirePackage[fixed]{fontawesome5}

%% Hipervínculos clicables en el PDF (URLs, emails, etc.)
\RequirePackage{hyperref}

%% Formateo de títulos de sección personalizados
\RequirePackage{titlesec}

%% Tipos de columna adicionales para tablas
\RequirePackage{array}

%% Configuración de listas (itemize, enumerate)
\RequirePackage{enumitem}

%% Tablas que pueden abarcar múltiples páginas
\RequirePackage{longtable}

%% Utilidades de programación LaTeX (ifundef, ifdef, etc.)
\RequirePackage{etoolbox}

%% Gráficos vectoriales y diagramas (usado para la foto de perfil)
\RequirePackage{tikz}

%% Cajas con estilos visuales avanzados (skin overzoom para foto)
\RequirePackage[skins]{tcolorbox}

%% Encabezados y pies de página personalizados
\RequirePackage{fancyhdr}

%% Condicionales ifthenelse (usado para selección de forma de foto)
\RequirePackage{ifthen}


%% =============================================================================
%% 6. COMPATIBILIDAD DE CARACTERES UNICODE solo para pdfLaTeX
%% =============================================================================
%% Declaramos manualmente algunos caracteres especiales para asegurar
%% compatibilidad en casos donde babel o fontspec puedan tener conflictos.

%\DeclareUnicodeCharacter{00E9}{\'{e}}   % é — letra e con acento agudo

%% =============================================================================
%% 7. DEFINICIÓN DE COLORES
%% =============================================================================
%% Color de acento principal: se selecciona según la opción de clase usada.
%% Si no se especifica ninguna opción de color, se usa azul oscuro por defecto.

\definecolor{basecolor}{HTML}{000066}       % Azul oscuro (color por defecto)

%% Lógica de selección de color (prioridad: green > red > indigo > orange > monochrome > default)
\ifundef{\@green} {
	\ifundef{\@red} {
		\ifundef{\@indigo}{
			\ifundef{\@orange} {
				\ifundef{\@monochrome} {}
				{ \definecolor{basecolor}{HTML}{000000} }    % Negro (monochrome)
			}
			{ \definecolor{basecolor}{HTML}{e68a00} }      % Naranja
		}
		{ \definecolor{basecolor}{rgb}{0.2, 0.07, 0.48} } % Índigo
	}
	{ \definecolor{basecolor}{HTML}{b30000} }            % Rojo oscuro
}
{ \definecolor{basecolor}{rgb}{0.0, 0.62, 0.38} }     % Verde esmeralda

%% Color gris oscuro: usado para bordes de etiquetas (cvtag)
\definecolor{darkGrey}{HTML}{989898}

%% Colores derivados del color base (variantes de luminosidad)
\colorlet{linkcolor}{basecolor}          % Color para hipervínculos
\colorlet{accentcolor}{linkcolor!90}     % Color de acento (ligeramente más claro)
\colorlet{symbolcolor}{linkcolor!85}     % Color para iconos sociales


%% =============================================================================
%% 8. CONFIGURACIÓN DE HIPERVÍNCULOS
%% =============================================================================
%% Según la opción 'showLinks', se muestran o se ocultan los bordes de los links.

\if@showLinks
	\hypersetup{%
		breaklinks    % Permitir saltos de línea dentro de URLs largas
	}%
\else
	\hypersetup{%
		pdfborder = {0 0 0},   % Sin borde visible en los hipervínculos
		breaklinks             % Permitir saltos de línea dentro de URLs largas
	}%
\fi


%% =============================================================================
%% 9. CONFIGURACIÓN DE ENCABEZADOS Y PIES DE PÁGINA
%% =============================================================================

\fancyhf{}              % Limpiar todos los campos de encabezado y pie
\fancyhfoffset{0em}     % Sin desplazamiento lateral

%% Eliminar la línea horizontal del encabezado
\renewcommand{\headrulewidth}{0pt}

%% Activar el estilo fancy en todas las páginas
\pagestyle{fancy}

%% Opciones alternativas comentadas para referencia:
%% \pagestyle{empty}   → páginas sin numeración ni encabezado
%% \fancyfoot[C]{\thepage}  → número de página centrado en el pie


%% =============================================================================
%% 10. CONFIGURACIÓN DE SECCIONES
%% =============================================================================
%% Las secciones del CV tienen un estilo visual particular:
%%   - Texto grande alineado a la izquierda
%%   - Línea horizontal decorativa debajo del título

\titleformat{\section}{\Large\raggedright}{}{0em}{}[\titlerule]
\titlespacing{\section}{0pt}{2pt}{2pt}
%% Parámetros de titlespacing: {comando}{sangría izq.}{espacio antes}{espacio después}


%% =============================================================================
%% 11. CONFIGURACIÓN DE LISTAS
%% =============================================================================
%% Las listas usan el icono de flecha de Font Awesome como viñeta.

\setlist[itemize,1]{label=\faAngleRight, nosep, leftmargin=2em}
%% Nivel 1: flecha derecha, sin separación extra, sangría de 2em
\setlist[itemize,2]{label=\faAngleRight, nosep, leftmargin=1.5em}
%% Nivel 2 (sublistas): igual pero con sangría de 1.5em


%% =============================================================================
%% 12. NUEVOS TIPOS DE COLUMNA PARA TABLAS
%% =============================================================================

%% Columna R{ancho}: contenido alineado a la derecha, con ancho fijo
\newcolumntype{R}[1]{>{\hfill}m{#1}}

%% Columna Y: alineación a la derecha, con ancho igual a la columna izquierda del CV
\newcolumntype{Y}{>{\raggedleft}p{\leftcolumnlength}}

%% Columna E: alineación a la izquierda (con ajuste automático), ancho de columna derecha
\newcolumntype{E}{>{\raggedright\arraybackslash}p{\rightcolumnlength}}


%% =============================================================================
%% 13. REGLAS DE SEPARACIÓN SILÁBICA
%% =============================================================================
%% Regla de separación silábica en inglés para la palabra "corporations"
%% (herencia del template original)

\hyphenation{im-pre-se}


%% =============================================================================
%% 14. CONFIGURACIÓN DE FUENTES TIPOGRÁFICAS
%% =============================================================================
%%
%% Se usa fontspec para cargar fuentes OpenType/TrueType.
%% La fuente principal es Source Sans Pro Light (diseño limpio y moderno).
%%
%% Según la opción 'localFont':
%%   - Sin localFont → busca la fuente instalada en el sistema
%%   - Con localFont  → carga la fuente desde la carpeta fonts/ del proyecto

%% Características tipográficas globales (mapeo de ligaduras y caracteres especiales)
\defaultfontfeatures{Ligatures=TeX}

\ifundef{\@local}
{
	%% Fuente del sistema operativo (debe estar instalada globalmente)
	%% Alternativa comentada para Helvetica Neue:
	%% \setmainfont[BoldFont=Helvetica Neue, ItalicFont=Helvetica Neue Thin Italic,
	%%              SmallCapsFont=Helvetica Neue Light]{Helvetica Neue Thin}
	\setmainfont{Source Sans Pro Light}[
		BoldFont  = SourceSansPro-Regular,
		ItalicFont = Source Sans Pro Light Italic
	]
}
{
	%% Fuente local desde la carpeta fonts/ del proyecto
	\setmainfont{SourceSansPro-Light}[
		Path = fonts/,
		BoldFont   = SourceSansPro-Regular,
		ItalicFont = SourceSansPro-LightIt
	]
}


%% =============================================================================
%% 15. LONGITUDES Y DIMENSIONES DE LA MAQUETACIÓN
%% =============================================================================

%% Ancho total del área de contenido (sin márgenes de página)
\newlength{\fulllength}
\setlength{\fulllength}{17.8cm}

%% Ancho de la columna izquierda (fechas / etiquetas)
%% Valor por defecto: 2.5cm — recomendado entre 1.5cm y 2.5cm
\newlength{\leftcolumnlength}
\setlength{\leftcolumnlength}{2.5cm}

%% Ancho de la columna derecha (descripciones): calculado automáticamente
\newlength{\rightcolumnlength}
%\setlength{\rightcolumnlength}{15.3cm minus 1cm}
%\setlength{\rightcolumnlength}{\dimexpr(\fulllength-\leftcolumnlength)\relax}
\setlength{\rightcolumnlength}{\dimexpr(\fulllength-\leftcolumnlength)\relax}

%% Líneas comentadas con métodos alternativos de cálculo (para referencia):
%% \setlength{\rightcolumnlength}{15.3cm minus 1cm}
%% \setlength{\rightcolumnlength}{\dimexpr(\fulllength-\leftcolumnlength)\relax}


%% =============================================================================
%% 16. COMANDO PARA AJUSTAR LA COLUMNA IZQUIERDA
%% =============================================================================
%% Permite cambiar el ancho de la columna izquierda desde el documento principal.
%% Al cambiar la columna izquierda, la derecha se recalcula automáticamente.
%%
%% Uso: \setleftcolumnlength{2.0cm}

\newcommand{\setleftcolumnlength}[1]{
	\setlength{\leftcolumnlength}{#1}
	\setlength{\rightcolumnlength}{\dimexpr(\fulllength-\leftcolumnlength)\relax}
}


%% =============================================================================
%% 17. ALIAS DE ICONOS FONT AWESOME
%% =============================================================================
%% Estos alias permiten cambiar fácilmente los iconos usados en el CV
%% sin modificar el código que los utiliza.

\newcommand{\mailSymbol}{\faAt}                  % Icono de correo electrónico
\newcommand{\locationSymbol}{\faMapMarker*}      % Icono de ubicación/mapa
\newcommand{\infoSymbol}{\faInfo}                % Icono de información general
\newcommand{\linkedinSymbol}{\faLinkedinIn}      % Icono de LinkedIn
\newcommand{\viadeoSymbol}{\faViadeo}            % Icono de Viadeo
\newcommand{\mobileSymbol}{\faMobile*}           % Icono de teléfono móvil
\newcommand{\githubSymbol}{\faGithub}            % Icono de GitHub
\newcommand{\stackoverflowSymbol}{\faStackOverflow}   % Icono de Stack Overflow
\newcommand{\stackexchangeSymbol}{\faStackExchange}   % Icono de Stack Exchange
\newcommand{\mediumSymbol}{\faMedium}            % Icono de Medium
\newcommand{\bitbucketSymbol}{\faBitbucket}      % Icono de Bitbucket
\newcommand{\websiteSymbol}{\faLink}             % Icono de sitio web genérico
\newcommand{\linkSymbol}{\faLink}                % Icono de enlace


%% =============================================================================
%% 18. COMANDOS DE UTILIDAD GENERAL
%% =============================================================================

%% \link{url}{texto} — Hipervínculo con color de acento
%% Uso: \link{https://ejemplo.com}{texto visible}
\newcommand\link[2]{\color{linkcolor}\href{#1}{#2}\color{Black}}

%% \important{texto} — Texto en negrita (para resaltar información clave)
%% Uso: \important{Texto importante}
\newcommand\important[1]{\textbf{#1}}


%% =============================================================================
%% 19. ETIQUETAS DE TECNOLOGÍA (cvtag)
%% =============================================================================
%% Crea una etiqueta visual con borde redondeado, similar a los "chips" o "badges"
%% usados para listar tecnologías, herramientas o competencias al final
%% de cada entrada de experiencia o proyecto.
%%
%% Uso: \cvtag{Python}  \cvtag{R}  \cvtag{LaTeX}

\newcommand{\cvtag}[1]{%
	\tikz[baseline]\node[
		anchor      = base,
		draw        = darkGrey!70,        % Borde gris oscuro (70% opacidad)
		rounded corners = 0.5ex,          % Esquinas redondeadas
		inner xsep  = 1ex,                % Relleno horizontal interno
		inner ysep  = 0.55ex,             % Relleno vertical interno
		text height = 1.3ex,              % Altura del texto (alineación vertical)
		text depth  = .25ex               % Profundidad del texto
	]{#1};
}


%% =============================================================================
%% 20. COMANDOS DE INFORMACIÓN DEL AUTOR
%% =============================================================================

%% \user{nombre}{apellido} — Renderiza el nombre completo del autor
%% Uso: \user{Elmer}{Achalma} → nombre grande en color de acento con apellido en versalitas
\newcommand\user[2]{%
	\color{accentcolor}{\LARGE #1 \textsc{\textbf{#2}}}\color{Black}
}

%% \socialtext{icono}{texto} — Texto de contacto con icono (sin hipervínculo)
%% Uso: \socialtext{\locationSymbol}{Ayacucho, Perú}
\newcommand{\socialtext}[2]{%
	\mbox{\textcolor{symbolcolor}{#1}#2\hspace{0.8em}}
}

%% \sociallink{icono}{url}{texto} — Enlace de contacto con icono (con hipervínculo)
%% Uso: \sociallink{\githubSymbol}{https://github.com/usuario}{github.com/usuario}
\newcommand{\sociallink}[3]{%
	\mbox{\textcolor{symbolcolor}{#1}\link{#2}{#3}\hspace{0.8em}}
}

%% --- Macros para definir los datos del autor ---

%% \name{nombre}{apellido} — Define el nombre completo (OBLIGATORIO)
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}

%% \firstname{nombre} — Define solo el nombre
\newcommand*{\firstname}[1]{\def\@firstname{#1}}

%% \lastname{apellido} / \familyname{apellido} — Define solo el apellido
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

%% \tagline{texto} — Define el lema o título profesional (OBLIGATORIO)
%% Ejemplo: \tagline{Economista | Data Science | Investigación}
\newcommand*{\tagline}[1]{\def\@tagline{#1}}

%% \photo[forma]{diámetro}{archivo} — Define la foto de perfil (OPCIONAL)
%% Formas disponibles: circular (defecto), square, roundedsquare, squircle
%% Ejemplo: \photo[circular]{2.5cm}{mi_foto}
\newcommand{\photo}[3][circular]{%
	\def\@photo{#3}%
	\def\@photodiameter{#2}%
	\def\@photoshape{#1}%
}


%% =============================================================================
%% 21. MACROS DE REDES SOCIALES E INFORMACIÓN DE CONTACTO
%% =============================================================================
%% Todos estos comandos se usan dentro de \socialinfo{...}

%% \address{dirección} — Dirección postal con icono de mapa
\newcommand*{\address}[1]{\socialtext{\locationSymbol}{#1}}

%% \infos{texto} — Información adicional (ubicación, fecha de nacimiento, etc.)
\newcommand*{\infos}[1]{\socialtext{\infoSymbol}{#1}}

%% \linkedin{usuario} — Perfil de LinkedIn
%% Genera: linkedin.com/in/usuario
\newcommand*{\linkedin}[1]{%
	\sociallink{\linkedinSymbol}{https://www.linkedin.com/in/#1/fr}{linkedin.com/in/#1}
}

%% \personalLink{url} — Sitio web personal (sin http://)
%% Ejemplo: \personalLink{mi-sitio.com}
\newcommand*{\personalLink}[1]{%
	\sociallink{\linkSymbol}{http://#1}{#1}
}

%% \viadeo{usuario} — Perfil de Viadeo
\newcommand*{\viadeo}[1]{%
	\sociallink{\viadeoSymbol}{https://www.viadeo.com/fr/profile/#1}{viadeo.com/fr/profile/#1}
}

%% \github{usuario} — Perfil de GitHub
%% Genera: github.com/usuario
\newcommand*{\github}[1]{%
	\sociallink{\githubSymbol}{https://www.github.com/#1}{github.com/#1}
}

%% \stackoverflow{id} — Perfil de Stack Overflow
\newcommand*{\stackoverflow}[1]{%
	\sociallink{\stackoverflowSymbol}{https://www.stackoverflow.com/u/#1}{stackoverflow.com/u/#1}
}

%% \stackexchange{id} — Perfil de Stack Exchange
\newcommand*{\stackexchange}[1]{%
	\sociallink{\stackexchangeSymbol}{https://stackexchange.com/users/#1}{stackexchange.com/users/#1}
}

%% \medium{usuario} — Perfil de Medium
\newcommand*{\medium}[1]{%
	\sociallink{\mediumSymbol}{https://www.medium.com/@#1}{medium.com/#1}
}

%% \bitbucket{usuario} — Perfil de Bitbucket
\newcommand*{\bitbucket}[1]{%
	\sociallink{\bitbucketSymbol}{https://bitbucket.com/#1}{bitbucket.com/#1}
}

%% \email{correo} — Dirección de correo electrónico clicable
\newcommand*{\email}[1]{%
	\sociallink{\mailSymbol}{mailto:#1}{#1}
}

%% \website{url}{texto} — Enlace a sitio web con texto personalizado
\newcommand*{\website}[2]{%
	\sociallink{\websiteSymbol}{#1}{#2}
}

%% \smartphone{número} — Número de teléfono móvil
\newcommand*\smartphone[1]{\socialtext{\mobileSymbol}{#1}}

%% \socialinfo{contenido} — Contenedor de toda la información social/contacto
%% Se usa en el preámbulo del documento y se renderiza en el encabezado.
\newcommand{\socialinfo}[1]{\def\@socialinfo{#1}}


%% =============================================================================
%% 22. RENDERIZADO DEL LEMA / TÍTULO PROFESIONAL
%% =============================================================================
%% El comportamiento varía según la opción de diseño activa:
%%   - Sin 'alternative': el lema aparece centrado debajo del nombre
%%   - Con 'alternative': el lema aparece junto al nombre (diseño compacto)

\newcommand\resumetitle[1]{
	\ifundef{\@alternative}{
		%% Diseño tradicional: lema centrado en su propia línea
		\par{
			\bigskip
			\center{\Large \color{accentcolor}\textbf{#1}\color{Black}}
			\par
		}
		\bigskip
	}{
		%% Diseño alternativo: lema en línea, tamaño ligeramente menor
		\color{accentcolor}\textbf{\large{#1}}\color{black}
	}
}


%% =============================================================================
%% 23. RENDERIZADO DE LA FOTO DE PERFIL
%% =============================================================================
%% Dibuja la foto del autor en la forma seleccionada mediante la opción
%% de \photo[forma]{...}{...}. Usa TikZ con el skin 'overzoom' de tcolorbox.

\newcommand\idphoto{
\ifthenelse{\equal{\@photoshape}{square}}{
%% Foto cuadrada
\tikz\path[fill overzoom image={\@photo}]rectangle(\linewidth,\linewidth);
}{
\ifthenelse{\equal{\@photoshape}{roundedsquare}}{
%% Foto cuadrada con esquinas redondeadas (radio: 2mm)
\tikz\path[fill overzoom image={\@photo}][rounded corners=2mm]rectangle(\linewidth,\linewidth);
}{
\ifthenelse{\equal{\@photoshape}{squircle}}{
%% Foto cuadrada con esquinas muy redondeadas — aspecto "squircle" (radio: 8mm)
\tikz\path[fill overzoom image={\@photo}][rounded corners=8mm]rectangle(\linewidth,\linewidth);
}{
%% Foto circular (forma por defecto)
\tikz\path[fill overzoom image={\@photo}]circle[radius=0.5\linewidth];
}}}
}


%% =============================================================================
%% 24. ENCABEZADO DEL CV (\makecvheader)
%% =============================================================================
%% Genera el bloque de encabezado completo: nombre, lema, foto e info de contacto.
%% Requiere que estén definidos: \@firstname, \@lastname, \@tagline, \@socialinfo
%%
%% Uso en el documento: \makecvheader

\newcommand*{\makecvheader}{
\ifundef{\@alternative}{
%% -------------------------------------------------------
%% Diseño TRADICIONAL: nombre + info de contacto a la izquierda
%%                     foto a la derecha (si se definió)
%% -------------------------------------------------------
\ifundef{\@photodiameter}{
	%% Sin foto: minipage de ancho completo
	\begin{minipage}{\linewidth}
}{
	%% Con foto: minipage reducida para dejar espacio a la foto
	\begin{minipage}{\dimexpr\linewidth-\@photodiameter-2em}
		}
		\color{accentcolor}\user{\@firstname}{\@lastname}\color{black}\\
		\small{\@socialinfo}
	\end{minipage}
	%% Foto de perfil (solo si se definió con \photo)
	\ifdef{\@photodiameter}{
		\begin{minipage}{\@photodiameter}
			\idphoto
		\end{minipage}
	}{}
	%% Lema / título profesional centrado debajo
	\resumetitle{\@tagline}
}{
	%% -------------------------------------------------------
	%% Diseño ALTERNATIVO: nombre + lema + info a la izquierda
	%%                     foto a la derecha (si se definió)
	%% -------------------------------------------------------
	\ifundef{\@photodiameter}{
		%% Sin foto: minipage de ancho completo
		\begin{minipage}{\linewidth}
	}{
		%% Con foto: minipage reducida
		\begin{minipage}{\dimexpr\linewidth-\@photodiameter-2em}
			}
			\user{\@firstname}{\@lastname}\\
			\resumetitle{\@tagline}
			\smallskip\\
			\small{\@socialinfo}
		\end{minipage}
		%% Foto de perfil (solo si se definió)
		\ifdef{\@photodiameter}{
			\begin{minipage}{\@photodiameter}
				\idphoto
			\end{minipage}
		}{}
		\bigskip
	}
}


%% =============================================================================
%% 25. PIE DE PÁGINA DEL CV (\makecvfooter)
%% =============================================================================
%% Define el contenido del pie de página con tres zonas: izquierda, centro, derecha.
%%
%% Uso: \makecvfooter{texto izquierda}{texto centro}{texto derecha}
%% Ejemplo del documento principal:
%%   \makecvfooter{\today}{Elmer Achalma - CV}{\thepage}

\newcommand*{\makecvfooter}[3]{%
	\fancyfoot{}           % Limpiar pie de página previo
	\fancyfoot[L]{#1}      % Zona izquierda del pie (ej: fecha)
	\fancyfoot[C]{#2}      % Zona central del pie (ej: nombre del autor)
	\fancyfoot[R]{#3}      % Zona derecha del pie (ej: número de página)
}


%% =============================================================================
%% 26. TÍTULOS DE SECCIÓN (\sectionTitle)
%% =============================================================================
%% Renderiza el título de una sección del CV con un icono de Font Awesome
%% y el texto en versalitas. El icono aparece a la izquierda del texto.
%%
%% Uso: \sectionTitle{Experiencia Profesional}{\faBriefcase}

\newcommand\sectionTitle[2]{%
	\section{%
	  \texorpdfstring{%
		  \color{accentcolor}#2\enspace \textsc{#1}%  % Versión visual: icono + texto en color
	  }{#1}%                                         % Versión para PDF/bookmarks: solo texto
	 }%
}


%% =============================================================================
%% 27. ENTORNO 'keywords' — Tabla de palabras clave / resumen
%% =============================================================================
%% Tabla de dos columnas para presentar categorías y sus valores correspondientes.
%% Columna izquierda: etiqueta en negrita (categoría)
%% Columna derecha:   valor o descripción

\newenvironment{keywords}{%
	\renewcommand{\arraystretch}{1.1}    % Aumentar ligeramente el espaciado entre filas
	\begin{tabular}{>{}r>{}p{13cm}}
		}{%
	\end{tabular}
}

%% \keywordsentry{etiqueta}{valor} — Entrada en el entorno keywords
%% Uso: \keywordsentry{Área}{Economía del Desarrollo}
\newcommand\keywordsentry[2]{
	\textbf{#1} & #2\\
}


%% =============================================================================
%% 28. ENTORNO 'scholarship' — Formación académica
%% =============================================================================
%% Tabla de dos columnas para listar títulos académicos, becas, cursos, etc.
%% Columna izquierda: fecha o período (alineado a la derecha)
%% Columna derecha:   descripción del grado o reconocimiento

\newenvironment{scholarship}{%
	\begin{tabular}{Y p{\rightcolumnlength}}
		}{%
	\end{tabular}
}

%% \scholarshipentry{fecha}{descripción} — Entrada de formación académica
%% Uso: \scholarshipentry{2018 -- 2023}{Economía, Universidad Nacional de San Cristóbal de Huamanga}
\newcommand\scholarshipentry[2]{
	#1 & #2 \\
}


%% =============================================================================
%% 29. ENTORNO 'skills' — Habilidades con nivel de dominio
%% =============================================================================
%% Tabla de dos columnas con longtable (puede abarcar múltiples páginas).
%% Columna izquierda: nombre de la habilidad
%% Columna derecha:   nivel representado con 5 círculos de Font Awesome

\newenvironment{skills}{%
	\begin{longtable}{R{\leftcolumnlength}p{\rightcolumnlength}}
		}{%
	\end{longtable}
}

%% \skill{nombre}{nivel} — Entrada de habilidad con indicador de nivel (1–5)
%% Uso: \skill{Python}{4}   → 4 círculos rellenos + 1 vacío
\newcommand\skill[2]{
	\textbf{#1} &
	\foreach \x in {1,...,5}{%
			{\color{accentcolor!80}
					\ifnumgreater{\x}{#2}{\faCircle[regular]}{\faCircle}%
					%% Si \x > nivel: círculo vacío; si \x <= nivel: círculo relleno
				}\enspace
		} \\
}


%% =============================================================================
%% 30. ENTORNO 'experiences' — Experiencia profesional
%% =============================================================================
%% Tabla de dos columnas con longtable y línea vertical separadora.
%% Columna izquierda: fechas (alineadas a la derecha)
%% Columna derecha:   título, empresa, descripción y tecnologías usadas

\newenvironment{experiences}{%
	\begin{longtable}{R{\leftcolumnlength}|E}
		}{%
	\end{longtable}
}

%% \experience{...} — Entrada de experiencia profesional
%%
%% Parámetros (en orden):
%%   #1: Fecha de fin        (ej: "Dic. 2023" o "Actualidad")
%%   #2: Título del cargo    (ej: "Economista Senior")
%%   #3: Nombre de empresa   (ej: "MEF")
%%   #4: País / Ciudad       (ej: "Lima, Perú")
%%   #5: Fecha de inicio     (ej: "Mar. 2021")
%%   #6: Descripción         (puede contener listas itemize)
%%   #7: Lista de tecnologías/herramientas (separadas por comas)
%%
%% Ejemplo de uso:
%%   \experience
%%     {Actualidad}   {Docente a tiempo parcial}{UNSCH}{Ayacucho}
%%     {2022}         {Descripción de actividades}
%%                    {R, Python, LaTeX, Stata}

\newcommand\experience[7]{
	\textbf{#1} & \textbf{#2, \textsc{#3}, #4}                \\*
	\textbf{#5} & \begin{minipage}[t]{\rightcolumnlength}
		#6
	\end{minipage}                               \\*
	& \footnotesize{\foreach \n in {#7}{\cvtag{\n}}} \\
}

%% \consultantexperience{...} — Experiencia como consultor en empresa cliente
%%
%% Parámetros (en orden):
%%   #1: Fecha de fin
%%   #2: Título como consultor
%%   #3: Empresa consultora
%%   #4: País / Ciudad
%%   #5: Fecha de inicio
%%   #6: Título en la empresa cliente
%%   #7: Nombre de la unidad de negocio cliente
%%   #8: Descripción
%%   #9: Lista de tecnologías
%%
%% Ejemplo de uso:
%%   \consultantexperience
%%     {2023}{Consultor Económico}{Firma XYZ}{Lima}
%%     {2022}{Analista}{Ministerio de Economía}
%%     {Descripción del trabajo realizado}
%%     {Excel, Python, SIAF}

\newcommand\consultantexperience[9]{
	\textbf{#1} & \textbf{#2, \textsc{#3}, #4}         \\*
	\textbf{#5} & \emph{#6} pour \textsc{#7}            \\*
	& \begin{minipage}[t]{\rightcolumnlength}
		#8
	\end{minipage}                         \\*
	& \footnotesize{\foreach \n in {#9}{\cvtag{\n}}} \\
}


%% =============================================================================
%% 31. SEPARADOR VACÍO EN TABLAS DE EXPERIENCIA
%% =============================================================================
%% Agrega espacio visual entre dos entradas consecutivas de experiencia.
%% En modo compacto, el espacio es mínimo; en modo normal, es más generoso.

\if@isCompact
	%% Modo compacto: separador con espacio negativo (muy comprimido)
	\newcommand\emptySeparator{\multicolumn{2}{c}{}\\[-0.6em]}
\else
	%% Modo normal: separador con espacio estándar
	\newcommand\emptySeparator{\multicolumn{2}{c}{}\\}
\fi


%% =============================================================================
%% 32. ENTORNO 'projects' — Proyectos personales o académicos
%% =============================================================================
%% Tabla de una sola columna con longtable.
%% Cada proyecto ocupa toda la fila, con nombre, fechas, descripción y tecnologías.

\newenvironment{projects}{%
	\begin{longtable}{l}
		}{%
	\end{longtable}
}

%% \project{...} — Entrada de proyecto
%%
%% Parámetros (en orden):
%%   #1: Nombre del proyecto
%%   #2: Período / fechas        (ej: "2022 -- 2023")
%%   #3: Enlace(s) al proyecto   (ej: \link{url}{texto})
%%   #4: Descripción del proyecto
%%   #5: Lista de tecnologías    (separadas por comas)
%%
%% Ejemplo de uso:
%%   \project
%%     {Análisis de Pobreza Regional}{2023}
%%     {\link{https://github.com/...}{Ver en GitHub}}
%%     {Descripción del proyecto}
%%     {R, ggplot2, dplyr, LaTeX}

\newcommand\project[5]{
	\begin{minipage}[t]{\dimexpr(\linewidth) - 1.5em}
		\textbf{\textsc{#1}} \hfill \textsc{#2}\smallskip\\
		#3\\
		#4\smallskip\\
		\footnotesize{\foreach \n in {#5}{\cvtag{\n}}}\\
	\end{minipage}
	\\*
}


%% =============================================================================
%% 33. COMANDO 'twocolumnsection' — Sección en dos columnas
%% =============================================================================
%% Divide una sección horizontalmente en dos bloques de igual tamaño.
%% Útil para presentar dos listas o grupos de información en paralelo.
%%
%% Uso:
%%   \twocolumnsection{
%%     \begin{skills}...\end{skills}
%%   }{
%%     \begin{skills}...\end{skills}
%%   }

\newcommand*\twocolumnsection[2]{
	\begin{minipage}[t]{\dimexpr(\linewidth/2) - 3em}
		#1
	\end{minipage}
	\hfill
	\begin{minipage}[t]{\dimexpr(\linewidth/2) - 3em}
		#2
	\end{minipage}
}


%% =============================================================================
%% 34. ENTORNO 'referees' — Referencias profesionales
%% =============================================================================
%% Contenedor para las tarjetas de referencia.
%% No aplica formateo especial al inicio, pero añade espacio al final.

\newenvironment{referees}{%
	%% Inicio: sin formateo adicional
}{%
	\hfill
	\bigskip
}

%% \referee{nombre}{cargo}{empresa}{email}{teléfono} — Tarjeta de referencia completa
%%
%% Uso:
%%   \referee{Dr. Juan Pérez}{Jefe de Departamento}{UNSCH}
%%           {j.perez@unsch.edu.pe}{+51 987 654 321}

\newcommand*\referee[5]{
	\hspace{1em}
	\begin{minipage}[t]{\dimexpr(\linewidth/3) - 3em}
		\begin{tabular}{>{}l >{}l}
			\multicolumn{2}{l}{\textbf{#1}}            \\  % Nombre completo
			\multicolumn{2}{l}{\emph{#2}, \textsc{#3}} \\  % Cargo, Empresa
			\quad \mailSymbol & \href{mailto:#4}{#4}   \\  % Email clicable
			\quad \faPhone    & #5                     \\  % Teléfono
		\end{tabular}
	\end{minipage}%
}

%% \refereeMailOnly{nombre}{cargo}{empresa}{email} — Tarjeta de referencia (solo email)
%%
%% Uso cuando no se dispone del teléfono del referente:
%%   \refereeMailOnly{Dra. María López}{Directora}{MEF}{m.lopez@mef.gob.pe}

\newcommand*\refereeMailOnly[4]{
	\hspace{1em}
	\begin{minipage}[t]{\dimexpr(\linewidth/3) - 3em}
		\begin{tabular}{>{}l >{}l}
			\multicolumn{2}{l}{\textbf{#1}}            \\  % Nombre completo
			\multicolumn{2}{l}{\emph{#2}, \textsc{#3}} \\  % Cargo, Empresa
			\quad \mailSymbol & \href{mailto:#4}{#4}   \\  % Email clicable
		\end{tabular}
	\end{minipage}%
}


%% =============================================================================
%% 35. ENTORNO 'publications' — Publicaciones académicas
%% =============================================================================
%% Espacio inicial para la sección de publicaciones bibliográficas.
%% Se usa junto con biblatex para listar artículos, libros, conferencias, etc.

\newenvironment{publications}{%
	\vspace{5pt}   % Pequeño espacio antes del listado bibliográfico
}{}


%% =============================================================================
%% 36. CONFIGURACIÓN DE BIBLIOGRAFÍA (biblatex)
%% =============================================================================
%%
%% Se usa biblatex con backend bibtex para gestionar las publicaciones académicas.
%% El archivo de referencias se define en el documento principal con:
%%   \addbibresource{mi_archivo.bib}
%%
%% Para compilar con bibliografía:
%%   lualatex cv.tex
%%   bibtex cv
%%   lualatex cv.tex
%%   lualatex cv.tex

\usepackage[
	backend = bibtex,    % Motor de procesamiento de la bibliografía
	style   = numeric,   % Estilo numérico: [1], [2], [3]...
	natbib  = true       % Compatibilidad con comandos de natbib (\citet, \citep)
]{biblatex}

%% Opciones comentadas para numeración personalizada de la bibliografía:
%% \newcounter{bibitem}
%% \AtBeginBibliography{\setcounter{bibitem}{1}}
%% \AtEveryBibitem{\hspace{1em}\makebox[1.5em][l]{{\thebibitem}\stepcounter{bibitem}.}}

%% Espaciado entre entradas bibliográficas
\setlength{\bibitemsep}{1.5ex}

%% Sangría de las entradas bibliográficas (útil para formato colgante)
\setlength{\bibhang}{2.7em}

%% Cadenas de texto personalizadas para entradas bibliográficas
\NewBibliographyString{retrieved}   % Para "Recuperado de"
\NewBibliographyString{from}        % Para "de" en referencias web

%% Estilo de fuente para las URLs en la bibliografía (tipografía de máquina de escribir)
\urlstyle{tt}

%% --- Subbibliografías (para separar tipos de publicaciones) ---

%% Estilo de fuente para los títulos de las subbibliografías
\def\@subbibfont{\large\color{accentcolor}}

%% \subbibfont{comando-fuente} — Personaliza la fuente del encabezado de subbibliografía
\newcommand\subbibfont[1]{\gdef\@subbibfont{#1}}

%% Formato del encabezado de subbibliografía
\defbibheading{subbibliography}{%
	\vskip 5pt {\@subbibfont\hspace{0pt}#1}\par
}

%% Filtro predefinido: selecciona solo libros y capítulos de libro
\defbibfilter{booksandchapters}{%
	( type=book or type=incollection )
}

%% =============================================================================
%% FIN DE LA CLASE yaac-another-awesome-cv
%% =============================================================================