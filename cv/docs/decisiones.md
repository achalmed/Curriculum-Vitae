---
tipo: decision
estado: activo
titulo: "Decisiones de diseño del CV multiperfil, por tema y con fecha"
---
# Decisiones del CV multiperfil

Registro acumulativo (NORMATIVA §15.6): una entrada por decisión, con fecha; lo que cambió de
versión en versión está en `../CHANGELOG.md`.

## Perfiles

- **2026-07-06 · El perfil se elige al compilar, no comentando `\input`.** `\CVprofile` selecciona
  `../main/profiles/<perfil>.tex`; un perfil solo contiene `\input` y el contenido vive una vez en
  `../main/sections/`. Descartado: una copia del CV por área (seis archivos que divergen).
- **2026-09-06 · Versión sin anexos por variable, no por perfil.** `ANEXOS=0` define `\CVsinAnexos`
  y `cv.tex` omite los anexos; el PDF lleva sufijo `-sin-anexos` para no pisar el completo.

## Contenido

- **2026-07-06 · Una experiencia = un archivo por redacción** (`../main/sections/experiencias/entradas/`, base + variantes
  `--<perfil>`) y selectores puros por área. Los selectores usan `\entradaExperiencia` (primitivo
  `\@@input`) porque `\input` rompe la `longtable` del entorno `experiences` («Misplaced \omit»).
- **2026-07-06 · Cada certificado se define una sola vez** (`../main/sections/anexos/catalogo.tex`); las listas por
  área solo llaman macros. Una ruta caduca rompe la compilación: se audita, no se adivina.

## Distribución

- **2026-07-06 · Los PDF no van a git**: la CI compila los seis perfiles en cada push y un tag `v*`
  publica Release. Historia reescrita para purgar binarios y documentos de terceros (repo público).

## Ubicación y documentación

- **2026-09-06 · El repo se enraíza en `09 trabajo/` con lista blanca** (solo `cv/` versionado):
  el CV convive con los expedientes de trabajo sin exponerlos; `../../.github/workflows/build.yml` y el
  `CLAUDE.md` de la carpeta cuelgan de la raíz.
- **2026-09-20 (DOC7) · Un solo índice de `docs/`**, generado en `README.md`; la referencia de la
  clase YAAC, que ocupaba ese `README.md`, pasa a `referencia-yaac.md`; `INDICE.md` se elimina (su mapa y sus
  recetas ya estaban en `../README.md`); `CLAUDE.md` en español (NORMATIVA §9.7).
- **2026-10-04 · La documentación se reorganiza por función.** `../README.md` queda como puerta
  (perfiles, uso, estructura, límite honesto, licencia); las recetas de edición pasan a `edicion.md`;
  `GUIA_PRACTICA.md` y `PLANTILLAS_RAPIDAS.md` se funden en `postular.md`; la Release y la copia del
  sitio web, en `publicar.md`, con su sección «Consumidores»; `referencia-yaac.md` se reduce a la
  referencia de la clase contrastada con la `.cls`, y absorbe lo vigente de `GUIA_PUBLICACIONES.md`
  (el resto era un tutorial genérico de BibLaTeX). Se eliminan `biografia.md` (textos para redes
  sociales, sin función en el repo) y la plantilla de pull request heredada del upstream (el repo no
  recibe contribuciones). Un solo `CLAUDE.md`, el de la raíz del repo: `cv/` no es un repo aparte.
  Solo LuaLaTeX: se retira la mención de XeLaTeX.
- **2026-10-04 · Lo que este repo hace distinto de la norma de documentación** (NORMATIVA §15.11):
  `docs/` y `CHANGELOG.md` viven en `cv/` y no en la raíz (`LICENSE` pasó a la raíz el 2026-10-04,
  para que GitHub la detecte), porque la raíz del repo es una
  carpeta de trabajo ignorada casi entera; hay dos README (la portada del repo y la puerta del CV),
  uno por carpeta; la carpeta historial de docs no existe mientras no haya un diagnóstico o plan cerrado que
  guardar.

## Pendientes

| pendiente | anotado | plazo | dueño |
|---|---|---|---|
| ~~**Licencia (prioritario).**~~ *Cerrado el 2026-10-04 por decisión del autor:* plantilla LPPL 1.3c (la de YAAC; Creative Commons no se usa para código, y la adaptación de una obra LPPL sigue su licencia), `LICENSE` a la raíz; la fuente con su `main/fonts/LICENSE` (OFL 1.1), que faltaba; el contenido personal, sin licencia (`../README.md` §Licencia). Texto anterior: `LICENSE` es la LPPL 1.3c de la clase original, pero la cabecera de la `.cls` y `../main/cv.tex` declaran la adaptación CC BY-SA 4.0, y el contenido personal no tiene licencia escrita. Decidir la licencia de la clase adaptada y del sistema, la del contenido, y si `LICENSE` pasa a la raíz del repo (GitHub solo la detecta allí). | 2026-10-04 | — | autor |
| La bibliografía no compila con `make … BIBER=1`: la clase carga biblatex con `backend = bibtex` y el `Makefile` ejecuta `biber` («Cannot find … .bcf»). Pasar la clase a `backend = biber` (motor del ecosistema) o cambiar el `Makefile`. | 2026-10-04 | — | autor |
| `../bibliography/my_publications.bib` y la «opción 3» de `../main/sections/otros/11_publicaciones.tex` contienen publicaciones de ejemplo atribuidas al autor, con DOI inexistentes, en un repo público: sustituirlas por las reales o vaciarlas antes de activar la sección. | 2026-10-04 | — | autor |
| `../main/sections/otros/10_referencias.tex` publica teléfonos y correos de los referentes en el repo público: decidir si la versión pública los conserva. | 2026-10-04 | — | autor |
| Qué perfil se copia a `04 index/resources/cv.pdf` y si la copia se automatiza; la copia publicada hoy es anterior al sistema multiperfil. | 2026-10-04 | — | autor |
| Un anexo PDF de `../assets/anexos/` lleva una ruta local de la máquina en sus metadatos: limpiar los metadatos de los anexos versionados. | 2026-10-04 | — | autor |
| La cabecera de `.github/workflows/build.yml` no empieza por su ruta (fallo A02 de la normativa de archivos): corregir el comentario de la primera línea. | 2026-10-04 | — | autor |
