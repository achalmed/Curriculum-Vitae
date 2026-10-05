---
tipo: doc
estado: activo
forma: guia
titulo: "Cómo publicar una versión del CV (Release) y la copia que consume el sitio web"
---
# Cómo publicar una versión del CV

Para el autor. Los PDF no se versionan en git: se distribuyen como Release de GitHub y, aparte, una
copia se publica en el sitio web del ecosistema.

## Release en GitHub

La CI (`.github/workflows/build.yml`) compila los seis perfiles con `make all` en cada push a
`master` y en cada pull request, y guarda los PDF como *artifact* durante 30 días. Una etiqueta `v*`
además publica los PDF de `build/` como Release, con notas generadas por GitHub.

1. Anota los cambios de la versión en `CHANGELOG.md` (la sección `[Unreleased]` pasa a
   `[X.Y.Z] - AAAA-MM-DD`, formato Keep a Changelog).
2. Confirma y etiqueta desde la raíz del repo:

   ```bash
   git tag vX.Y.Z
   git push origin master vX.Y.Z
   ```

3. Comprueba la Release en la pestaña *Releases* del repo `Curriculum-Vitae`.

La versión sigue SemVer de hecho: mayor para un cambio de arquitectura del sistema, menor para
funciones nuevas (un perfil, una sección), parche para correcciones.

## Copia para el sitio web

El sitio académico publica el CV como `04 index/resources/cv.pdf`. Ese archivo es un **derivado**: lo
produce `scripts/construir-pdf.sh`, que compila el perfil con `make` y escribe en los metadatos del PDF
(Subject) la marca «GENERADO por cv/scripts/construir-pdf.sh …». Sin `--aplicar` solo simula.

1. Mira qué haría (las rutas salen de `core/env.sh`: `DOCS_ROOT` es `~/Documents`, `INDEX_DIR` el hub):

   ```bash
   . ~/Documents/core/env.sh
   "$DOCS_ROOT/cv/scripts/construir-pdf.sh" --perfil <perfil> --salida "$INDEX_DIR/resources/cv.pdf"
   ```

2. Repite con `--aplicar` para compilar y copiar; `pdfinfo "$INDEX_DIR/resources/cv.pdf"` muestra la marca.
3. Publica el sitio según su propia documentación (`04 index/README.md`).

Mientras el hub no invoque el generador por sí mismo (ola 6 del programa), la orden la lanza el autor.
Qué perfil se publica en el sitio está pendiente de decidir (`../estado.md`).

## Consumidores

| consumidor | qué toma | cómo | quién lo actualiza |
|---|---|---|---|
| `04 index` (sitio académico) | un PDF compilado, como `04 index/resources/cv.pdf`; lo enlazan su portada y `_quarto.yml` (recurso) | `scripts/construir-pdf.sh --salida … --aplicar` (arriba) | el autor, hasta que el hub invoque el generador |
| GitHub Releases | `build/*.pdf` de los seis perfiles | `.github/workflows/build.yml` en cada etiqueta `v*` | la CI |

Si cambian el nombre o las opciones de `scripts/construir-pdf.sh`, hay que avisar a `04 index`, que
guarda la copia con nombre fijo.
