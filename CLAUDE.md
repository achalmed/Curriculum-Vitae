---
tipo: guia_ia
estado: activo
---
# CLAUDE.md — 09 trabajo (repo `Curriculum-Vitae`)

Guía para el asistente. En español, como todo el ecosistema. `AGENTS.md` es un enlace a este archivo.
Léase antes: `README.md` (qué es cada subcarpeta y la lista blanca) y, para tocar el CV, `cv/CLAUDE.md`.

## Reglas que no se negocian

- **Solo `cv/` se versiona.** El `.gitignore` es una lista blanca: ignora todo y re-incluye `cv/`,
  `.github/`, `CLAUDE.md`, `AGENTS.md`, `README.md` y el propio `.gitignore`. El remoto es **público**:
  nada que no esté en esa lista entra en git, y en `README.md` y `CLAUDE.md` no hay datos personales
  ni de terceros (solo nombres de carpeta y descripciones genéricas).
- **Los expedientes son datos sensibles** (contratos, rendiciones, constancias de terceros, fotos):
  no se copian, no se publican ni se resumen fuera de esta máquina; se citan por carpeta.
- **Cada `CLAUDE.md` manda en su carpeta**: `cv/CLAUDE.md` para el CV; `radio/CLAUDE.md` para el
  programa; el del despacho (`congreso de la republica - despacho-diputado/CLAUDE.md`) para sus
  registros, con `despacho.yml` como manifiesto y `doctor.sh` como salud. Este archivo no repite
  sus reglas.
- **El despacho y `radio/` son repos git propios**: no se les hace `git add` desde aquí ni se anidan
  como submódulos; el despacho es privado y sin remoto.
- **Nada del despacho** (nombre del titular, ID de página, retratos) en la parte versionada de este
  repo ni en ningún repo de código (regla 8 del `CLAUDE.md` raíz; D12 del doctor).
- **Un README por expediente** (`# <carpeta>/ — <qué es dueña>`, 5–12 líneas: qué contiene por tipo
  y dónde está lo relacionado), fuera de git por la lista blanca; sin nombres de personas dentro.

## Cómo se verifica un cambio

```bash
git ls-files | grep -v '^cv/'                     # solo la CI, .gitignore, AGENTS.md, CLAUDE.md y README.md
git status --short                                # si aparece un expediente, la lista blanca se rompió
make -C cv all                                    # el CV compila (LuaLaTeX; ver cv/CLAUDE.md)
python3 core/archivos.py validar "09 trabajo"     # desde ~/Documents (también recorre los repos anidados)
```

## Detalles que cuesta redescubrir

- **La raíz del repo es esta carpeta, no `cv/`** (fusión de 2026-09-06): la CI hace `make -C cv all` y
  sube `cv/build/*.pdf`; un tag `v*` publica Release. Los PDF nunca van a git.
- **`README.md` de la raíz está en git y es la portada pública del repo `Curriculum-Vitae`**: por eso
  describe los expedientes solo por nombre de carpeta.
- **`cv/docs/README.md` es un índice generado** (`core/docs.py indice "09 trabajo/cv" --aplicar`); la
  referencia de la clase YAAC es `cv/docs/referencia-yaac.md`; `cv/docs/PULL_REQUEST_TEMPLATE.md`
  conserva su nombre en mayúsculas porque lo impone GitHub.
- **`04 index/resources/cv.pdf`** es una copia manual del CV, no un derivado automático.

## Dónde está cada cosa

| pregunta | documento |
|---|---|
| qué es cada subcarpeta y la lista blanca | `README.md` |
| compilar, editar y publicar el CV | `cv/README.md`, `cv/CLAUDE.md`, `cv/docs/README.md` |
| el programa de radio | `radio/README.md` |
| los registros del despacho y sus repos cliente | `congreso de la republica - despacho-diputado/README.md` |
| la fusión del CV con esta carpeta (2026-09-06) | `meta/PROGRESO.md` |
| la mudanza del despacho a repo propio (M10) | `meta/diagnosticos/DIAGNOSTICO_DESPACHO_2026-09.md` |
