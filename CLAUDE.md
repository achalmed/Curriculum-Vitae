---
tipo: guia_ia
estado: activo
---
# CLAUDE.md — 09 trabajo (repo `Curriculum-Vitae`)

Guía para el asistente. En español, como todo el ecosistema. `AGENTS.md` es un enlace a este archivo.
Léase antes: `README.md` (qué se versiona aquí), `cv/README.md` (el CV) y `cv/docs/README.md`.
Es la única guía del repo: también manda dentro de `cv/`.

## Reglas que no se negocian

### La carpeta y el repo

- **Solo `cv/` y los archivos de raíz de la lista blanca se versionan.** El `.gitignore` ignora todo
  (`/*`) y re-incluye `.gitignore`, `.github/`, `CLAUDE.md`, `AGENTS.md`, `README.md` y `cv/`. El
  remoto es **público**: nada fuera de esa lista entra en git.
- **Los expedientes de trabajo son datos sensibles** (contratos, rendiciones, constancias de terceros,
  fotos): no se copian, no se publican ni se resumen fuera de esta máquina; se citan por carpeta.
  Ningún documento versionado describe su contenido ni el del despacho.
- **`radio/` y el despacho son repos propios** con su `CLAUDE.md`, que manda en su carpeta: no se les
  hace `git add` desde aquí, no se anidan como submódulos y esta guía no repite sus reglas.
- **Nada del despacho** (titular, identificadores, retratos) en la parte versionada (regla 8 del
  `CLAUDE.md` raíz del ecosistema; D12 del doctor).
- Cada expediente lleva un `README.md` (`# <carpeta>/ — <qué es dueña>`, pocas líneas, sin nombres de
  personas), fuera de git por la lista blanca.

### El CV (`cv/`)

- **LuaLaTeX, siempre** (la clase usa `fontspec`; fuentes en `cv/main/fonts/`). El `Makefile` hace dos
  pasadas de `lualatex`; no se usa `latexmk` ni otro motor.
- **Los PDF nunca se confirman**: `cv/build/`, `cv/output/` y `cv/main/*.pdf` están ignorados; se
  publican como Release con una etiqueta `v*`.
- **Perfiles y selectores solo eligen y ordenan**; el contenido vive una sola vez en
  `cv/main/sections/`. Un perfil contiene solo `\input` e `\inputAnexos`. `cv/main/cv.tex` no lleva
  contenido ni lógica por perfil.
- **En los selectores de experiencias, `\entradaExperiencia{<archivo>}`, nunca `\input`** (rompe la
  `longtable` de `experiences`: «Misplaced \omit»).
- **Cada certificado se define una sola vez** en `cv/main/sections/anexos/catalogo.tex`; las listas
  `12_anexos_*.tex` solo llaman macros.
- **Datos personales solo en `cv/main/config/personal.tex`**; el diseño compartido, en
  `cv/main/config/settings.tex`.
- **Anexos con nombre `AAAAMMDD descripcion en minusculas.pdf`** en `cv/assets/anexos/`.
- **No se activa la sección de publicaciones** ni se recomienda `BIBER=1`: el `.bib` es de ejemplo y
  `biber` falla con la clase actual (pendiente en `cv/docs/decisiones.md`).
- Un cambio estructural (perfil, sección, reorganización) se anota en `cv/CHANGELOG.md`.

### Dónde va cada cosa nueva

Raíz del repo admitida: `README.md`, `CLAUDE.md`, `AGENTS.md`, `LICENSE`, `.gitignore`, `.github/workflows/`.
En `cv/`: `README.md`, `CHANGELOG.md`, `Makefile`, el `.code-workspace` y las carpetas del
proyecto. Ningún otro `.md` fuera de `cv/docs/`.

| lo que apareció | va a | nunca a |
|---|---|---|
| cómo se compila | `cv/README.md` §Uso | un `GUIA_RAPIDA.md` |
| cómo se edita una pieza del CV | `cv/docs/edicion.md` | el README |
| cómo se prepara una postulación | `cv/docs/postular.md` | notas sueltas en `docs/` |
| cómo se publica, y quién consume los PDF | `cv/docs/publicar.md` (§Consumidores) | — |
| una macro u opción de la clase | `cv/docs/referencia-yaac.md` | el README |
| por qué se decidió algo · un pendiente | `cv/docs/decisiones.md` (§Pendientes, con fecha y dueño) | un `TODO.md`, un `DECISION_<fecha>.md` |
| qué cambió en una versión | `cv/CHANGELOG.md` | el README |
| una regla para el asistente | este archivo | un segundo `CLAUDE.md` |

Lo que hiciste en esta sesión va al mensaje de commit, no a un archivo. Si nada encaja, pregunta antes
de crear un documento.

## Cómo se verifica un cambio

```bash
git ls-files | grep -v '^cv/'      # solo .github/workflows/build.yml, .gitignore, AGENTS.md, CLAUDE.md, README.md
git status --short                 # si aparece un expediente, la lista blanca se rompió
make -C cv all                     # los seis perfiles compilan (también lo hace la CI)
```

Desde `~/Documents`, la normativa de archivos sobre lo versionado del repo, sin los repos anidados
(`validar "09 trabajo"` también recorre el despacho y `radio/`):

```bash
python3 core/archivos.py validar "09 trabajo/README.md" "09 trabajo/CLAUDE.md" "09 trabajo/.gitignore" "09 trabajo/cv"
python3 core/docs.py indice "09 trabajo/cv" --aplicar     # tras tocar el frontmatter de cv/docs/
```

Si se tocaron anexos, la auditoría de rutas de `cv/docs/edicion.md` (receta 5).

## Detalles que cuesta redescubrir

- **La raíz del repo es esta carpeta, no `cv/`**: la CI hace `make -C cv all` y sube `cv/build/*.pdf`;
  las etiquetas y los `git` se hacen desde aquí.
- **`README.md` de la raíz es la portada pública del repo**: describe el CV y nombra el resto solo
  como «no versionado».
- **Las fechas de un empleo están repetidas** en su entrada base y en todas sus variantes `--<perfil>`
  (y a veces en el pie «Período: …»): se cambian todas.
- **`_banco-*.tex`** en `cv/main/sections/experiencias/entradas/` son plantillas con empleadores
  genéricos, no experiencia real.
- **La biblatex de la clase usa `backend = bibtex`** y el `Makefile` llama a `biber`: por eso
  `BIBER=1` falla.
- **`cv/docs/README.md` es un índice generado**; se regenera, no se edita entre sus marcas.
- **`04 index/resources/cv.pdf` es una copia manual** de un PDF de `cv/build/`
  (`cv/docs/publicar.md`).
- **Licencias por partes** (`cv/README.md` §Licencia): la plantilla, LPPL 1.3c (`LICENSE` en la raíz);
  la fuente, OFL 1.1 (`cv/main/fonts/LICENSE`); el contenido personal, sin licencia.

## Dónde está cada cosa

| pregunta | documento |
|---|---|
| qué se versiona aquí y qué no | `README.md` |
| compilar el CV, perfiles, estructura | `cv/README.md` |
| editar contenido, si falla la compilación | `cv/docs/edicion.md` |
| postular · publicar | `cv/docs/postular.md` · `cv/docs/publicar.md` |
| macros de la clase | `cv/docs/referencia-yaac.md` |
| decisiones y pendientes | `cv/docs/decisiones.md` |
| versiones | `cv/CHANGELOG.md` |
| el programa de radio · el despacho | su propio `README.md` y `CLAUDE.md` (repos aparte) |
