---
tipo: doc
estado: activo
forma: referencia
titulo: "Referencia de la clase YAAC adaptada: opciones, macros y entornos"
---
# Referencia de la clase YAAC adaptada

Qué ofrece `main/yaac-another-awesome-cv.cls` (fork comentado en español de *YAAC: Another
Awesome CV*, de Christophe Roger) y cómo se llama cada pieza. Es una referencia: describe la clase tal
como está; los pasos para editar el CV están en [edicion.md](edicion.md). Los ejemplos usan datos
inventados. Ante una duda, manda el comentario de la propia `.cls`, que documenta cada macro junto a su
definición.

## Resumen

| macro o entorno | para qué | dónde se usa en este CV |
|---|---|---|
| `\name`, `\tagline`, `\photo`, `\socialinfo` | datos del encabezado | `main/config/personal.tex` |
| `\makecvheader` · `\makecvfooter{izq}{centro}{der}` | encabezado y pie | `main/cv.tex` |
| `\sectionTitle{Título}{\faIcono}` | título de sección con icono Font Awesome | todas las secciones |
| `experiences` + `\experience` · `\consultantexperience` · `\emptySeparator` | experiencia profesional | `main/sections/experiencias/entradas/` |
| `\entradaExperiencia{archivo}` | inserta una entrada dentro de `experiences` (propia de esta adaptación) | selectores `2_experiencias_*.tex` |
| `keywords` + `\keywordsentry` | listas de palabras clave | `main/sections/competencias/` |
| `scholarship` + `\scholarshipentry` | formación | `main/sections/otros/3_formacion_academica.tex` |
| `skills` + `\skill` | niveles de 1 a 5 en círculos | `main/sections/otros/5_idiomas_habilidades.tex` |
| `\twocolumnsection{izq}{der}` | dos bloques lado a lado | ídem |
| `projects` + `\project` | proyectos | `main/sections/otros/8_proyectos.tex` |
| `referees` + `\referee` · `\refereeMailOnly` | referencias | `main/sections/otros/10_referencias.tex` |
| `publications` | bibliografía con biblatex | `main/sections/otros/11_publicaciones.tex` |

## Opciones de la clase

Se declaran en `\documentclass[...]{yaac-another-awesome-cv}` (`main/cv.tex` usa
`localFont,alternative,10pt`).

| opción | efecto |
|---|---|
| `10pt` · `11pt` · `12pt` | tamaño de letra (10pt por defecto) |
| `localFont` | usa las fuentes Source Sans Pro de `main/fonts/` en vez de las del sistema |
| `alternative` | encabezado alternativo: nombre y lema a la izquierda, foto a la derecha |
| `compact` | reduce el espacio entre entradas de experiencia |
| `green` · `red` · `indigo` · `orange` · `monochrome` | color de acento (`basecolor`); sin ninguna, azul oscuro `#000066` |
| `showLinks` | dibuja el borde de los hipervínculos (depuración) |

El color no se cambia editando la `.cls`: se elige con una de estas opciones.

## Encabezado

Va en `main/config/personal.tex`, antes de `\begin{document}`:

```latex
\name{Nombre}{Apellidos}                    % obligatorio
\tagline{Cargo | Área | Área}               % obligatorio
\photo[circular]{2.5cm}{../assets/images/profile/foto}   % opcional
```

- `\photo[forma]{diámetro}{archivo}`: forma `circular` (por defecto), `square`, `roundedsquare` o
  `squircle`. La ruta del archivo es relativa a `main/`, desde donde se compila.
- `\socialinfo{…}` agrupa los datos de contacto; dentro, `\\` fuerza un salto de línea. Macros
  disponibles: `\linkedin{usuario}`, `\github{usuario}`, `\viadeo{usuario}`, `\medium{usuario}`,
  `\bitbucket{usuario}`, `\stackoverflow{id}`, `\stackexchange{id}`, `\email{correo}`,
  `\smartphone{número}`, `\personalLink{dominio}` (sin `http://`), `\website{url}{texto}`,
  `\address{texto}`, `\infos{texto}`. Para un icono y texto libres: `\socialtext{\icono}{texto}` y
  `\sociallink{\icono}{url}{texto}`.
