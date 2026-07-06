# Curriculum Vitae — Edison Achalma

Sistema de CV multi-perfil en LaTeX, construido sobre un fork en español de la clase
[YAAC: Another Awesome CV](https://github.com/darwiin/yaac-another-awesome-cv).
Un solo repositorio de contenido genera **seis variantes del CV**, cada una adaptada
a un área profesional distinta.

## Perfiles disponibles

| Perfil | Comando | Anexos incluidos |
|---|---|---|
| Sector Público | `make sector-publico` | del área |
| Docencia | `make docencia` | del área |
| Data Science | `make data-science` | del área |
| Sector Financiero | `make sector-financiero` | del área |
| Economía (completo) | `make economia` | todos |
| Consultoría | `make consultoria` | todos |

## Compilación

Requisitos: **LuaLaTeX** (obligatorio — la clase usa `fontspec` y fuentes OpenType,
incluidas en `main/fonts/`) y `biber` solo si se activa la sección de publicaciones.

```bash
make                  # perfil por defecto (sector-publico)
make docencia         # un perfil concreto
make all              # los 6 perfiles
make clean            # limpiar build/
```

Los PDF se generan en `build/cv-<perfil>.pdf`. La carpeta `build/` no se versiona:
los PDF finales se distribuyen vía GitHub Releases.

También sigue funcionando el flujo clásico: `cd main && lualatex index.tex`
(compila el perfil por defecto).

## Estructura

```
├── main/
│   ├── cv.tex                 # documento maestro (NO se edita por perfil)
│   ├── index.tex              # wrapper de compatibilidad (obsoleto)
│   ├── config/
│   │   ├── personal.tex       # datos personales/contacto — fuente única
│   │   └── settings.tex       # ajustes de diseño compartidos
│   ├── profiles/              # 1 perfil = 1 archivo; solo selecciona secciones
│   ├── sections/              # contenido: declaraciones, experiencias,
│   │                          # competencias, anexos y secciones comunes (otros/)
│   ├── fonts/                 # Source Sans Pro vendorizada
│   └── yaac-another-awesome-cv.cls
├── assets/                    # anexos (PDF), fotos, previews
├── bibliography/              # publicaciones (BibLaTeX)
├── docs/                      # guías de uso detalladas
└── Makefile
```

## Cómo…

- **¿Cambiar de perfil?** No se edita nada: `make <perfil>`.
- **¿Crear un perfil nuevo?** Copia un archivo de `main/profiles/`, ajusta los
  `\input` y añade su nombre a `PROFILES` en el `Makefile`.
- **¿Actualizar datos de contacto?** Solo en `main/config/personal.tex`
  (se propaga a todos los perfiles).
- **¿Editar una experiencia?** Cada redacción vive una sola vez en
  `main/sections/experiencias/entradas/` (variantes `--<perfil>` cuando el
  texto está adaptado); los archivos `2_experiencias_*.tex` solo seleccionan
  y ordenan entradas con `\entradaExperiencia{...}`.
- **¿Añadir un certificado?** Guarda el PDF en `assets/anexos/` con el formato
  `YYYYMMDD descripcion.pdf`, define su macro una sola vez en
  `sections/anexos/catalogo.tex`, llámalo en los `12_anexos_*.tex` de las
  áreas pertinentes y agrégalo a `sections/otros/4_certificados.tex`.
- **¿Publicar una versión?** `git tag v3.x.y && git push origin v3.x.y` —
  GitHub Actions compila los 6 perfiles y publica los PDFs como Release.

Guías completas en [docs/](docs/INDICE.md).

## Licencia

Plantilla bajo [CC BY-SA 4.0](LICENSE). El contenido del CV (textos, anexos,
imágenes) es personal y no reutilizable.
