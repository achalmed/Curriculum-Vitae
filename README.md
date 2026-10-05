---
tipo: readme
estado: activo
---
# cv/ — Curriculum Vitae de Edison Achalma: CV multiperfil en LaTeX (repo Curriculum-Vitae)

Un CV en LaTeX que produce **seis variantes**, una por área profesional, desde un único contenido. El
perfil se elige al compilar (la macro `\CVprofile`), nunca comentando líneas. Está construido sobre un
fork comentado en español de la clase
[YAAC: Another Awesome CV](https://github.com/darwiin/yaac-another-awesome-cv), de Christophe Roger.
Esta carpeta es la raíz del repo `Curriculum-Vitae` (remoto público en GitHub).

| perfil | orden | experiencias y anexos |
|---|---|---|
| Sector público (por defecto) | `make sector-publico` | del área |
| Docencia | `make docencia` | del área |
| Data science | `make data-science` | del área |
| Sector financiero | `make sector-financiero` | del área |
| Economía | `make economia` | versión larga; todos los anexos |
| Consultoría | `make consultoria` | versión larga; todos los anexos |

## Uso

Requisitos: LuaLaTeX (la clase usa `fontspec`; las fuentes Source Sans Pro vienen en `main/fonts/`) y
`make`. Desde esta carpeta:

```bash
make                    # perfil por defecto → build/cv-sector-publico.pdf
make docencia           # un perfil → build/cv-docencia.pdf
make all                # los seis perfiles
make docencia ANEXOS=0  # sin los certificados adjuntos → build/cv-docencia-sin-anexos.pdf
make clean              # borra build/
scripts/construir-pdf.sh                                   # simula: qué compilaría y adónde copiaría
scripts/construir-pdf.sh --perfil docencia --salida /ruta/cv.pdf --aplicar   # el derivado cv.pdf, con marca
```

El `Makefile` hace dos pasadas de `lualatex` con salida en `build/`; sin `make`, la orden equivalente es:

```bash
mkdir -p build && cd main
lualatex --interaction=nonstopmode --halt-on-error --output-directory=../build \
  --jobname=cv-docencia '\def\CVprofile{docencia}\input{cv.tex}'   # dos veces
```

Las guías (editar, postular, publicar, referencia de la clase, decisiones) están en `docs/README.md`.

## Estructura

| carpeta o archivo | qué es | dueño |
|---|---|---|
| `Makefile` | compilación; la lista `PROFILES` de los perfiles | a mano |
| `scripts/construir-pdf.sh` | generador del derivado `cv.pdf` para otros repos (simula por defecto) | a mano |
| `main/cv.tex` | documento maestro: clase, configuración y `\input{profiles/\CVprofile}` | a mano |
| `main/yaac-another-awesome-cv.cls` | la clase YAAC adaptada (incluye `\entradaExperiencia` y `\refereeSinContacto`) | a mano |
| `main/config/` | `personal.tex` (datos y contacto del autor, fuente única) y `settings.tex` (diseño) | a mano |
| `main/profiles/` | un archivo por perfil; solo líneas `\input` e `\inputAnexos` | a mano |
| `main/sections/` | el contenido: declaraciones, experiencias (`entradas/` + selectores por área), competencias, anexos (`catalogo.tex` + listas por área) y secciones comunes (`otros/`) | a mano |
| `main/fonts/` | Source Sans Pro | ajeno |
| `main/index.tex` | envoltorio antiguo: compila el perfil por defecto | a mano |
| `assets/anexos/` | PDF de certificados y constancias, `AAAAMMDD descripcion.pdf` | a mano |
| `assets/images/` | retratos (`profile/`) y vistas de página (`preview/`) | a mano |
| `bibliography/` | `my_publications.bib` (hoy, solo ejemplos) | a mano |
| `docs/` | las guías; índice generado en `docs/README.md` | a mano + `core/docs.py indice` |
| `.github/workflows/build.yml` | CI: compila los seis perfiles en cada push y pull request; una etiqueta `v*` publica los PDF como Release | a mano |
| `estado.md` · `CHANGELOG.md` | estado del proyecto · cambios por versión | a mano |
| `build/` | PDF compilados y auxiliares; fuera de git | `make` |

## Límite honesto

- **Solo LuaLaTeX.** pdfLaTeX no compila la clase; el `Makefile` no usa `latexmk`.
- **Sin pruebas automáticas:** la verificación es compilar (`make all`, también en la CI), mirar el PDF
  y auditar las rutas de los anexos (`docs/edicion.md`, receta 5).
- **La sección de publicaciones no se puede activar hoy:** `make … BIBER=1` falla y el `.bib` solo
  trae ejemplos (pendiente en `estado.md`).
- **Los PDF no están en git:** se compilan o se descargan de las Releases. La copia del sitio web
  (`04 index/resources/cv.pdf`) aún es manual; el hub la pedirá a `scripts/construir-pdf.sh`.
- **Las referencias no publican contactos de terceros** desde 2026-10-05, pero el historial público del
  repo conserva los de antes: reescribirlo es decisión del autor (`estado.md`).
- **El contenido es personal:** la plantilla se puede reutilizar; los textos, los anexos y las
  imágenes, no.

## Licencia

Tres partes, tres regímenes:

| parte | licencia |
|---|---|
| la plantilla: la clase `main/yaac-another-awesome-cv.cls` (adaptación de YAAC), `main/cv.tex` como esqueleto, `Makefile`, `scripts/` | LaTeX Project Public License 1.3c o superior, la de la clase original (`LICENSE`) |
| la fuente Source Sans Pro de `main/fonts/` | SIL Open Font License 1.1, de Adobe (`main/fonts/LICENSE`) |
| el contenido: textos de `main/sections/` y `main/profiles/`, `assets/` (anexos e imágenes), `bibliography/` | personal, sin licencia: no se ofrece para reutilizar |