- La clase **no** define `\orcid` ni `\googlescholar`: un identificador ORCID se pone con
  `\website{https://orcid.org/…}{ORCID}`.
- `\setleftcolumnlength{2.0cm}` cambia la columna izquierda (2.5 cm por defecto); en este CV se
  ajusta, si hace falta, en `main/config/settings.tex`.

## Experiencia

```latex
\begin{experiences}
  \experience
    {Fecha fin}{Cargo}{Institución}{Ciudad}
    {Fecha inicio}{
      Descripción breve.
      \begin{itemize}
        \item Función o logro
      \end{itemize}
    }
    {Herramienta, Herramienta}       % etiquetas \cvtag, separadas por comas
  \emptySeparator
\end{experiences}
```

- `\experience` tiene siete argumentos; el séptimo es una lista separada por comas que se dibuja como
  etiquetas (`\cvtag`).
- `\consultantexperience` tiene nueve: fin, título, consultora, ciudad, inicio, puesto en el cliente,
  cliente, descripción y lista de etiquetas.
- `\emptySeparator` separa dos entradas (más estrecho con `compact`).
- **`\entradaExperiencia{archivo}`** carga `main/sections/experiencias/entradas/<archivo>.tex` con
  el primitivo `\@@input`. Dentro de `experiences` nunca se usa `\input`: rompe el escaneo de filas de
  la `longtable` y la compilación falla con «Misplaced \omit».

## Competencias, formación e idiomas

```latex
\begin{keywords}
  \keywordsentry{Categoría}{\textbf{Destacado}, Otro, Otro}
\end{keywords}

\begin{scholarship}
  \scholarshipentry{2018 -- 2023}{Carrera, Universidad}
\end{scholarship}

\twocolumnsection
  {\sectionTitle{Idiomas}{\faLanguage}
   \begin{skills} \skill{Idioma}{5} \end{skills}}
  {\sectionTitle{Habilidades}{\faPlus}
   \begin{skills} \skill{Habilidad}{4} \end{skills}}
```

`\skill{texto}{n}` dibuja `n` círculos llenos de cinco. Utilidades sueltas: `\cvtag{texto}`,
`\link{url}{texto}`, `\important{texto}` (negrita).

## Proyectos

```latex
\begin{projects}
  \project{Nombre}{2024}{\link{https://…}{Repositorio}}{Descripción.}{R, Python}
\end{projects}
```

Cinco argumentos: nombre, período, enlaces, descripción y lista de etiquetas.

## Referencias

```latex
\begin{referees}
  \referee{Nombre}{Cargo}{Institución}{correo@ejemplo.org}{+00 000 000 000}
  \refereeMailOnly{Nombre}{Cargo}{Institución}{correo@ejemplo.org}
\end{referees}
```

## Publicaciones

- La clase carga biblatex con `backend = bibtex`, `style = numeric` y `natbib = true`; la bibliografía
  se declara con `\addbibresource` en `main/config/personal.tex`
  (`../bibliography/my_publications.bib`).
- El entorno `publications` envuelve los `\printbibliography`; la cabecera `subbibliography` y el
  filtro `booksandchapters` (`book` o `incollection`) están definidos en la clase, y
  `\subbibfont{…}` cambia la letra de esos títulos.
- `main/sections/otros/11_publicaciones.tex` trae seis formas comentadas de agruparlas (todas
  juntas, por tipo, selección manual, por año, por palabra clave, revisadas por pares o no); la activa
  es «por tipo».
- **Hoy la sección no compila con el `Makefile`**: `BIBER=1` ejecuta `biber`, que necesita
  `backend = biber`, y `bibliography/my_publications.bib` solo contiene ejemplos. Los dos puntos están
  en los pendientes de [decisiones.md](decisiones.md).
