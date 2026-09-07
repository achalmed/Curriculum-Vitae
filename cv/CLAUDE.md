# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal LaTeX CV (curriculum vitae) system for Edison Achalma, built on a Spanish-commented fork
of the **YAAC: Another Awesome CV** LaTeX class ([main/yaac-another-awesome-cv.cls](main/yaac-another-awesome-cv.cls)).
It is a **multi-profile system**: one content repository produces six CV variants tailored to
different job areas (sector público, docencia, data science, sector financiero, economía,
consultoría). The profile is selected at compile time via the `\CVprofile` macro — **never** by
commenting/uncommenting `\input` lines.

## Build / compile commands

Must compile with **LuaLaTeX** (required by the class; XeLaTeX also works, pdfLaTeX does not —
fontspec/OpenType fonts are used, vendored in `main/fonts/`). `latexmk` is NOT installed on this
machine; the Makefile drives plain `lualatex` directly (two passes).

```bash
make                    # default profile (sector-publico) → build/cv-sector-publico.pdf
make docencia           # any single profile
make all                # all 6 profiles
make economia BIBER=1   # add a biber pass (only needed if publicaciones section is active)
make clean              # remove build/
```

Output lands in `build/cv-<perfil>.pdf`. `build/` and `output/` are gitignored — **generated PDFs
are never committed**; distribute them via GitHub Releases.

Legacy flows still work and compile the default profile: `cd main && lualatex index.tex`, or the
local universal compiler script (`compilar_latex.sh ... index`). `main/index.tex` is a deprecated
thin wrapper around `cv.tex`.

## Architecture

**Master document:** [main/cv.tex](main/cv.tex) — defines `\documentclass`, loads shared config,
then does `\input{profiles/\CVprofile}`. It defaults `\CVprofile` to `sector-publico` when the
macro is undefined. Do not put content or per-profile logic here.

**Layers (separation of concerns):**

- `main/config/` — **configuration**: [personal.tex](main/config/personal.tex) (name, tagline,
  photo, `\socialinfo`, `\addbibresource`, `\authorFullName` used by the footer) and
  [settings.tex](main/config/settings.tex) (layout tweaks). Single source of truth shared by all
  profiles; personal data changes happen here only.
- `main/profiles/` — **selection**: one file per job area (`sector-publico.tex`, `docencia.tex`,
  `data-science.tex`, `sector-financiero.tex`, `economia.tex`, `consultoria.tex`). A profile file
  contains ONLY `\input` lines choosing which sections appear and in what order. To add a profile:
  copy one, adjust the `\input`s, and add its name to `PROFILES` in the [Makefile](Makefile).
- `main/sections/` — **content**, grouped by category:
  - `declaraciones/` — profile/summary statement, one per area
  - `experiencias/entradas/` — **the experience content library**: one file per wording of each
    job (base file + `--<perfil>` variants where the text is tailored; `_banco-*.tex` hold
    commented-out template entries with generic employers — not real experience). The
    `2_experiencias_*.tex` files are pure selectors: lists of `\entradaExperiencia{<archivo>}`
    calls (never `\input` — LaTeX's `\input` breaks longtable row scanning inside the
    `experiences` environment and errors with "Misplaced \omit"; `\entradaExperiencia` uses the
    expandable `\@@input` primitive, defined in the class).
  - `competencias/` — technical skills per area
  - `anexos/` — `catalogo.tex` defines each certificate PDF exactly once
    (`\anexo<Nombre>` macro = path + orientation); the per-area `12_anexos_*.tex` are lists of
    those macro calls. To add a certificate: PDF into `assets/anexos/`, one macro in the catalog,
    one call per relevant area, one entry in `otros/4_certificados.tex`.
  - `otros/` — shared area-agnostic sections (formación, certificados, idiomas, logros, proyectos,
    voluntariado, referencias, publicaciones)

**Bibliography:** loaded in `config/personal.tex`; rendered by the `publications` environment in
`sections/otros/11_publicaciones.tex` (commented out in every profile by default — enabling it
requires the biber pass, `BIBER=1`).

**Assets:** `assets/anexos/` (canonical certificate PDFs, named `YYYYMMDD descripcion.pdf`),
`assets/images/profile/` (headshots), `assets/images/preview/` (page previews for docs). When a
certificate is superseded (new version of the same document), update its macro in
`sections/anexos/catalogo.tex` — a stale path breaks `\includepdf` at compile time. Audit with:
`cd main && grep -h includepdf sections/anexos/catalogo.tex | grep -oP '\{\K[^}]+' | while read f; do [ -f "$f" ] || echo "FALTA: $f"; done`

**CI/CD:** `.github/workflows/build.yml` compiles all 6 profiles on every push to master and PR
(container `texlive/texlive:latest`); pushing a `v*` tag additionally publishes the PDFs as a
GitHub Release. This is the distribution channel for compiled CVs.

**`docs/`** contains Spanish-language usage guides, rewritten in v3.1 to match the profile
system (`INDICE.md` is the map). `docs/README.md` keeps the full YAAC macro reference.

**`drafts/`**, **`output/`** exist only locally (gitignored) — superseded reference files and
legacy build output; not part of the repo.

## Working conventions

- All section/class files are commented in Spanish; keep new content and comments consistent with that.
- Section files use custom LaTeX environments/macros defined in the `.cls` (`experiences`,
  `consultantexperience`, `keywords`/`\keywordsentry`, `skills`/`\skill`, `scholarship`/`\scholarshipentry`,
  `projects`/`\project`, `referees`/`\referee`, `publications`). See `docs/README.md` for the macro reference.
- Anexo filenames follow `YYYYMMDD descripcion en minusculas.pdf` (date-first, chronological sort).
- Verify changes by compiling the affected profile (`make <perfil>`); `make all` before committing
  anything that touches shared sections or config.
- Never commit build byproducts or PDFs: `build/`, `output/`, `main/*.pdf` are gitignored. Update
  `CHANGELOG.md` for structural changes.
