---
tipo: doc
titulo: "📚 Índice General del Sistema de CV Multi-Perfil"
estado: activo
---
# 📚 Índice General del Sistema de CV Multi-Perfil

## 🎯 Visión general

Un solo repositorio de contenido genera seis variantes del CV, cada una
adaptada a un área profesional. El perfil se elige **al compilar** —
no se copian archivos ni se comentan líneas.

```bash
make docencia    # → build/cv-docencia.pdf
make all         # → los 6 perfiles
```

## 📂 Estructura real del repositorio

```
├── Makefile                       ← compilación de todos los perfiles
├── README.md                      ← guía rápida (raíz)
├── CHANGELOG.md                   ← historial de cambios estructurales
│
├── main/
│   ├── cv.tex                     ← documento maestro (no se edita por perfil)
│   ├── index.tex                  ← wrapper de compatibilidad (obsoleto)
│   ├── yaac-another-awesome-cv.cls← clase LaTeX (comentada en español)
│   ├── fonts/                     ← Source Sans Pro (OpenType, vendorizada)
│   │
│   ├── config/
│   │   ├── personal.tex           ← datos personales/contacto (fuente única)
│   │   └── settings.tex           ← ajustes de diseño compartidos
│   │
│   ├── profiles/                  ← UN PERFIL = UN ARCHIVO (solo selección)
│   │   ├── sector-publico.tex · docencia.tex · data-science.tex
│   │   └── sector-financiero.tex · economia.tex · consultoria.tex
│   │
│   └── sections/
│       ├── declaraciones/         ← perfil profesional, una por área
│       ├── experiencias/
│       │   ├── entradas/          ← UNA EXPERIENCIA = UN ARCHIVO por redacción
│       │   │                        (base + variantes --<perfil>)
│       │   └── 2_experiencias_*.tex  ← selectores por área (solo \input)
│       ├── competencias/          ← habilidades técnicas, una por área
│       ├── anexos/
│       │   ├── catalogo.tex       ← CADA CERTIFICADO SE DEFINE UNA VEZ
│       │   └── 12_anexos_*.tex    ← listas de macros por área
│       └── otros/                 ← secciones comunes: formación, certificados,
│                                    idiomas, logros, proyectos, voluntariado,
│                                    referencias, publicaciones
│
├── assets/
│   ├── anexos/                    ← PDFs de certificados (YYYYMMDD descripcion.pdf)
│   └── images/                    ← fotos de perfil y previews
│
├── bibliography/my_publications.bib  ← publicaciones (BibLaTeX)
├── build/                         ← PDFs generados (NO se versiona)
└── .github/workflows/build.yml    ← CI: compila en cada push; Release en tags v*
```

## 🚀 Quick Start — 3 pasos

1. **Identifica tu área** → uno de los 6 perfiles.
2. **Compila**: `make <perfil>`.
3. **Revisa** `build/cv-<perfil>.pdf` y ajusta contenido si hace falta
   (ver la tabla de "dónde se edita qué" abajo).

## 🗺 ¿Dónde se edita qué?

| Quiero cambiar…                        | Archivo                                              |
| -------------------------------------- | ---------------------------------------------------- |
| Teléfono, email, foto, tagline         | `main/config/personal.tex`                            |
| Qué secciones lleva un perfil          | `main/profiles/<perfil>.tex`                          |
| El texto de una experiencia            | `main/sections/experiencias/entradas/<entrada>.tex`   |
| Qué experiencias muestra un perfil     | `main/sections/experiencias/2_experiencias_<área>.tex`|
| La declaración de un perfil            | `main/sections/declaraciones/1_declaracion_<área>.tex`|
| Las competencias de un perfil          | `main/sections/competencias/7_competencias_<área>.tex`|
| Agregar un certificado (anexo)         | `main/sections/anexos/catalogo.tex` + listas por área |
| Formación, idiomas, logros, referencias| `main/sections/otros/`                                |

## 📖 Guías disponibles

| Documento                | Contenido                                              |
| ------------------------ | ------------------------------------------------------ |
| `README.md` (raíz)       | Guía rápida: compilación, estructura, recetas           |
| `docs/README.md`         | Referencia completa de la plantilla YAAC y sus macros   |
| `docs/GUIA_PRACTICA.md`  | Casos de uso reales paso a paso                         |
| `docs/PLANTILLAS_RAPIDAS.md` | Checklist pre-envío y plantillas de emails          |
| `docs/GUIA_PUBLICACIONES.md` | Gestión de publicaciones académicas con BibLaTeX    |
| `CHANGELOG.md`           | Historial de cambios estructurales                      |

## ➕ Recetas de escalabilidad

- **Nuevo perfil**: copia un archivo de `main/profiles/`, ajusta sus `\input`,
  añade el nombre a `PROFILES` en el `Makefile`.
- **Nueva redacción de una experiencia**: crea
  `entradas/<fecha>_<empleo>--<perfil>.tex` y refiérela desde el selector del área.
- **Nuevo certificado**: PDF en `assets/anexos/` (`YYYYMMDD descripcion.pdf`),
  macro en `catalogo.tex`, llamada en los `12_anexos_*.tex` pertinentes y entrada
  en `otros/4_certificados.tex`.
- **Publicar una versión**: `git tag v3.x.y && git push origin v3.x.y` —
  GitHub Actions compila y publica los 6 PDFs como Release.
