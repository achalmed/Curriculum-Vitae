---
tipo: estado
estado: activo
actualizado: 2026-10-05
---
# estado.md — cv

## Hecho

| fecha | qué | dónde se ve |
|---|---|---|
| 2026-10-05 | El repo se separa de `09 trabajo`: `.git` trasladado a `cv/` sin reescribir el historial, README fundido, `.gitignore` sin lista blanca, CI con rutas nuevas; la carpeta vive en `~/Documents/cv` | `git log`; `docs/decisiones.md` (2026-10-05); `meta/programa/05-piloto/piloto.md` §2 |
| 2026-10-05 | Correos y teléfonos de los referentes retirados del CV (P083); `\refereeSinContacto` en la clase | `main/sections/otros/10_referencias.tex` |
| 2026-10-05 | Generador del derivado `cv.pdf`, con marca en los metadatos y simulación por defecto | `scripts/construir-pdf.sh` |
| 2026-10-05 | `estado.md`, README y `CLAUDE.md` según la normativa documental; lo pendiente sale de `docs/decisiones.md` | este archivo |

## En curso

Nada en curso. Cierre de sesión: `cv` · `master` · queda el push autorizado por el autor (Puerta P5) ·
siguiente paso: `git push origin master` y comprobar la CI en GitHub.

## Por hacer

- 2026-10-05 · dueño: el autor · Autorizar el push de la separación (Puerta P5) y comprobar que la CI compila con las rutas nuevas (riesgo 13 del plan de conversión); hasta entonces el remoto conserva la estructura vieja.
- 2026-10-05 · dueño: el autor · limite: 2026-10-11 · **Historial público con contactos de terceros** (P083): los correos y teléfonos retirados siguen en los commits anteriores del remoto público. Reescribirlo cambia todos los hashes y no des-expone lo ya publicado (I3 de la Puerta P2): lo decide el autor.
- 2026-10-05 · dueño: el autor · Dos anexos de `assets/anexos/` (constancias emitidas por instituciones) muestran el correo o el teléfono del funcionario firmante; `--sin-anexos` los omite. Decidir si la versión pública los incluye.
- 2026-10-05 · dueño: el autor · Las referencias siguen nombrando a los referentes (nombre, cargo, institución); decidir si la versión pública los conserva o deja solo «disponibles a solicitud».
- 2026-10-05 · dueño: el autor · Obsidian ignoraba `09 trabajo/cv/`: el filtro `userIgnoreFilters` de `.obsidian/app.json` (en `~/.dotfiles`) debe pasar a `cv/`; no se tocó porque `.obsidian` y `~/.dotfiles` los aprueba el autor (plan de conversión, T1).
- 2026-10-05 · dueño: el programa (ola 6) · `CV_DIR` en `core/env` cuando el hub invoque `scripts/construir-pdf.sh` (su primer consumidor de código; sin consumidor, RQ-RUT-05).
- 2026-10-04 · dueño: el autor · Qué perfil se publica en `04 index/resources/cv.pdf` (P084). El hub invocará `scripts/construir-pdf.sh` en la ola 6 del programa; hasta entonces su copia es manual y no se toca desde aquí.
- 2026-10-04 · dueño: el autor · limite: 2026-10-18 · `bibliography/my_publications.bib` y la «opción 3» de `main/sections/otros/11_publicaciones.tex` traen publicaciones de ejemplo atribuidas al autor, con DOI inexistentes, en un repo público: sustituirlas o vaciarlas (P082).
- 2026-10-04 · dueño: el autor · `make … BIBER=1` falla: la clase carga biblatex con `backend = bibtex` y el `Makefile` llama a `biber`; pasar la clase a `backend = biber` o cambiar el `Makefile`.
- 2026-10-04 · dueño: el autor · Un anexo PDF lleva una ruta local de la máquina en sus metadatos: limpiar los metadatos de los anexos versionados (P085).

## Futuro

- Pruebas automáticas: comprobar en la CI que ningún PDF contiene correos distintos del del autor.
- Tokens de identidad (nombre, colores) generados desde un manifiesto común con `identidad-visual`
  (normativa documental 2.3, fila 18).
