# Changelog

Todos los cambios notables de este proyecto se documentan en este archivo.
Formato basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/).

## [Sin publicar]

### Añadido
- Versión "solo descriptivo" del CV: `make <perfil> ANEXOS=0` compila
  cualquier perfil **sin** las constancias/certificados adjuntos y genera
  `build/cv-<perfil>-sin-anexos.pdf` (no sobrescribe la versión completa).
  Mecanismo: macro `\inputAnexos` en `cv.tex` (omite la carga si
  `\CVsinAnexos` está definida); los 6 perfiles cargan sus anexos con ella.

### Cambiado
- Fechas de ingreso/cese de experiencias sincronizadas con el Legajo
  Virtual: Sofía dic 2023–dic 2024 (estaba corrida un año) y CAU
  Metodología e IA nov 2025–ene 2026 (variantes unificadas; deja de
  figurar como trabajo actual).
- Referencias actualizadas desde el legajo: contacto directo del director
  CAU y cuatro referentes nuevos (ONPE ×2, INEI, Corporación Educativa
  Sofía).
- `README.md` reescrito como manual completo: compilación manual sin
  Makefile, 9 recetas de edición paso a paso, tabla de errores frecuentes
  y referencia de macros.

## [3.1.0] — 2026-07-06

Des-duplicación de contenido y automatización CI/CD.

### Añadido
- `main/sections/experiencias/entradas/`: biblioteca de entradas de
  experiencia — un archivo por redacción (base + variantes `--<perfil>`
  donde el texto está adaptado). Los archivos `2_experiencias_*.tex`
  quedan como selectores puros.
- Macro `\entradaExperiencia{<archivo>}` en la clase: inserta una entrada
  dentro del entorno `experiences` usando el primitivo `\@@input` (el
  `\input` de LaTeX rompe el escaneo de filas de la longtable y produce
  "Misplaced \omit").
- `main/sections/anexos/catalogo.tex`: cada certificado/constancia se
  define una sola vez (ruta + orientación); los `12_anexos_*.tex` son
  ahora listas de macros.
- `.github/workflows/build.yml`: cada push a master compila los 6
  perfiles; cada tag `v*` publica los PDFs como GitHub Release.

### Cambiado
- `docs/` reescrita contra la estructura real: `INDICE.md`,
  `GUIA_PRACTICA.md` y `PLANTILLAS_RAPIDAS.md` ya no describen el flujo
  antiguo de copiar archivos; `docs/README.md` y `GUIA_PUBLICACIONES.md`
  actualizan compilación y rutas al sistema multi-perfil.

### Verificado
- El texto extraído de los 6 PDFs es idéntico antes y después de la
  refactorización (verificación con pdftotext contra línea base).

## [3.0.0] — 2026-07-06

Reestructuración arquitectónica: de "CV con variantes comentadas" a
**sistema multi-perfil compilable**.

### Añadido
- `main/cv.tex`: documento maestro parametrizado por la macro `\CVprofile`.
- `main/profiles/`: seis perfiles ejecutables (sector-publico, docencia,
  data-science, sector-financiero, economia, consultoria). Un perfil = un
  archivo que solo selecciona secciones; ya no se comenta/descomenta nada.
- `main/config/personal.tex` y `main/config/settings.tex`: datos personales
  y ajustes de diseño extraídos como fuente única de configuración.
- `Makefile`: `make <perfil>`, `make all` (los 6 PDF), `make clean`,
  `BIBER=1` para la sección de publicaciones. Salida en `build/`.
- `README.md` raíz y este `CHANGELOG.md`.

### Cambiado
- `main/index.tex` queda como wrapper de compatibilidad (compila el perfil
  por defecto); el flujo antiguo `lualatex index.tex` sigue funcionando.
- `.gitignore` amplía cobertura: `build/`, `output/`, `drafts/`,
  `main/*.pdf`, artefactos de entorno (`.Rhistory`, `.directory`, `*.sav`,
  `*.sdr/`).

### Corregido
- Referencia rota en los anexos de docencia y sector financiero: apuntaban
  a `20260123 constancia de trabajo cau unsch.pdf`, reemplazada por la
  versión vigente `20260307`.

### Eliminado
- Artefactos generados que estaban versionados: PDFs compilados (`output/`,
  `main/cv edison.pdf`), `.log`, sidecars `.sdr`, historiales de R,
  autosaves de bibliografía.
- `drafts/` fuera del control de versiones (contenía documentos de terceros
  que no deben publicarse); los archivos permanecen solo en la copia local.
- CI de CircleCI muerta (compilaba una ruta inexistente desde hacía años) y
  configuración obsoleta del bot no-response.
- Historia de Git reescrita para purgar binarios pesados y documentos de
  terceros (repositorio público).
