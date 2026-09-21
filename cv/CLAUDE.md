---
tipo: guia_ia
estado: activo
---
# CLAUDE.md — cv (repo `Curriculum-Vitae`, raíz en `09 trabajo/`)

Guía para el asistente. En español, como todo el ecosistema. `AGENTS.md` es un enlace a este archivo.
Léase antes: `README.md` (compilación, mapa, nueve recetas de edición, errores frecuentes),
`docs/README.md` (índice de las guías) y `../CLAUDE.md` (la lista blanca de la carpeta).

## Qué es

Sistema de CV personal en LaTeX, construido sobre un fork comentado en español de la clase **YAAC:
Another Awesome CV** (`main/yaac-another-awesome-cv.cls`). Es **multiperfil**: un solo repositorio de
contenido produce seis variantes del CV, una por área (sector público, docencia, data science, sector
financiero, economía, consultoría). El perfil se elige **al compilar** con la macro `\CVprofile`,
**nunca** comentando o descomentando líneas `\input`.

## Reglas que no se negocian

- **LuaLaTeX, obligatorio** (la clase usa `fontspec` y fuentes OpenType, incluidas en `main/fonts/`);
  XeLaTeX funciona, pdfLaTeX no. `latexmk` no está instalado: el `Makefile` llama a `lualatex` dos
  veces (referencias y numeración «página X de Y»), con `biber` entre ambas solo si `BIBER=1`.
- **Los PDF generados nunca se confirman**: `build/`, `output/` y `main/*.pdf` están ignorados; se
  distribuyen por GitHub Releases (un tag `v*` dispara `../.github/workflows/build.yml`).
- **Los perfiles y selectores solo eligen y ordenan**; el contenido vive una única vez en
  `main/sections/`. Un perfil (`main/profiles/<perfil>.tex`) contiene **solo** líneas `\input`.
  Nada de contenido ni de lógica por perfil en `main/cv.tex` (el maestro: `\documentclass`, config
  compartida y `\input{profiles/\CVprofile}`, con `sector-publico` por defecto si la macro no existe).
- **En los selectores de experiencias, `\entradaExperiencia{<archivo>}`, nunca `\input`**: el `\input`
  de LaTeX rompe el escaneo de filas de la `longtable` del entorno `experiences` y falla con
  «Misplaced \omit»; `\entradaExperiencia` usa el primitivo expandible `\@@input`, definido en la clase.
- **Cada certificado se define una sola vez** en `main/sections/anexos/catalogo.tex` (macro
  `\anexo<Nombre>` = ruta + orientación); los `12_anexos_*.tex` por área son listas de esas macros.
  Una ruta caduca rompe `\includepdf` al compilar: tras reemplazar un PDF, auditar (abajo).
- **Datos personales solo en `main/config/personal.tex`** (nombre, tagline, foto, `\socialinfo`,
  `\addbibresource`, `\authorFullName` para el pie); `main/config/settings.tex` lleva el diseño
  compartido. Fuente única para los seis perfiles.
- **Comentarios y contenido en español**, como toda la clase y las secciones.
- **Nombres de anexo `YYYYMMDD descripcion en minusculas.pdf`** en `assets/anexos/` (fecha primero:
  orden cronológico).
- **Un cambio estructural** (perfil nuevo, sección nueva, reorganización) se anota en `CHANGELOG.md`.

## Cómo se verifica un cambio

```bash
make                    # perfil por defecto (sector-publico) → build/cv-sector-publico.pdf
make docencia           # un perfil; ANEXOS=0 genera build/cv-docencia-sin-anexos.pdf
make all                # los seis: obligatorio si se tocó config/, otros/, el catálogo o una entrada base
make economia BIBER=1   # con biber (solo si la sección de publicaciones está activa)
make clean              # borra build/
cd main && grep -h includepdf sections/anexos/catalogo.tex | grep -oP '\{\K[^}]+' \
  | while read f; do [ -f "$f" ] || echo "FALTA: $f"; done   # auditoría de anexos
```

La auditoría de anexos imprime dos `FALTA: ...` con puntos suspensivos literales: son los ejemplos
del encabezado del catálogo, se ignoran. Los flujos antiguos siguen compilando el perfil por
defecto: `cd main && lualatex cv.tex` (o `index.tex`, envoltorio obsoleto). Desde la carpeta
`09 trabajo`: `make -C cv <perfil>`; la CI compila los seis perfiles en cada push y PR.

## Detalles que cuesta redescubrir

- **Capas de `main/`**: `config/` (configuración), `profiles/` (selección: un archivo por área) y
  `sections/` (contenido): `declaraciones/` (una por área); `experiencias/` con `entradas/` (la
  biblioteca: un archivo por redacción de cada empleo, base + variantes `--<perfil>`) y los
  `2_experiencias_*.tex` (selectores puros); `competencias/` (por área); `anexos/` (catálogo + listas
  por área); `otros/` (formación, certificados, idiomas, logros, proyectos, voluntariado, referencias,
  publicaciones: compartidas por todos).
- **Las fechas de un empleo están duplicadas** en la base y en todas sus variantes (y a veces en el
  pie «Período: …»): cambiar una exige cambiarlas todas (listar las variantes del empleo con `ls` y
  `grep` en `main/sections/experiencias/entradas/`; receta 2 del `README.md`).
- **`_banco-*.tex` en `main/sections/experiencias/entradas/`** son plantillas comentadas con
  empleadores genéricos, no experiencia real: no se activan.
- **Perfil nuevo**: copiar uno de `main/profiles/`, ajustar sus `\input` y añadir el nombre a
  `PROFILES` en el `Makefile`; la CI no se toca (`make all` lee `PROFILES`).
- **Certificado nuevo**: PDF en `assets/anexos/`, una macro en el catálogo, una llamada por área
  pertinente y una entrada en `main/sections/otros/4_certificados.tex` (receta 4 del `README.md`).
- **Publicaciones**: la bibliografía se carga en `main/config/personal.tex` y la renderiza el
  entorno `publications` de `main/sections/otros/11_publicaciones.tex`, comentado en todos los perfiles porque
  exige la pasada de `biber` (`BIBER=1`).
- **`assets/`**: `assets/anexos/` (PDF canónicos), `assets/images/profile/` (retratos),
  `assets/images/preview/` (vistas de página para las guías).
- **`drafts/` y `output/`** existen solo en local (ignorados): referencias superadas y salidas
  antiguas; no son parte del repo.
- **`docs/README.md` es el índice generado** (`core/docs.py indice "09 trabajo/cv" --aplicar`, desde
  `~/Documents`); la referencia completa de la plantilla YAAC y sus macros es
  `docs/referencia-yaac.md`; `docs/PULL_REQUEST_TEMPLATE.md` conserva su nombre porque lo impone
  GitHub.

## Dónde está cada cosa

| pregunta | documento |
|---|---|
| compilar, mapa del repo, recetas 1–9, errores frecuentes, macros | `README.md` |
| casos de uso por tipo de postulación | `docs/GUIA_PRACTICA.md` |
| one-liners: compilar y abrir, copias con nombre de envío | `docs/PLANTILLAS_RAPIDAS.md` |
| la bibliografía y `biber` | `docs/GUIA_PUBLICACIONES.md` |
| entornos y macros de la clase YAAC (`experiences`, `keywords`, `skills`…) | `docs/referencia-yaac.md` |
| versiones y desde cuándo | `CHANGELOG.md` |
| qué se versiona en `09 trabajo` y por qué el repo está enraizado allí | `../README.md`, `../CLAUDE.md` |
