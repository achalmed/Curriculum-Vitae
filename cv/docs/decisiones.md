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
