---
tipo: readme
estado: activo
---
# cv/ — Curriculum Vitae de Edison Achalma: CV multiperfil en LaTeX (repo Curriculum-Vitae)

Sistema de CV multi-perfil en LaTeX, construido sobre un fork en español de la clase
[YAAC: Another Awesome CV](https://github.com/darwiin/yaac-another-awesome-cv).
Un solo repositorio de contenido genera **seis variantes del CV**, cada una adaptada
a un área profesional distinta. El perfil se elige **al compilar** — nunca comentando
o descomentando líneas.

## Tabla de contenidos

- [Perfiles disponibles](#perfiles-disponibles)
- [Requisitos](#requisitos)
- [Uso: compilación](#uso-compilación)
- [Estructura: mapa del repositorio](#estructura-mapa-del-repositorio)
- [Recetas de edición manual](#recetas-de-edición-manual)
  1. [Actualizar datos personales o de contacto](#1-actualizar-datos-personales-o-de-contacto)
  2. [Editar una experiencia existente (texto o fechas)](#2-editar-una-experiencia-existente-texto-o-fechas)
  3. [Añadir una experiencia nueva](#3-añadir-una-experiencia-nueva)
  4. [Añadir un certificado (anexo)](#4-añadir-un-certificado-anexo)
  5. [Reemplazar un certificado por una versión nueva](#5-reemplazar-un-certificado-por-una-versión-nueva)
  6. [Editar formación, idiomas, logros, proyectos o referencias](#6-editar-formación-idiomas-logros-proyectos-o-referencias)
  7. [Cambiar la declaración o las competencias de un área](#7-cambiar-la-declaración-o-las-competencias-de-un-área)
  8. [Crear un perfil nuevo](#8-crear-un-perfil-nuevo)
  9. [Activar la sección de publicaciones](#9-activar-la-sección-de-publicaciones)
- [Verificación antes de hacer commit](#verificación-antes-de-hacer-commit)
- [Publicar una versión (GitHub Releases)](#publicar-una-versión-github-releases)
- [Errores frecuentes](#errores-frecuentes)
- [Referencia rápida de macros](#referencia-rápida-de-macros)
- [Documentación adicional](#documentación-adicional)
- [Límite honesto](#límite-honesto)
- [Licencia](#licencia)

## Perfiles disponibles

| Perfil              | Comando                  | Anexos incluidos |
| ------------------- | ------------------------ | ---------------- |
| Sector Público      | `make sector-publico`    | del área         |
| Docencia            | `make docencia`          | del área         |
| Data Science        | `make data-science`      | del área         |
| Sector Financiero   | `make sector-financiero` | del área         |
| Economía (completo) | `make economia`          | todos            |
| Consultoría         | `make consultoria`       | todos            |

## Requisitos

- **LuaLaTeX** (obligatorio). La clase usa `fontspec` y fuentes OpenType
  (Source Sans Pro, ya incluidas en `main/fonts/` — no hay que instalar nada).
  XeLaTeX también funciona; **pdfLaTeX no**.
- **`make`** (opcional pero recomendado; `latexmk` no se usa).
- **`biber`** solo si activas la sección de publicaciones
  (ver [receta 9](#9-activar-la-sección-de-publicaciones)).

## Uso: compilación

### Con el Makefile (recomendado)

```bash
make                    # perfil por defecto (sector-publico)
make docencia           # un perfil concreto
make all                # los 6 perfiles
make docencia ANEXOS=0  # versión SIN anexos (solo descriptivo)
make economia BIBER=1   # con pasada de biber (solo si publicaciones está activa)
make clean              # elimina build/
```

Los PDF se generan en `build/cv-<perfil>.pdf`. La carpeta `build/` **no se
versiona**: los PDF finales se distribuyen vía GitHub Releases.

**Versión sin anexos:** con `ANEXOS=0` el CV sale solo con el contenido
descriptivo — se omiten las constancias/certificados PDF adjuntos al final —
y se genera como `build/cv-<perfil>-sin-anexos.pdf`, sin sobrescribir la
versión completa. Útil cuando la convocatoria pide un CV breve o la
documentación se presenta por separado.

### A mano, sin Makefile

El Makefile solo automatiza esto (dos pasadas para resolver referencias y la
numeración "página X de Y"):

```bash
mkdir -p build
cd main
lualatex --interaction=nonstopmode --halt-on-error \
  --output-directory=../build --jobname=cv-docencia \
  '\def\CVprofile{docencia}\input{cv.tex}'
# (opcional, solo con publicaciones activas):  biber ../build/cv-docencia
# repetir la MISMA orden lualatex una segunda vez
```

Cambia `docencia` por el perfil deseado en `--jobname` y en `\def\CVprofile{...}`.
Para la versión **sin anexos**, antepón `\def\CVsinAnexos{1}` y ajusta el jobname:

```bash
lualatex --interaction=nonstopmode --halt-on-error \
  --output-directory=../build --jobname=cv-docencia-sin-anexos \
  '\def\CVsinAnexos{1}\def\CVprofile{docencia}\input{cv.tex}'
```

### Flujos antiguos (siguen funcionando)

```bash
cd main && lualatex cv.tex      # compila el perfil por defecto → main/cv.pdf
cd main && lualatex index.tex   # wrapper obsoleto, mismo resultado
```

Los PDF sueltos en `main/` están gitignorados; prefiere el Makefile.

## Estructura: mapa del repositorio

```
├── Makefile                   ← compilación; la lista PROFILES vive aquí
├── main/
│   ├── cv.tex                 ← documento maestro (NO se edita por perfil)
│   ├── index.tex              ← wrapper de compatibilidad (obsoleto)
│   ├── yaac-another-awesome-cv.cls  ← clase LaTeX (comentada en español)
│   ├── fonts/                 ← Source Sans Pro vendorizada
│   ├── config/
│   │   ├── personal.tex       ← nombre, tagline, foto, contacto, bibliografía
│   │   └── settings.tex       ← ajustes de diseño compartidos
│   ├── profiles/              ← 1 perfil = 1 archivo; SOLO líneas \input
│   └── sections/
│       ├── declaraciones/     ← perfil profesional, uno por área
│       ├── experiencias/
│       │   ├── entradas/      ← biblioteca: 1 archivo por redacción de cada empleo
│       │   └── 2_experiencias_*.tex   ← selectores por área
│       ├── competencias/      ← habilidades técnicas por área
│       ├── anexos/
│       │   ├── catalogo.tex   ← cada certificado definido UNA sola vez
│       │   └── 12_anexos_*.tex← qué anexos lleva cada área
│       └── otros/             ← formación, certificados, idiomas, logros,
│                                proyectos, voluntariado, referencias, publicaciones
├── assets/
│   ├── anexos/                ← PDF de certificados: "YYYYMMDD descripcion.pdf"
│   └── images/profile/        ← fotos de perfil
├── bibliography/              ← my_publications.bib (BibLaTeX)
├── docs/                      ← guías detalladas (índice en README.md)
└── .github/workflows/build.yml← CI: compila los 6 perfiles; tag v* → Release
```

**Regla de oro:** los perfiles y selectores solo **eligen y ordenan**; el
contenido vive una única vez en `sections/`. Si te descubres copiando el mismo
texto en dos archivos, hay una forma mejor de hacerlo.

## Recetas de edición manual

### 1. Actualizar datos personales o de contacto

Todo está en [main/config/personal.tex](main/config/personal.tex) y se propaga
a los 6 perfiles: `\name{...}{...}`, `\tagline{...}`, `\photo{2.5cm}{...}`,
el bloque `\socialinfo{...}` (teléfono, correo, LinkedIn, GitHub, etc.) y
`\authorFullName` (usado por el pie de página).

Después: `make` y revisar `build/cv-sector-publico.pdf`.

### 2. Editar una experiencia existente (texto o fechas)

Cada empleo tiene un archivo **base** y, cuando la redacción está adaptada,
**variantes** `--<perfil>` en
[main/sections/experiencias/entradas/](main/sections/experiencias/entradas/):

```
2024-12_sofia-coordinador.tex                    ← base
2024-12_sofia-coordinador--sector-publico.tex    ← variante
2024-12_sofia-coordinador--data-science.tex      ← variante
...
```

**Paso 1 — localizar todas las variantes del empleo:**

```bash
ls main/sections/experiencias/entradas/ | grep sofia
```

**Paso 2 — saber qué variante usa cada perfil** (los selectores lo deciden):

```bash
grep -rn "sofia" main/sections/experiencias/2_experiencias_*.tex
```

**Paso 3 — editar.** La estructura de una entrada es:

```latex
\experience
{Fecha fin} {Cargo}{Empresa}{Ciudad}
{Fecha inicio} {
	Descripción breve del rol.
	\begin{itemize}
		\item Logro o función 1
		\item Logro o función 2
	\end{itemize}
}
{\footnotesize{\emph{Entidad:} ... | Período: ...}}
```

> ⚠️ **Las fechas están duplicadas en la base y en TODAS sus variantes** (y a
> veces también en el pie "Período: ..."). Si cambias una fecha, cámbiala en
> todos los archivos del empleo — el paso 1 te da la lista completa. Verifica
> con: `grep -n "2024" main/sections/experiencias/entradas/*sofia*`

**Paso 4 — compilar los perfiles afectados** (o `make all` si tocaste la base).

### 3. Añadir una experiencia nueva

1. **Crea el archivo** en `main/sections/experiencias/entradas/` con el nombre
   `YYYY-MM_slug-descriptivo.tex` (fecha de **inicio** del empleo; así el
   listado queda cronológico). Usa la estructura de la receta 2 — lo más
   simple es copiar una entrada existente parecida.
2. **Regístrala en los selectores** de las áreas donde deba aparecer
   (`2_experiencias_docencia.tex`, `2_experiencias_sector_publico.tex`, ...),
   en la posición deseada (orden = orden de aparición en el PDF):

   ```latex
   \entradaExperiencia{2026-05_onpe-capacitador}
   \emptySeparator
   ```

   Sin la extensión `.tex`, y **siempre con `\entradaExperiencia`, nunca con
   `\input`** — `\input` rompe el escaneo de filas de la tabla interna y
   produce el error `Misplaced \omit`.
3. Si un perfil necesita una redacción distinta (otro énfasis, otras viñetas),
   crea la variante `YYYY-MM_slug--<perfil>.tex` y apunta el selector de ese
   perfil a la variante.
4. Compila los perfiles afectados.

Los archivos `_banco-*.tex` son **plantillas comentadas con empleadores
genéricos** — material de referencia, no experiencia real; no los actives.

### 4. Añadir un certificado (anexo)

Cuatro pasos, siempre en este orden:

1. **PDF** → guárdalo en `assets/anexos/` como `YYYYMMDD descripcion en minusculas.pdf`
   (fecha de emisión primero: ordena cronológicamente en el explorador).
2. **Catálogo** → define su macro **una sola vez** en
   [main/sections/anexos/catalogo.tex](main/sections/anexos/catalogo.tex),
   en orden cronológico descendente:

   ```latex
   % Constancia de Trabajo — CAU/UNSCH (07/03/2026)
   \providecommand{\anexoCauConstanciaTrabajo}{%
   	\includepdf[pages=-]{../assets/anexos/20260307 constancia de trabajo cau unsch.pdf}}
   ```

   Para documentos apaisados añade la opción `landscape`:
   `\includepdf[pages=-, landscape]{...}`.
3. **Áreas** → llama al macro (`\anexoCauConstanciaTrabajo`) en los
   `12_anexos_*.tex` de las áreas donde aplique.
4. **Listado textual** → añade la entrada correspondiente en
   `main/sections/otros/4_certificados.tex` (la sección "Cursos y estudios
   complementarios" que ven todos los perfiles).

### 5. Reemplazar un certificado por una versión nueva

Cuando llega una versión actualizada del mismo documento (p. ej. una
constancia reexpedida con otra fecha):

1. Guarda el PDF nuevo en `assets/anexos/` con su propio nombre `YYYYMMDD ...pdf`.
2. En `catalogo.tex`, **actualiza la ruta dentro del macro existente** (y el
   comentario con la fecha). No dupliques el macro.
3. Si el nombre del archivo viejo ya no se usa en ningún macro, puedes borrar
   el PDF antiguo.
4. Audita que ninguna ruta quedara rota (una ruta inexistente **rompe la
   compilación** en `\includepdf`):

   ```bash
   cd main && grep -h includepdf sections/anexos/catalogo.tex \
     | grep -oP '\{\K[^}]+' \
     | while read f; do [ -f "$f" ] || echo "FALTA: $f"; done
   ```

   (Las dos líneas `FALTA: ...` con puntos suspensivos literales son ejemplos
   del encabezado del catálogo; ignóralas.)

### 6. Editar formación, idiomas, logros, proyectos o referencias

Son secciones **compartidas por todos los perfiles**, en
[main/sections/otros/](main/sections/otros/):

| Archivo                     | Contenido                            |
| --------------------------- | ------------------------------------ |
| `3_formacion_academica.tex` | grados y estudios                    |
| `4_certificados.tex`        | listado de cursos/certificados       |
| `5_idiomas_habilidades.tex` | idiomas y habilidades destacadas     |
| `6_logros.tex`              | logros y reconocimientos             |
| `8_proyectos.tex`           | proyectos                            |
| `9_voluntariado.tex`        | voluntariado                         |
| `10_referencias.tex`        | referencias                          |
| `11_publicaciones.tex`      | publicaciones (ver receta 9)         |

Como afectan a todo, tras editarlas ejecuta `make all`.

### 7. Cambiar la declaración o las competencias de un área

- **Declaración** (párrafo inicial del CV): un archivo por área en
  `main/sections/declaraciones/`.
- **Competencias técnicas**: un archivo por área en
  `main/sections/competencias/`.

Ambos se editan directamente y solo afectan a su perfil: basta `make <perfil>`.

### 8. Crear un perfil nuevo

1. Copia el perfil existente más parecido:

   ```bash
   cp main/profiles/docencia.tex main/profiles/investigacion.tex
   ```

2. Ajusta sus líneas `\input` (qué declaración, qué selector de experiencias,
   qué competencias, qué anexos). Un perfil **solo contiene `\input`s** — el
   contenido nuevo va en `sections/`.
3. Añade el nombre a la variable `PROFILES` del [Makefile](Makefile).
4. `make investigacion` para probar. No hay que tocar el CI: ejecuta `make all`,
   que lee `PROFILES`.

### 9. Activar la sección de publicaciones

Por defecto está desactivada (comentada en todos los perfiles) porque exige
una pasada extra de `biber`.

1. La bibliografía vive en `bibliography/my_publications.bib` y ya está
   cargada vía `\addbibresource` en `config/personal.tex`.
2. En el perfil deseado, descomenta la línea:

   ```latex
   \input{sections/otros/11_publicaciones}
   ```

3. Compila con la pasada de biber:

   ```bash
   make economia BIBER=1
   ```

## Verificación antes de hacer commit

1. **Compila lo afectado**: `make <perfil>` si tocaste algo de un solo perfil;
   **`make all` si tocaste config, secciones compartidas (`otros/`), el
   catálogo de anexos o una entrada base**.
2. **Revisa el PDF** en `build/` (fechas, saltos de página, anexos al final).
3. **Audita los anexos** con el one-liner de la [receta 5](#5-reemplazar-un-certificado-por-una-versión-nueva).
4. **No commitees artefactos**: `build/`, `output/` y `main/*.pdf` están
   gitignorados — los PDF se distribuyen por Releases, nunca por git.
5. Si el cambio es estructural (nuevo perfil, nueva sección, reorganización),
   documenta en [CHANGELOG.md](CHANGELOG.md).

## Publicar una versión (GitHub Releases)

```bash
git tag v3.1.1
git push origin v3.1.1
```

GitHub Actions compila los 6 perfiles y publica los PDF como Release. Cada
push a `master` y cada PR también compilan todo como verificación continua.

## Errores frecuentes

| Síntoma | Causa | Solución |
| --- | --- | --- |
| `Misplaced \omit` al compilar | Se usó `\input` dentro del entorno `experiences` | Usa `\entradaExperiencia{...}` en los selectores (receta 3) |
| `File '../assets/anexos/....pdf' not found` | Un macro del catálogo apunta a un PDF renombrado/borrado | Actualiza la ruta en `catalogo.tex` (receta 5) y corre la auditoría |
| `Fatal Package fontspec Error` o fuentes rotas | Se compiló con pdfLaTeX | Compila con **LuaLaTeX** (o XeLaTeX) |
| El PDF dice "página X de ??" | Falta la segunda pasada | Vuelve a ejecutar la misma orden `lualatex` (el Makefile ya hace dos) |
| Edité una entrada y el PDF no cambia | Editaste la base pero el perfil usa una variante `--<perfil>` (o viceversa) | `grep` el selector del perfil para ver qué archivo carga (receta 2, paso 2) |
| Citas vacías o `\cite` sin resolver | Publicaciones activas sin pasada de biber | `make <perfil> BIBER=1` |
| Cambié una fecha y aparece la vieja en otro perfil | Fechas duplicadas entre base y variantes | Corrige **todas** las variantes del empleo (receta 2, paso 1) |

## Referencia rápida de macros

Entornos y macros definidos por la clase (referencia completa en
[docs/referencia-yaac.md](docs/referencia-yaac.md)):

| Macro / entorno | Para qué |
| --- | --- |
| `\experience{fin}{cargo}{empresa}{ciudad}{inicio}{desc}{pie}` | una entrada de experiencia |
| `experiences` + `\entradaExperiencia{archivo}` + `\emptySeparator` | bloque de experiencias |
| `scholarship` / `\scholarshipentry` | formación y becas |
| `keywords` / `\keywordsentry` | bloques de palabras clave |
| `skills` / `\skill` | barras de habilidades |
| `projects` / `\project` | proyectos |
| `referees` / `\referee` | referencias |
| `publications` | bibliografía (biber) |
| `\sectionTitle{Título}{\faIcono}` | título de sección con ícono |

## Documentación adicional

| Documento | Contenido |
| --- | --- |
| [docs/README.md](docs/README.md) | índice de las guías (generado) |
| [docs/decisiones.md](docs/decisiones.md) | decisiones de diseño, con fecha |
| [docs/GUIA_PRACTICA.md](docs/GUIA_PRACTICA.md) | casos de uso reales por tipo de postulación |
| [docs/PLANTILLAS_RAPIDAS.md](docs/PLANTILLAS_RAPIDAS.md) | one-liners útiles (compilar y abrir, copias con nombre de envío) |
| [docs/GUIA_PUBLICACIONES.md](docs/GUIA_PUBLICACIONES.md) | gestión de la bibliografía |
| [docs/referencia-yaac.md](docs/referencia-yaac.md) | referencia completa de macros de la clase YAAC |

## Límite honesto

- **Solo LuaLaTeX** (o XeLaTeX): pdfLaTeX no compila la clase; `latexmk` no se usa.
- **Sin pruebas automáticas**: la verificación es compilar (`make all`), mirar el PDF y auditar los anexos.
- **Los PDF no están en git**: se descargan de las Releases o se compilan; `04 index/resources/cv.pdf`
  del hub es una copia manual, no se regenera desde aquí.
- **El contenido es personal**: la plantilla se reutiliza; los textos, anexos e imágenes no.
- **La plantilla de pull request vive en `../.github/PULL_REQUEST_TEMPLATE.md`** (la raíz del repo es `09 trabajo`,
  que es donde GitHub la lee; se movió allí el 2026-09-20).

## Licencia

Plantilla bajo [CC BY-SA 4.0](LICENSE). El contenido del CV (textos, anexos,
imágenes) es personal y no reutilizable.
