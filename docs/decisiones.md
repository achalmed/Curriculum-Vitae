---
tipo: decision
estado: activo
forma: explicacion
titulo: "Decisiones de diseño del CV multiperfil, por tema y con fecha"
---
# Decisiones del CV multiperfil

Solo decisiones vigentes, una entrada por decisión y con fecha (normativa documental 3.3); lo que
cambió de versión en versión está en `../CHANGELOG.md` y lo pendiente, en `../estado.md`.

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

- **2026-09-06 · El repo se enraíza en `09 trabajo/` con lista blanca.** Superada por la entrada
  del 2026-10-05 (la raíz del repo es `cv/`).
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
- **2026-10-04 · Lo que este repo hace distinto de la norma de documentación.** Superada por la entrada
  del 2026-10-05: con la raíz en `cv/`, `docs/`, `CHANGELOG.md`, `LICENSE`, un solo README y un solo
  `CLAUDE.md` viven donde la norma los pide.
- **2026-10-05 · La raíz del repo es la carpeta del CV, en la raíz del workspace** (piloto 2 del programa de
  reingeniería, procedimiento T4a): `.git` se trasladó de `09 trabajo/` a `cv/` sin reescribir el
  historial (`git log --follow` sigue la historia anterior); los dos README se fundieron; la
  `.gitignore` deja la lista blanca y conserva secretos, productos y borradores; la CI compila desde la
  raíz. Motivo: el CV es un proyecto propio y la carpeta de trabajo mezclaba material sensible con un
  repo público. Fuente: Pro Git (Calibre 10439), *Moving Files*.
- **2026-10-05 · Las referencias no publican datos de contacto de terceros** (P083):
  `\refereeSinContacto` muestra nombre, cargo e institución y una nota «disponibles a solicitud». El
  historial público conserva los datos anteriores; no se reescribe sin decisión del autor (I3 de la
  Puerta P2).
- **2026-10-05 · El PDF que consume otro repo sale de un generador**, `scripts/construir-pdf.sh`, que
  simula por defecto y marca el PDF en sus metadatos (normativa documental 4.5): el consumidor invoca
  al generador del maestro, nunca copia a mano.

