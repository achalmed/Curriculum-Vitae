---
tipo: doc
estado: activo
titulo: "Cómo publicar una versión del CV (Release) y la copia que consume el sitio web"
---
# Cómo publicar una versión del CV

Para el autor. Los PDF no se versionan en git: se distribuyen como Release de GitHub y, aparte, una
copia se publica en el sitio web del ecosistema.

## Release en GitHub

La CI (`.github/workflows/build.yml`) compila los seis perfiles con `make -C cv all` en cada push a
`master` y en cada pull request, y guarda los PDF como *artifact* durante 30 días. Una etiqueta `v*`
además publica los PDF de `cv/build/` como Release, con notas generadas por GitHub.

1. Anota los cambios de la versión en `cv/CHANGELOG.md` (la sección «Sin publicar» pasa a
   `[X.Y.Z] — AAAA-MM-DD`).
2. Confirma y etiqueta desde la raíz del repo:

   ```bash
   git tag vX.Y.Z
   git push origin master vX.Y.Z
   ```

3. Comprueba la Release en la pestaña *Releases* del repo `Curriculum-Vitae`.

La versión sigue SemVer de hecho: mayor para un cambio de arquitectura del sistema, menor para
funciones nuevas (un perfil, una sección), parche para correcciones.

## Copia para el sitio web

El sitio académico publica el CV como `04 index/resources/cv.pdf`. **Es una copia manual**: nada la
regenera desde aquí.

1. Compila el perfil que se publica (`make -C cv <perfil>`).
2. Copia el PDF sobre el del sitio, desde `~/Documents`:

   ```bash
   cp "09 trabajo/cv/build/cv-<perfil>.pdf" "04 index/resources/cv.pdf"
   ```

3. Publica el sitio según su propia documentación (`04 index/README.md`).

Qué perfil se publica en el sitio está pendiente de decidir (ver [decisiones.md](decisiones.md)).

## Consumidores

| consumidor | qué toma | cómo | quién lo actualiza |
|---|---|---|---|
| `04 index` (sitio académico) | un PDF compilado, como `04 index/resources/cv.pdf`; lo enlazan su portada y `_quarto.yml` (recurso) | copia manual (arriba) | el autor, al publicar una versión |
| GitHub Releases | `cv/build/*.pdf` de los seis perfiles | `.github/workflows/build.yml` en cada etiqueta `v*` | la CI |

Si cambian el nombre o la ubicación de los PDF (`cv/build/cv-<perfil>.pdf`), hay que avisar a
`04 index`, que guarda la copia con nombre fijo.
