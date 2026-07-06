# Changelog

Todos los cambios notables de este proyecto se documentan en este archivo.
Formato basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/).

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
