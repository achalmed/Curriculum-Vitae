# Sistema Modular de CV - Edison Achalma

[![Licencia: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![Ejemplo](https://img.shields.io/badge/Exemple-pdf-blue.svg)](https://github.com/achalmed/Curriculum-Vitae/blob/master/cv.pdf)

#readme

Sistema modular y personalizable para generar currículums profesionales en LaTeX adaptados a diferentes áreas laborales.

---

## 📋 Tabla de Contenidos

- [Características](#-características)
- [Requisitos Previos](#-requisitos-previos)
- [Instalación Rápida](#-instalación-rápida)
- [Uso Básico](#-uso-básico)
- [Guía de la Plantilla YAAC](#-guía-de-la-plantilla-yaac)
- [Personalización Avanzada](#-personalización-avanzada)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Casos de Uso por Área](#-casos-de-uso-por-área)
- [Preguntas Frecuentes](#-preguntas-frecuentes)
- [Contribuciones](#-contribuciones)
- [Licencia](#-licencia)

---

## ✨ Características

- **Sistema modular** - Un repositorio, múltiples versiones de CV
- **6 áreas profesionales** - Docencia, Data Science, Economía, Sector Público, Finanzas, Consultoría
- **Múltiples versiones por archivo** - Comenta/descomenta según necesites
- **Diseño profesional** - Basado en la plantilla YAAC: Another Awesome CV
- **Fácil personalización** - Cambia colores, fuentes y layout
- **Documentación completa** - Guías paso a paso y ejemplos
- **Control de versiones** - Compatible con Git para historial

## Vista previa

### Estilo normal

|               Page. 1                |               Page. 2                |
| :----------------------------------: | :----------------------------------: |
| ![Resumen](preview/cv_page-0001.jpg) | ![Resumen](preview/cv_page-0002.jpg) |

### Estilo alternativo

|                     Page. 1                      |                     Page. 2                      |
| :----------------------------------------------: | :----------------------------------------------: |
| ![Resumen](preview/cv_page-0001-alternative.jpg) | ![Resumen](preview/cv_page-0002-alternative.jpg) |

---

## 🔧 Requisitos Previos

### Obligatorios

- **LaTeX** - Distribución completa (TeX Live, MiKTeX o MacTeX)
- **LuaLaTeX** - Motor de compilación (incluido en distribuciones LaTeX)
- **Fuentes** - Incluidas en carpeta `fonts/` (Source Sans Pro, Source Code Pro)

### Opcionales

- **Git** - Para control de versiones
- **Make** - Para automatización de compilación
- **Editor LaTeX** - VS Code, TeXstudio, Overleaf, etc.

### Instalación de LaTeX

**Linux (Ubuntu/Debian):**

```bash
sudo apt-get update
sudo apt-get install texlive-full
```

**macOS:**

```bash
brew install --cask mactex
```

**Windows:**
Descargar [MiKTeX](https://miktex.org/download) o [TeX Live](https://www.tug.org/texlive/)

---

## 🚀 Instalación Rápida

```bash
# Clonar el repositorio
git clone https://github.com/achalmed/Curriculum-Vitae.git
cd Curriculum-Vitae

# Compilar CV básico
lualatex cv.tex

# Ver el resultado
xdg-open cv.pdf  # Linux
open cv.pdf      # macOS
start cv.pdf     # Windows
```

---

## 🔨 Compilación con Script Universal

Este proyecto incluye soporte para el script `compilar_latex.sh`, un compilador
universal de LaTeX con soporte para múltiples motores, bibliografía y modo watch.

### Comando de compilación

Desde cualquier lugar, ejecuta:

```bash
cd ~/Documents/doc_cv/main && /home/achalmaedison/Documents/scripts_for_latex/script_compilar_latex/compilar_latex.sh -e lualatex -p 3 --biber -o ../output index
```

El PDF se genera en `output/index.pdf`.

### Opciones usadas

| Opción    | Valor       | Descripción                                       |
| --------- | ----------- | ------------------------------------------------- |
| `-e`      | `lualatex`  | Motor de compilación (requerido por la plantilla) |
| `-p`      | `3`         | Tres pasadas para resolver referencias cruzadas   |
| `--biber` | —           | Procesa bibliografía con Biber (biblatex)         |
| `-o`      | `../output` | Guarda el PDF en la carpeta `output/`             |

### Otras variantes útiles

```bash
# Sin bibliografía (compilación rápida)
cd ~/Documents/doc_cv/main && /home/achalmaedison/Documents/scripts_for_latex/script_compilar_latex/compilar_latex.sh -e lualatex -p 2 -o ../output index

# Modo silencioso (solo errores en pantalla)
cd ~/Documents/doc_cv/main && /home/achalmaedison/Documents/scripts_for_latex/script_compilar_latex/compilar_latex.sh -e lualatex -p 3 --biber -s -o ../output index

# Modo watch (recompila al guardar cambios)
cd ~/Documents/doc_cv/main && /home/achalmaedison/Documents/scripts_for_latex/script_compilar_latex/compilar_latex.sh -e lualatex -p 3 --biber -w index

# Solo limpiar auxiliares
cd ~/Documents/doc_cv/main && /home/achalmaedison/Documents/scripts_for_latex/script_compilar_latex/compilar_latex.sh -c index
```

> **Nota:** El script requiere permisos de ejecución. Si da error, ejecuta una vez:
>
> ```bash
> chmod +x /home/achalmaedison/Documents/scripts_for_latex/script_compilar_latex/compilar_latex.sh
> ```

## 📚 Uso Básico

### Generar CV para un área específica

#### Opción 1: Copiar archivos manualmente

```bash
# Para Docencia
cp 1_declaracion_docencia.tex 1_declaracion_cv.tex
cp 2_competencias_docencia.tex 2_competencias.tex
cp 3_experiencias_docencia.tex 3_experiencias_corta.tex

# Para Data Science
cp 1_declaracion_data_science.tex 1_declaracion_cv.tex
cp 2_competencias_data_science.tex 2_competencias.tex
cp 3_experiencias_data_science.tex 3_experiencias_corta.tex

# Compilar
lualatex cv.tex
```

#### Opción 2: Usar Makefile (más rápido)

```bash
make docencia      # CV para docencia
make datascience   # CV para data science
make economia      # CV para economía
make publico       # CV para sector público
make finanzas      # CV para sector financiero
make consultoria   # CV para consultoría
make clean         # Limpiar archivos temporales
```

### Flujo de trabajo típico

```
1. Leer descripción del puesto → Identificar área
2. Copiar archivos del área correspondiente
3. Editar y personalizar contenido
4. Comentar/descomentar secciones relevantes
5. Compilar: lualatex cv.tex
6. Revisar PDF y ajustar si es necesario
7. Guardar versión: CV_Edison_Empresa_Fecha.pdf
```

---

## 🎨 Guía de la Plantilla YAAC

### Opciones de la clase de documento

Al declarar `\documentclass` puedes usar opciones para personalizar tu CV:

**Opciones disponibles:**

1. **localFont** - Usa las fuentes incluidas en la carpeta `fonts/`
2. **alternative** - Usa el diseño alternativo del encabezado
3. **10pt | 11pt | 12pt** - Cambia el tamaño de fuente
4. **compact** - Reduce el espacio vertical entre experiencias

**Ejemplos de uso:**

```latex
% Diseño tradicional, fuentes del sistema, color azul por defecto
\documentclass{yaac-another-awesome-cv}

% Diseño tradicional, fuentes locales incluidas
\documentclass[localFont]{yaac-another-awesome-cv}

% Diseño alternativo, fuentes del sistema
\documentclass[alternative]{yaac-another-awesome-cv}

% Diseño alternativo, fuentes locales, tamaño 10pt
\documentclass[localFont,alternative,10pt]{yaac-another-awesome-cv}

% Diseño compacto (menos espacio entre experiencias)
\documentclass[compact]{yaac-another-awesome-cv}
```

### Construir el encabezado

#### Parámetros obligatorios

Fuera del wrapper `\socialinfo` debes definir:

```latex
% Definir nombre del autor (Obligatorio)
% Uso: \name{<nombre>}{<apellido>}
\name{Elmer Edison}{Achalma Mendoza}

% Definir foto del autor (Opcional)
% Uso: \photo[<forma: circular, square, roundedsquare, squircle>]{<diámetro>}{<foto>}
% La forma por defecto es circular
\photo{2.5cm}{profile2}

% Definir lema del autor (Obligatorio)
% Uso: \tagline{<lema>}
\tagline{Economista | Data Science | Investigación}
```

#### Redes sociales y contacto

La mayoría de redes sociales tienen su comando para renderizar un enlace clickeable o entrada de texto:

```latex
% LinkedIn (opcional)
% Uso: \linkedin{<usuario-linkedin>}
\linkedin{achalmaedison}

% Viadeo (opcional)
% Uso: \viadeo{<usuario-viadeo>}
\viadeo{usuario}

% GitHub (opcional)
% Uso: \github{<usuario-github>}
\github{achalmed}

% ORCID (opcional) - Identificador de investigador
% Uso: \orcid{<código-orcid>}
\orcid{0000-0000-0000-0000}

% Google Scholar (opcional)
% Uso: \googlescholar{<id>}{<nombre>}
\googlescholar{ID123456}{Edison Achalma}

% Stack Overflow (opcional)
% Uso: \stackoverflow{<id-usuario>}
\stackoverflow{759643}

% Stack Exchange (opcional)
% Uso: \stackexchange{<id-usuario>}
\stackexchange{396216}

% Email (opcional)
% Uso: \email{<correo>}
\email{elmer.achalma.09@unsch.edu.pe}

% Teléfono (opcional)
% Uso: \smartphone{<número>}
\smartphone{+51 934 179 301}

% Sitio web personal (opcional)
% Uso: \personalLink{<url>}
\personalLink{achalmaedison.netlify.app}

% Dirección (opcional)
% Uso: \address{<dirección>}
\address{Ayacucho, Perú}

% Información adicional (opcional)
% Uso: \infos{<información>}
\infos{Nacido el 23 de septiembre de 1990 | Peruano}
```

**Coloca estos comandos dentro del wrapper `\socialinfo`:**

```latex
\socialinfo{
  \linkedin{achalmaedison}
  \github{achalmed}\\
  \orcid{0000-0000-0000-0000}
  \smartphone{+51 934 179 301}
  \email{elmer.achalma.09@unsch.edu.pe}\\
  \personalLink{achalmaedison.netlify.app}\\
  \infos{Ayacucho - Perú}
}
```

**Nota:** Usa `\\` cuando quieras forzar un salto de línea.

**Genera el encabezado:**

```latex
\makecvheader
```

### Ajustar el tamaño de la columna izquierda

Las secciones comparten el tamaño de columna izquierda (2.5cm por defecto). Puedes cambiar este tamaño:

```latex
% Cambiar tamaño de columna izquierda (opcional)
% Uso: \setleftcolumnlength{<tamaño>}
% Recomendado: entre 1.5cm y 2.5cm
\setleftcolumnlength{2.0cm}
```

### Construir la sección de competencias

Para listar tus habilidades como listas de palabras clave:

```latex
% Iniciar entorno de keywords
\begin{keywords}
  % Agregar entradas de palabras clave agrupadas por categorías
  % Uso: \keywordsentry{<categoría>}{<lista de habilidades>}

  \keywordsentry{Lenguajes de Programación}{\textbf{Python}, \textbf{R}, SQL, JavaScript}
  \keywordsentry{Frameworks}{Django, Flask, Shiny, React}
  \keywordsentry{Bases de Datos}{MySQL, PostgreSQL, MongoDB}
  \keywordsentry{Herramientas}{Git, Docker, VS Code, LaTeX}

\end{keywords}
```

**Tip:** Usa `\textbf{}` para resaltar las tecnologías que mejor dominas.

### Construir la sección de experiencias

Para describir tus experiencias laborales:

```latex
% Iniciar entorno de experiencias
\begin{experiences}

  % Entrada de experiencia laboral
  % Uso: \experience
  %   {Fecha fin}    {Título del puesto}{Empresa}{País}
  %   {Fecha inicio} {
  %                    Descripción de la experiencia
  %                    \begin{itemize}
  %                      \item Logro 1
  %                      \item Logro 2
  %                      \item Logro 3
  %                    \end{itemize}
  %                  }
  %                  {Tecnologías destacadas}

  \experience
    {Diciembre 2023}  {Data Scientist}{Tech Company}{Perú}
    {Enero 2022}      {
                        Desarrollo de modelos de Machine Learning para predicción de demanda.
                        \begin{itemize}
                          \item Implementé modelo de series de tiempo con 95\% de precisión
                          \item Reduje tiempo de procesamiento en 40\% mediante optimización
                          \item Lideré equipo de 3 analistas junior
                        \end{itemize}
                      }
                      {Python, scikit-learn, TensorFlow, SQL, AWS}

  % Separador entre experiencias
  \emptySeparator

  % Experiencia de consultoría
  % Uso: \consultantexperience
  %   {Fecha fin}     {Título}{Empresa consultora}{País}
  %   {Fecha inicio}  {Puesto en cliente}{Empresa cliente}
  %                   {
  %                     Descripción
  %                     \begin{itemize}
  %                       \item Logro 1
  %                       \item Logro 2
  %                     \end{itemize}
  %                   }
  %                   {Tecnologías}

  \consultantexperience
    {Junio 2021}      {Consultor BI}{Consulting Firm}{Perú}
    {Enero 2020}      {Analista Senior}{Cliente: Banco XYZ}
                      {
                        Implementación de solución de Business Intelligence.
                        \begin{itemize}
                          \item Diseñé dashboards ejecutivos en Power BI
                          \item Automaticé 15 reportes manuales
                          \item Capacité a 30 usuarios finales
                        \end{itemize}
                      }
                      {Power BI, SQL Server, Python, DAX}

\end{experiences}
```

### Construir la sección de idiomas

La sección de idiomas usa el entorno **skills**:

```latex
% Iniciar entorno de habilidades
\begin{skills}
  % Renderizar habilidad
  % Uso: \skill{<idioma>}{<nivel entre 1 y 5>}

  \skill{Español}{5}    % Nativo
  \skill{Quechua}{5}    % Nativo
  \skill{Inglés}{4}     % Avanzado
  \skill{Portugués}{2}  % Básico

\end{skills}
```

**Niveles sugeridos:**

- 5: Nativo / Bilingüe
- 4: Avanzado / Fluido
- 3: Intermedio
- 2: Básico
- 1: Nociones

### Construir la sección de formación académica

La sección de formación usa el entorno **scholarship**:

```latex
\begin{scholarship}
  % Renderizar entrada de formación
  % Uso: \scholarshipentry{<año>}{<descripción>}

  \scholarshipentry{2017 - 2025}
    {Economía, Universidad Nacional de San Cristóbal de Huamanga}

  \scholarshipentry{2022}
    {Diplomado en Data Science, Universidad XYZ (120 horas)}

  \scholarshipentry{2019 - 2022}
    {Inglés Nivel Avanzado, Instituto Cultural Peruano Norteamericano}

\end{scholarship}
```

### Construir la sección de proyectos

La sección de proyectos usa el entorno **projects**:

```latex
\begin{projects}
  % Renderizar proyecto
  % Uso: \project
  %   {Nombre del proyecto}{Año}
  %   {Enlaces (GitHub, web, etc.)}
  %   {Descripción del proyecto}
  %   {Stack tecnológico}

  \project
    {Dashboard de Análisis Económico}{2024}
    {\github{achalmed/dashboard-economia} \website{https://demo.com}{Demo}}
    {Dashboard interactivo para visualización de indicadores económicos regionales usando datos del INEI y BCRP. Permite análisis temporal y comparaciones interregionales.}
    {R, Shiny, ggplot2, dplyr, flexdashboard}

  \project
    {Sistema de Predicción de Morosidad}{2023}
    {\github{achalmed/credit-risk}}
    {Modelo de Machine Learning para predecir morosidad crediticia con 87\% de precisión. Incluye análisis exploratorio, feature engineering y validación.}
    {Python, scikit-learn, Pandas, XGBoost}

\end{projects}
```

**Comandos de enlaces disponibles:**

- `\github{usuario/repo}` - Enlace a repositorio GitHub
- `\website{url}{texto}` - Enlace a sitio web
- `\gitlab{usuario/repo}` - Enlace a GitLab
- `\bitbucket{usuario/repo}` - Enlace a Bitbucket

### Construir la sección de referencias

La sección de referencias usa el entorno **referees**:

```latex
\begin{referees}
  % Renderizar referencia
  % Uso: \referee
  %   {Nombre completo}
  %   {Cargo}
  %   {Empresa/Institución}
  %   {Email}
  %   {Teléfono}

  \referee
    {Dr. Juan Pérez García}
    {Director de Investigación}
    {Universidad Nacional de San Cristóbal de Huamanga}
    {juan.perez@unsch.edu.pe}
    {+51 966 123 456}

  \referee
    {Mag. María López Díaz}
    {Gerente de Analytics}
    {Empresa Consultora SAC}
    {maria.lopez@consultora.com}
    {+51 987 654 321}

\end{referees}
```

### Construir la sección de publicaciones

La sección de publicaciones usa el entorno **publications** con BibLaTeX:

#### Paso 1: Crear archivo .bib

Crea un archivo `my_publications.bib` con tus publicaciones:

```bibtex
@article{achalma2024,
  author  = {Achalma, Edison and Otros, Autor},
  title   = {Análisis Econométrico de la Pobreza en Ayacucho},
  journal = {Revista Económica},
  year    = {2024},
  volume  = {10},
  number  = {2},
  pages   = {45--67}
}

@inproceedings{achalma2023,
  author    = {Achalma, Edison},
  title     = {Machine Learning aplicado a Economía del Desarrollo},
  booktitle = {Congreso Internacional de Economía},
  year      = {2023},
  pages     = {120--135}
}
```

#### Paso 2: Agregar al CV

En tu archivo `cv.tex`:

```latex
% En el preámbulo
\addbibresource{my_publications.bib}

% En el documento
\begin{publications}
  % Separar por tipo de publicación
  \printbibliography[heading=subbibliography,title={Artículos en Revistas},type=article]
  \printbibliography[heading=subbibliography,title={Conferencias},type=inproceedings]

  % O mostrar todas juntas
  % \printbibliography[heading={none}]
\end{publications}
```

#### Paso 3: Compilar con bibliografía

```bash
lualatex cv.tex
biber cv
lualatex cv.tex
lualatex cv.tex
```

---

## 🎯 Personalización Avanzada

### Cambiar colores

Edita el archivo `yaac-another-awesome-cv.cls`:

```latex
% Busca estas líneas y modifica los colores RGB
\definecolor{awesome}{RGB}{29, 67, 119}  % Azul por defecto
\definecolor{darktext}{HTML}{414141}     % Texto oscuro
\definecolor{text}{HTML}{333333}         % Texto normal
\definecolor{graytext}{HTML}{5D5D5D}     % Texto gris
\definecolor{lighttext}{HTML}{999999}    % Texto claro
```

**Colores sugeridos:**

- Azul profesional: `RGB{29, 67, 119}`
- Verde: `RGB{34, 139, 34}`
- Rojo: `RGB{220, 20, 60}`
- Morado: `RGB{75, 0, 130}`
- Naranja: `RGB{255, 140, 0}`

### Cambiar fuentes

Si no usas `localFont`, puedes usar fuentes del sistema:

```latex
% En yaac-another-awesome-cv.cls
\RequirePackage{fontspec}
\setmainfont{Arial}  % Cambiar fuente principal
\setsansfont{Helvetica}  % Cambiar fuente sans-serif
```

### Ajustar espaciados

```latex
% En tu cv.tex, después de \begin{document}

% Espaciado entre secciones
\setlength{\parskip}{0.5em}

% Espaciado entre items de listas
\setlength{\itemsep}{0.3em}

% Márgenes del documento
\geometry{left=1.5cm, right=1.5cm, top=1.5cm, bottom=1.5cm}
```

---

## 📁 Estructura del Proyecto

```
Curriculum-Vitae/
│
├── cv.tex                              # Archivo principal del CV
├── yaac-another-awesome-cv.cls         # Clase LaTeX de la plantilla
│
├── fonts/                              # Fuentes incluidas
│   ├── SourceSansPro-Regular.otf
│   ├── SourceSansPro-Bold.otf
│   └── SourceCodePro-Regular.otf
│
├── preview/                            # Imágenes de vista previa
│
├── 📄 Archivos de contenido modular
├── 1_declaracion_*.tex                 # Declaraciones por área (6 versiones)
├── 2_competencias_*.tex                # Competencias por área (5 versiones)
├── 3_experiencias_*.tex                # Experiencias por área (3 versiones)
├── 4_formacion_academica.tex           # Formación académica
├── 5_idiomas_habilidades.tex           # Idiomas y habilidades
├── 6_logros.tex                        # Logros y reconocimientos
├── 7_proyectos.tex                     # Proyectos personales
├── 8_voluntariado.tex                  # Voluntariado
├── 9_certificados.tex                  # Certificaciones
├── 10_referencias.tex                  # Referencias profesionales
├── 11_publicaciones.tex                # Publicaciones académicas
│
├── 📚 Documentación
├── README.md                           # Este archivo
├── INDICE.md                           # Índice del sistema
├── GUIA_PRACTICA.md                    # Guía con casos de uso
├── PLANTILLAS_RAPIDAS.md               # Scripts de automatización
│
├── 🖼️ Recursos
├── profile2.jpg                        # Foto de perfil
├── my_publications.bib                 # Bibliografía (BibTeX)
│
└── 🔧 Herramientas
    ├── Makefile                        # Automatización de compilación
    └── .gitignore                      # Archivos ignorados por Git
```

---

## 💼 Casos de Uso por Área

### 🎓 Docencia e Investigación

**Archivos a usar:**

```bash
cp 1_declaracion_docencia.tex 1_declaracion_cv.tex
cp 2_competencias_docencia.tex 2_competencias.tex
cp 3_experiencias_docencia.tex 3_experiencias_corta.tex
```

**Enfatizar:**

- Experiencia docente y cursos dictados
- Publicaciones académicas (descomentar sección)
- Proyectos de investigación
- Dirección de tesis
- Certificaciones pedagógicas

**Descomentar en cv.tex:**

```latex
\input{6_logros}           % Si tienes premios docentes
\input{11_publicaciones}   % Si tienes papers publicados
```

---

### 📊 Data Science / Análisis de Datos

**Archivos a usar:**

```bash
cp 1_declaracion_data_science.tex 1_declaracion_cv.tex
cp 2_competencias_data_science.tex 2_competencias.tex
cp 3_experiencias_data_science.tex 3_experiencias_corta.tex
```

**Enfatizar:**

- Proyectos en GitHub (con enlaces)
- Stack técnico prominente
- Experiencias con datos y análisis
- Certificaciones técnicas (Python, R, ML)
- Dashboards y visualizaciones

**En socialinfo agregar:**

```latex
\socialinfo{
  \linkedin{achalmaedison}
  \github{achalmed}          % ¡Importante!
  \kaggle{usuario}           % Si tienes
  ...
}
```

---

### 💼 Economía / Análisis Económico

**Archivos a usar:**

```bash
cp 1_declaracion_economia.tex 1_declaracion_cv.tex
cp 2_competencias_economia.tex 2_competencias.tex
```

**Enfatizar:**

- Análisis econométrico
- Experiencia con datos económicos (INEI, BCRP)
- Software: Stata, EViews, R
- Informes y estudios económicos
- Conocimiento de coyuntura

---

### 🏛️ Sector Público

**Archivos a usar:**

```bash
cp 1_declaracion_sector_publico.tex 1_declaracion_cv.tex
cp 2_competencias_sector_publico.tex 2_competencias.tex
```

**Enfatizar:**

- Compromiso con servicio público
- Conocimiento de SIAF, SIGA, SEACE
- Experiencia en entidades públicas
- Elaboración de TdR, informes oficiales
- Certificaciones en gestión pública

**En certificados activar:**

```latex
\scholarshipentry{2022}
{Diplomado en sistemas gubernamentales: SIAF, SIGA Y SEACE, ...}
```

---

### 💰 Sector Financiero

**Archivos a usar:**

```bash
cp 1_declaracion_sector_financiero.tex 1_declaracion_cv.tex
cp 2_competencias_sector_financiero.tex 2_competencias.tex
```

**Enfatizar:**

- Análisis cuantitativo y financiero
- Conocimiento de normativa SBS
- Evaluación crediticia / gestión de riesgos
- Excel financiero avanzado
- Certificaciones financieras

---

### 🔍 Consultoría / Proyectos

**Archivos a usar:**

```bash
cp 1_declaracion_consultoria.tex 1_declaracion_cv.tex
```

**Enfatizar:**

- Versatilidad y adaptabilidad
- Proyectos diversos
- Experiencia con múltiples clientes
- Gestión de proyectos
- Metodologías (marco lógico, evaluación)

---

## ❓ Preguntas Frecuentes

### ¿Cómo compilo el CV?

```bash
lualatex cv.tex
```

Si usas bibliografía:

```bash
lualatex cv.tex
biber cv
lualatex cv.tex
lualatex cv.tex
```

### ¿Por qué usar LuaLaTeX y no pdfLaTeX?

LuaLaTeX tiene mejor soporte para:

- Fuentes OpenType/TrueType
- Unicode (tildes, ñ, caracteres especiales)
- Compilación más moderna y rápida

### ¿Cómo cambio mi foto?

1. Coloca tu foto en la misma carpeta que `cv.tex`
2. Nómbrala `profile2.jpg` (o cambia el nombre en cv.tex)
3. En cv.tex: `\photo{2.5cm}{profile2}`

### ¿Cómo agrego mi ORCID?

En `cv.tex`:

```latex
\socialinfo{
  \linkedin{achalmaedison}
  \orcid{0000-0002-1234-5678}  % Agrega tu código ORCID
  ...
}
```

Si no tienes ORCID, regístrate gratis en: https://orcid.org/

### ¿El CV debe ser de 1 o 2 páginas?

**Depende del país y área:**

- **USA/Europa:** Preferiblemente 1 página (entry-level), 2 máximo
- **Latinoamérica:** 2 páginas es aceptable
- **Academia:** Puede ser más extenso (CV académico)

**Regla general:** Sé conciso pero completo.

### ¿Cómo elimino archivos temporales?

```bash
# Manual
rm *.aux *.log *.out *.toc *.bbl *.blg

# Con Make
make clean
```

### ¿Puedo usar esto en Overleaf?

**Sí**, sube todos los archivos a Overleaf y compila con LuaLaTeX:

1. Menu → Compiler → LuaLaTeX
2. Recompilar

### ¿Cómo personalizo los colores?

Edita `yaac-another-awesome-cv.cls`:

```latex
\definecolor{awesome}{RGB}{29, 67, 119}  % Color principal
```

O crea tu propio archivo de colores y cárgalo en el preámbulo.

### ¿Puedo contribuir con mejoras?

**¡Por supuesto!** Este es un proyecto de código abierto.

1. Fork el repositorio
2. Crea una rama: `git checkout -b feature/mejora`
3. Commit cambios: `git commit -m "Agrega mejora"`
4. Push: `git push origin feature/mejora`
5. Abre un Pull Request

Ver [CONTRIBUTING.md](CONTRIBUTING.md) para más detalles.

---

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:

1. Abre un **Issue** para discutir cambios mayores
2. Sigue el estilo de código existente
3. Documenta nuevas funcionalidades
4. Prueba tus cambios antes de enviar PR

### Áreas donde puedes contribuir:

- 🐛 Reportar bugs
- 📝 Mejorar documentación
- ✨ Agregar nuevas secciones o diseños
- 🌍 Traducciones a otros idiomas
- 🎨 Nuevos esquemas de colores

---

## 📄 Licencia

Este proyecto está bajo la licencia **Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)**.

**Esto significa que puedes:**

- Compartir - copiar y redistribuir
- Adaptar - remezclar, transformar y crear a partir del material
- Uso comercial permitido

**Bajo las siguientes condiciones:**

- 📝 **Atribución** - Debes dar crédito apropiado
- 🔄 **ShareAlike** - Si remezclas, debes distribuir bajo la misma licencia

Ver [LICENSE](LICENSE) para más detalles.

---

## 📬 Contacto

**Edison Achalma**

- 📧 Email: elmer.achalma.09@unsch.edu.pe
- 💼 LinkedIn: [linkedin.com/in/achalmaedison](https://linkedin.com/in/achalmaedison)
- 🐙 GitHub: [github.com/achalmed](https://github.com/achalmed)
- 🌐 Web: [achalmaedison.netlify.app](https://achalmaedison.netlify.app)

---

## 🙏 Agradecimientos

Este sistema está basado en la excelente plantilla **YAAC: Another Awesome CV** de [darwiin](https://github.com/darwiin).

Agradecimientos especiales a:

- La comunidad LaTeX
- Todos los que han contribuido con feedback y sugerencias
- StackOverflow y TeX StackExchange por las respuestas

---

## 📚 Recursos Adicionales

### Documentación Completa

- [INDICE.md](INDICE.md) - Índice completo del sistema
- [GUIA_PRACTICA.md](GUIA_PRACTICA.md) - Casos de uso paso a paso
- [PLANTILLAS_RAPIDAS.md](PLANTILLAS_RAPIDAS.md) - Automatización y scripts

### Enlaces Útiles

- [LaTeX Project](https://www.latex-project.org/)
- [Overleaf Documentation](https://www.overleaf.com/learn)
- [YAAC Original Template](https://github.com/darwiin/yaac-another-awesome-cv)
- [CTAN (LaTeX Packages)](https://ctan.org/)

---

## 🎯 Roadmap Futuro

Funcionalidades planificadas:

- [ ] Plantilla en inglés completa
- [ ] Generador web de CVs
- [ ] Más esquemas de colores predefinidos
- [ ] Sección de soft skills visualizada
- [ ] Integración con APIs de LinkedIn
- [ ] Generador de cartas de presentación

---

**¡Éxito en tu búsqueda laboral! 🚀**

_Última actualización: mayo 2026_  
_Versión del sistema: 2.0_  
_Basado en YAAC: Another Awesome CV_

---

**⭐ Si te gustó este proyecto, considera darle una estrella en GitHub!**
