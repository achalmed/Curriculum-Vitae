---
tipo: guia_ia
estado: activo
---
# CLAUDE.md — cv (repo `Curriculum-Vitae`)

El CV multiperfil del autor en LaTeX: seis perfiles desde un único contenido, sobre la clase YAAC
adaptada. No es un framework de documentos ni guarda expedientes de trabajo. Léase antes: `README.md`,
`estado.md`, `docs/README.md`. Rigen las reglas del `CLAUDE.md` raíz de `~/Documents`: aquí solo lo
que el raíz no dice. `AGENTS.md` es un enlace a este archivo.

## Reglas propias

- **El remoto es público:** no entra en git nada que no sea del CV; `drafts/` (documentos de
  terceros), `build/`, `output/` y los PDF de `main/` están ignorados y así se quedan.
- **Ningún dato de contacto de terceros:** las referencias usan `\refereeSinContacto` (nombre, cargo,
  institución) y la nota «disponibles a solicitud»; nunca `\referee` con correo o teléfono.
- **Datos personales del autor solo en `main/config/personal.tex`**; el diseño compartido, en
  `main/config/settings.tex`.
- **Perfiles y selectores solo eligen y ordenan**; el contenido vive una sola vez en `main/sections/`.
  Un perfil contiene solo `\input` e `\inputAnexos`; `main/cv.tex` no lleva contenido por perfil.
- **En los selectores de experiencias, `\entradaExperiencia{<archivo>}`, nunca `\input`** (rompe la
  `longtable` de `experiences`: «Misplaced \omit»).
- **Cada certificado se define una sola vez** en `main/sections/anexos/catalogo.tex`; las listas
  `12_anexos_*.tex` solo llaman macros. Anexos con nombre `AAAAMMDD descripcion en minusculas.pdf`.
- **Los PDF nunca se confirman:** se publican como Release con una etiqueta `v*` (la CI) o se
  generan para un consumidor con `scripts/construir-pdf.sh`; nunca se copian a mano.
- **No se activa la sección de publicaciones** ni se recomienda `BIBER=1`: el `.bib` es de ejemplo y
  `biber` falla con la clase actual (`estado.md` §Por hacer).

## Verificar

```bash
make all                                  # los seis perfiles compilan (también lo hace la CI)
scripts/construir-pdf.sh                  # simula el derivado; con --aplicar compila y marca el PDF
git status --short --ignored | grep -v '^!!'   # nada nuevo sin querer (un borrador o un PDF)
pdftotext build/cv-<perfil>.pdf - | grep -c '@'   # solo el correo del autor
```

Tras tocar el frontmatter de `docs/`: `python3 core/docs.py indice cv --aplicar` (desde `~/Documents`).
Si se tocaron anexos, la auditoría de rutas de `docs/edicion.md` (receta 5).

## Trampas

- **Las fechas de un empleo están repetidas** en su entrada base y en todas sus variantes `--<perfil>`
  (y a veces en el pie «Período: …»): se cambian todas.
- **`_banco-*.tex`** en `main/sections/experiencias/entradas/` son plantillas con empleadores
  genéricos, no experiencia real.
- **La biblatex de la clase usa `backend = bibtex`** y el `Makefile` llama a `biber`: por eso
  `BIBER=1` falla.
- **El historial público conserva los contactos de los referentes** anteriores a la retirada (P083):
  no se reescribe sin decisión del autor.
- **`04 index/resources/cv.pdf` es todavía una copia manual**; el hub pasará a invocar
  `scripts/construir-pdf.sh` (ola 6 del programa). Nadie lo copia a mano mientras tanto sin avisar.
- **Licencias por partes** (`README.md` §Licencia): la plantilla, LPPL 1.3c (`LICENSE`); la fuente,
  OFL 1.1 (`main/fonts/LICENSE`); el contenido personal, sin licencia.

## Dónde está cada cosa

| qué | dónde |
|---|---|
| datos y contacto del autor · diseño | `main/config/personal.tex` · `main/config/settings.tex` |
| perfiles | `main/profiles/` y la lista `PROFILES` del `Makefile` |
| contenido por sección | `main/sections/` |
| certificados (una macro por anexo) | `main/sections/anexos/catalogo.tex` |
| macros de la clase | `main/yaac-another-awesome-cv.cls` |
| CI y Releases | `.github/workflows/build.yml` |
| derivado `cv.pdf` para otros repos | `scripts/construir-pdf.sh` |
| estado, pendientes y decisiones | `estado.md` · `docs/README.md` (índice generado de las guías) |

<!-- Notas para mantenedores (no entran al contexto): longitud y docs/*.md citados según RQ-DOC-05
     (normativa documental 3.11); lo que solo vale para una subcarpeta va a .claude/rules/<tema>.md con paths:. -->
