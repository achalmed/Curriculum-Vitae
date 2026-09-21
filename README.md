---
tipo: readme
estado: activo
---
# 09 trabajo/ — expedientes de trabajo y el CV (repo Curriculum-Vitae, solo cv/ versionado)

## Qué es

Carpeta de **trabajo** del autor: los expedientes de cada empleo o encargo (contratos, constancias,
rendiciones, productos), las postulaciones y el registro como proveedor del Estado, junto con dos
proyectos que viven aquí por vecindad: el **CV multiperfil** en LaTeX (`cv/`) y el programa de radio
(`radio/`), además del **despacho parlamentario**, que es cliente de varios repos del ecosistema.

La carpeta es a la vez la raíz del repo git `Curriculum-Vitae` (remoto público en GitHub): el
`.gitignore` es una **lista blanca** que ignora todo y solo re-incluye `cv/`, `.github/`, `CLAUDE.md`,
`AGENTS.md`, este `README.md` y el propio `.gitignore`. Todo lo demás son expedientes **no
versionados** con datos personales y de terceros: no se copian ni se publican fuera de esta máquina.
`radio/` y el despacho son, además, repos git independientes (el despacho, privado y sin remoto).

## Uso

```bash
make -C cv                       # compila el perfil por defecto del CV → cv/build/cv-sector-publico.pdf
make -C cv docencia              # un perfil; make -C cv all compila los seis
git -C . tag v3.1.1 && git push origin v3.1.1   # publica los PDF como Release (CI en .github/workflows/build.yml)
git ls-files | grep -v '^cv/'    # lo versionado fuera de cv/: debe ser solo la lista blanca
```

Los expedientes no tienen comandos: se leen. Cada uno lleva un `README.md` (fuera de git) que dice
qué contiene y dónde está lo relacionado.

## Estructura

| carpeta | qué es | dueño / en git |
|---|---|---|
| `cv/` | el CV multiperfil en LaTeX (clase YAAC en español; seis perfiles; anexos; CI que publica Releases) | a mano; **versionado** (`cv/README.md`, `cv/CLAUDE.md`) |
| `radio/` | el programa de radio y pódcast «Democraticemos el Perú»: emisiones, investigación, fuentes, archivo | repo propio (`radio/README.md`); ignorado aquí |
| `congreso de la republica - despacho-diputado/` | los registros del despacho parlamentario (manifiesto `despacho.yml`, perfil, documentos, representación, legislativo, coordinación, prensa, operaciones); cliente de `sgdp`, `identidad_visual` y `05 tasks` | repo propio, privado, sin remoto; ignorado aquí |
| `certificados_laborales/` | constancias y certificados de trabajo emitidos por empleadores (PDF) | expediente; fuera de git |
| `inei_censo_2025/` | encargo del censo 2025 del INEI: contratos y constancias, actas, productos entregados, pagos y rendiciones de cuenta | expediente; fuera de git |
| `onpe_elecciones_generales_2026/` | encargo de la ONPE para las elecciones generales 2026: administración, capacitación, operaciones, carteles y publicaciones, fotografías, rendiciones | expediente; fuera de git |
| `onpe_segunda_eleccion_presidencial_2026/` | encargo de la ONPE para la segunda elección presidencial 2026: capacitación, documentos operativos, formatos institucionales, constancias de no adeudo, fotografías, rendiciones | expediente; fuera de git |
| `postulaciones/` | postulaciones a convocatorias: bases y documentos presentados (PDF) | expediente; fuera de git |
| `practicas_preprofesionales/` | prácticas preprofesionales: informes, constancias y formatos (ODT, ODS, PDF) | expediente; fuera de git |
| `registro_nacional_proveedores/` | inscripción en el Registro Nacional de Proveedores (RNP) del OSCE: constancias (PDF) | expediente; fuera de git |
| `.github/workflows/build.yml` | CI del CV: compila los seis perfiles en cada push y PR; un tag `v*` publica los PDF como Release | versionado |
| `.gitignore` | la lista blanca (arriba) más los artefactos LaTeX | versionado |

## Documentación

| documento | para qué leerlo |
|---|---|
| `CLAUDE.md` | reglas para el asistente: qué se versiona, qué no, dónde manda cada `CLAUDE.md` |
| `cv/README.md` | el CV: compilación, mapa, nueve recetas de edición, errores frecuentes |
| `cv/CLAUDE.md` | reglas del CV para el asistente (LuaLaTeX, capas, `\entradaExperiencia`, PDF por Releases) |
| `cv/docs/README.md` | índice de las guías del CV (generado) |
| `radio/README.md` | el programa: qué vive ahí y qué no, cadena de producción |
| `<expediente>/README.md` | qué contiene cada expediente y dónde está lo relacionado (fuera de git) |

Notas de pensamiento sobre estos encargos: vault, `01 notes/30-trabajo-y-negocios/`. El papeleo
personal (identidad, finanzas, salud, solicitudes) es de `08 personal/`, no de aquí.

## Límite honesto

- **Los expedientes no se versionan ni se respaldan desde aquí**: la lista blanca los deja fuera de
  git a propósito (el remoto es público) y ningún timer los copia; su respaldo es el de la máquina.
- **Los README de los expedientes tampoco están en git**: existen en disco, no en el remoto; un
  clon del repo trae solo `cv/`, la CI, las guías y este README.
- **El repo se llama `Curriculum-Vitae` y su raíz es esta carpeta, no `cv/`**: la CI y el `.gitignore`
  cuelgan de aquí (`make -C cv`); es una decisión de 2026-09-06, no un error.
- **`04 index/resources/cv.pdf` es una copia manual** del PDF del CV, no se regenera desde aquí.
