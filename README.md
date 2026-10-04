---
tipo: readme
estado: activo
---
# 09 trabajo/ — carpeta de trabajo del autor y raíz del repo Curriculum-Vitae (solo cv/ versionado)

## Qué es

Esta carpeta es la raíz del repo git `Curriculum-Vitae` (remoto público en GitHub), cuyo producto es el
**CV multiperfil en LaTeX** de `cv/`. Comparte la carpeta con material de trabajo que no se publica:
el `.gitignore` es una **lista blanca** que ignora todo y solo re-incluye `cv/`, `.github/`,
`CLAUDE.md`, `AGENTS.md`, este `README.md` y el propio `.gitignore`.

## Uso

```bash
make -C cv                   # compila el perfil por defecto → cv/build/cv-sector-publico.pdf
make -C cv docencia          # un perfil; make -C cv all compila los seis
git ls-files | grep -v '^cv/'   # lo versionado fuera de cv/: debe ser solo la lista blanca
```

Perfiles, requisitos y la orden sin `make`: `cv/README.md`. Publicar una versión: `cv/docs/publicar.md`.

## Estructura

| carpeta o archivo | qué es | en git |
|---|---|---|
| `cv/` | el CV multiperfil en LaTeX (clase YAAC en español, seis perfiles, anexos) | sí |
| `.github/workflows/build.yml` | CI: compila los seis perfiles en cada push y pull request; una etiqueta `v*` publica los PDF como Release | sí |
| `.gitignore` | la lista blanca y los artefactos de LaTeX | sí |
| `CLAUDE.md` (+ `AGENTS.md`) | reglas para el asistente | sí |
| el resto de carpetas | carpetas no versionadas (repos propios y material de trabajo), cada una con su `README.md` local | no |

## Documentación

| documento | para qué leerlo |
|---|---|
| `cv/README.md` | el CV: perfiles, compilación, estructura, licencia |
| `cv/docs/README.md` | índice de las guías del CV (editar, postular, publicar, referencia de la clase, decisiones) |
| `CLAUDE.md` | reglas para el asistente: qué se versiona, qué no, dónde va cada cosa |

## Límite honesto

- **Lo no versionado no se respalda desde aquí**: la lista blanca lo deja fuera de git a propósito (el
  remoto es público) y ningún proceso del repo lo copia.
- **Un clon trae solo el CV**: `cv/`, la CI, `.gitignore` y las guías; los README locales de las demás
  carpetas no están en el remoto.
- **La raíz del repo es esta carpeta, no `cv/`**: la CI y el `.gitignore` cuelgan de aquí
  (`make -C cv`).
- **`04 index/resources/cv.pdf` es una copia manual** del PDF del CV; no se regenera desde aquí.
