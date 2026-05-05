# 📚 Guía de Gestión de Publicaciones Académicas

## 🎯 Propósito de este archivo

Esta guía te ayudará a gestionar tus publicaciones académicas en LaTeX usando BibLaTeX para tu CV.

---

## 📖 Contenido

1. [Configuración Inicial](#configuración-inicial)
2. [Tipos de Publicaciones](#tipos-de-publicaciones)
3. [Cómo Agregar Publicaciones](#cómo-agregar-publicaciones)
4. [Compilación con Bibliografía](#compilación-con-bibliografía)
5. [Opciones de Visualización](#opciones-de-visualización)
6. [Gestores de Referencias](#gestores-de-referencias)
7. [Consejos para Académicos](#consejos-para-académicos)
8. [Troubleshooting](#troubleshooting)

---

## ⚙️ Configuración Inicial

### Paso 1: Activar publicaciones en cv.tex

En tu archivo `cv.tex`, asegúrate de tener:

```latex
% En el preámbulo (antes de \begin{document})
\addbibresource{my_publications.bib}

% En el documento (descomenta la línea)
\input{11_publicaciones}
```

### Paso 2: Crear archivo .bib

Crea un archivo `my_publications.bib` en la misma carpeta que `cv.tex`.

### Paso 3: Compilar correctamente

```bash
lualatex cv.tex
biber cv          # ← Importante: genera la bibliografía
lualatex cv.tex   # ← Primera pasada
lualatex cv.tex   # ← Segunda pasada (referencias cruzadas)
```

---

## 📑 Tipos de Publicaciones

### Artículos en Revistas (`@article`)

**Cuándo usar:** Artículos publicados en revistas académicas

```bibtex
@article{clave_unica,
  author  = {Apellido, Nombre},
  title   = {Título del Artículo},
  journal = {Nombre de la Revista},
  year    = {2024},
  volume  = {10},
  number  = {2},
  pages   = {45--67},
  doi     = {10.1234/revista.2024.001}
}
```

### Ponencias en Conferencias (`@inproceedings`)

**Cuándo usar:** Presentaciones en congresos, simposios, etc.

```bibtex
@inproceedings{clave_unica,
  author    = {Apellido, Nombre},
  title     = {Título de la Ponencia},
  booktitle = {Nombre del Congreso},
  year      = {2023},
  pages     = {120--135},
  address   = {Ciudad, País},
  publisher = {Editorial}
}
```

### Capítulos de Libros (`@incollection`)

**Cuándo usar:** Capítulos que escribiste en libros editados

```bibtex
@incollection{clave_unica,
  author    = {Apellido, Nombre},
  title     = {Título del Capítulo},
  booktitle = {Título del Libro},
  editor    = {Nombre del Editor},
  publisher = {Editorial},
  year      = {2023},
  pages     = {145--178},
  chapter   = {6}
}
```

### Libros Completos (`@book`)

**Cuándo usar:** Si escribiste un libro completo (autor único o múltiples)

```bibtex
@book{clave_unica,
  author    = {Apellido, Nombre},
  title     = {Título del Libro},
  publisher = {Editorial},
  year      = {2023},
  address   = {Ciudad},
  isbn      = {978-123-4567-89-0}
}
```

### Tesis (`@thesis`, `@phdthesis`, `@mastersthesis`)

**Cuándo usar:** Tu tesis de licenciatura, maestría o doctorado

```bibtex
@thesis{clave_unica,
  author  = {Apellido, Nombre},
  title   = {Título de la Tesis},
  school  = {Universidad},
  year    = {2025},
  type    = {Tesis de Licenciatura en Economía},
  address = {Ciudad, País}
}
```

### Documentos de Trabajo (`@unpublished`)

**Cuándo usar:** Working papers, preprints, documentos en revisión

```bibtex
@unpublished{clave_unica,
  author = {Apellido, Nombre},
  title  = {Título del Documento},
  note   = {Working Paper No. 2024-05},
  year   = {2024},
  url    = {https://link-al-documento.com}
}
```

### Reportes Técnicos (`@techreport`)

**Cuándo usar:** Informes técnicos, consultorías, estudios encargados

```bibtex
@techreport{clave_unica,
  author      = {Apellido, Nombre},
  title       = {Título del Reporte},
  institution = {Institución que encargó el estudio},
  year        = {2023},
  type        = {Reporte Técnico},
  number      = {RT-2023-012}
}
```

---

## ➕ Cómo Agregar Publicaciones

### Opción 1: Manual (editando el .bib)

1. Abre `my_publications.bib` en tu editor
2. Copia uno de los templates según el tipo
3. Rellena con tus datos
4. Guarda y compila

**Ejemplo paso a paso:**

```bibtex
% 1. Elijo el tipo: artículo
@article{

% 2. Le doy una clave única (sin espacios)
@article{achalma2024informalidad,

% 3. Lleno los campos
  author  = {Achalma Mendoza, Elmer Edison},
  title   = {Determinantes de la Informalidad Laboral en Ayacucho},
  journal = {Revista Peruana de Economía},
  year    = {2024},
  volume  = {15},
  pages   = {45--67}
}
```

### Opción 2: Desde DOI

Si tu artículo tiene DOI, puedes generar automáticamente la entrada .bib:

1. Ve a https://doi2bib.org/
2. Pega el DOI: `10.1234/revista.2024.001`
3. Copia el resultado al .bib

### Opción 3: Desde Google Scholar

1. Busca tu artículo en Google Scholar
2. Click en comillas (") debajo del título
3. Selecciona "BibTeX" en la parte inferior
4. Copia y pega en tu .bib

### Opción 4: Usar gestores (recomendado)

Ver sección [Gestores de Referencias](#gestores-de-referencias)

---

## 🔧 Compilación con Bibliografía

### Workflow completo

```bash
# 1. Primera compilación (genera archivos auxiliares)
lualatex cv.tex

# 2. Procesar bibliografía (lee el .bib y genera referencias)
biber cv

# 3. Segunda compilación (incorpora bibliografía)
lualatex cv.tex

# 4. Tercera compilación (ajusta referencias cruzadas)
lualatex cv.tex
```

### Usando Make

Si tienes un `Makefile` configurado:

```bash
make cv-con-bib
# o
make full
```

### Errores comunes

**Error: "Empty bibliography"**
- Verifica que `\addbibresource{my_publications.bib}` esté descomentado
- Asegúrate de haber ejecutado `biber cv`

**Error: "I found no \citation commands"**
- Verifica que tengas `\nocite{*}` o `\printbibliography` en 11_publicaciones.tex

**Error: "Biber not found"**
- Instala biber: `sudo apt-get install biber` (Linux)
- O reinstala tu distribución LaTeX completa

---

## 🎨 Opciones de Visualización

### Mostrar todas las publicaciones juntas

En `11_publicaciones.tex`:

```latex
\begin{publications}
  \nocite{*}
  \printbibliography[heading={none}]
\end{publications}
```

### Separar por tipo de publicación

```latex
\begin{publications}
  \nocite{*}
  \printbibliography[heading=subbibliography,title={Artículos},type=article]
  \printbibliography[heading=subbibliography,title={Conferencias},type=inproceedings]
  \printbibliography[heading=subbibliography,title={Libros},type=book]
\end{publications}
```

### Separar por año

```latex
\begin{publications}
  \nocite{*}
  \printbibliography[heading=subbibliography,title={2024},year=2024]
  \printbibliography[heading=subbibliography,title={2023},year=2023]
\end{publications}
```

### Separar por tema (usando keywords)

Primero, agrega keywords en tu .bib:

```bibtex
@article{achalma2024,
  ...
  keywords = {economia-desarrollo}
}
```

Luego en 11_publicaciones.tex:

```latex
\begin{publications}
  \nocite{*}
  \printbibliography[heading=subbibliography,title={Economía del Desarrollo},keyword={economia-desarrollo}]
  \printbibliography[heading=subbibliography,title={Econometría},keyword={econometria}]
\end{publications}
```

### Mostrar solo algunas publicaciones

En lugar de `\nocite{*}`, cita específicamente:

```latex
\begin{publications}
  \nocite{achalma2024informalidad,achalma2023juntos}
  \printbibliography[heading={none}]
\end{publications}
```

---

## 🔖 Gestores de Referencias

### Zotero (Recomendado - Gratis)

**Ventajas:**
- ✅ Gratis y open source
- ✅ Extensión para navegadores (captura automática)
- ✅ Exporta a .bib perfectamente
- ✅ Organización con carpetas y etiquetas

**Instalación:**
1. Descarga: https://www.zotero.org/download/
2. Instala extensión Better BibTeX para mejores claves
3. Exporta colección: Click derecho → Export → Format: BibTeX

### Mendeley

**Ventajas:**
- ✅ Gratis (hasta cierto límite de almacenamiento)
- ✅ Lector PDF integrado
- ✅ Sincronización en la nube

**Uso:**
1. Organiza tus papers en Mendeley
2. File → Export → BibTeX (.bib)
3. Copia al archivo my_publications.bib

### JabRef (Especializado en .bib)

**Ventajas:**
- ✅ Gratis y open source
- ✅ Editor visual de archivos .bib
- ✅ Búsqueda de DOI, arXiv, etc.

**Instalación:**
- Descarga: https://www.jabref.org/

**Uso:**
1. Abre my_publications.bib con JabRef
2. Edita visualmente (campos, preview)
3. Guarda automáticamente en .bib

### Comparison Table

| Gestor   | Gratis | Cloud Sync | Editor .bib | Navegador | Recomendado para |
|----------|--------|------------|-------------|-----------|------------------|
| Zotero   | ✅      | ✅          | ⚠️          | ✅         | La mayoría       |
| Mendeley | Limitado| ✅          | ⚠️          | ✅         | Equipos          |
| JabRef   | ✅      | ❌          | ✅          | ❌         | Usuarios LaTeX   |

---

## 🎓 Consejos para Académicos

### 1. Mantén tu .bib actualizado

- Agrega publicaciones apenas sean aceptadas
- Usa gestores de referencias para no perder nada
- Backups regulares (Git es ideal)

### 2. Incluye información relevante

**Campos importantes:**
- `doi` o `url` - SIEMPRE cuando esté disponible
- `keywords` - Para filtrar por tema
- `note` - Información adicional valiosa:
  - "Revista indexada en Scopus"
  - "Q1 en Economics (JCR 2023)"
  - "Best Paper Award"
  - "Open Access"

### 3. Mantén consistencia en nombres

```bibtex
% Bien (consistente)
author = {Achalma Mendoza, Elmer Edison}
author = {Achalma Mendoza, Elmer Edison and García, Juan}

% Mal (inconsistente)
author = {E.E. Achalma}
author = {Edison Achalma Mendoza}
```

### 4. Organiza por áreas si tienes muchas publicaciones

Usa keywords estratégicamente:

```bibtex
keywords = {economia-desarrollo, peer-reviewed, q1}
```

### 5. Destaca publicaciones importantes

Usa el campo `note` para destacar:

```bibtex
note = {Artículo más citado de la revista - 150+ citaciones (Google Scholar)}
```

### 6. ORCID

Asegúrate de tener todas tus publicaciones en tu perfil ORCID:
- https://orcid.org/
- Sincroniza con Scopus, Web of Science
- Agrega el ORCID en tu CV

### 7. Para perfiles académicos

Si tienes muchas publicaciones (10+), considera:
- CV separado para investigación vs aplicaciones
- Listar solo publicaciones revisadas por pares en CV corto
- Mantener lista completa en sitio web personal

---

## 🐛 Troubleshooting

### Problema: "File my_publications.bib not found"

**Solución:**
```latex
% En cv.tex, verifica la ruta correcta
\addbibresource{my_publications.bib}  % Mismo directorio
% o
\addbibresource{bib/my_publications.bib}  % En subcarpeta
```

### Problema: "Empty bibliography"

**Causas posibles:**
1. No ejecutaste `biber cv`
2. El .bib está vacío o mal formado
3. No tienes `\nocite{*}` o `\printbibliography`

**Solución:**
```bash
# Limpiar y recompilar desde cero
rm *.aux *.bbl *.bcf *.blg *.run.xml
lualatex cv.tex
biber cv
lualatex cv.tex
lualatex cv.tex
```

### Problema: "Undefined control sequence"

**Causa:** Error de sintaxis en el .bib

**Solución:**
- Abre el .bib en JabRef o Zotero para validar
- Busca caracteres especiales sin escapar
- Verifica que todas las llaves `{}` estén balanceadas

### Problema: Nombres de autores mal formateados

**Causa:** Formato incorrecto en el campo `author`

**Correcto:**
```bibtex
author = {Apellido, Nombre}  % Un autor
author = {Apellido1, Nombre1 and Apellido2, Nombre2}  % Múltiples autores
```

**Incorrecto:**
```bibtex
author = {Nombre Apellido}
author = {Apellido1, Nombre1, Apellido2, Nombre2}  % Usa 'and', no comas
```

### Problema: Caracteres especiales (tildes, ñ)

**Solución:** Usa LuaLaTeX (ya lo estás usando) o:

```bibtex
% Opción 1: Escribir directamente (LuaLaTeX lo soporta)
title = {Análisis económico}

% Opción 2: Comandos LaTeX
title = {An{\'a}lisis econ{\'o}mico}
```

---

## 📊 Ejemplo Completo

### Archivo my_publications.bib

```bibtex
@article{achalma2024,
  author  = {Achalma Mendoza, Elmer Edison},
  title   = {Determinantes de la Informalidad Laboral en Ayacucho},
  journal = {Revista Peruana de Economía Regional},
  year    = {2024},
  volume  = {15},
  number  = {2},
  pages   = {45--67},
  doi     = {10.1234/rper.2024.001},
  keywords = {economia-desarrollo, econometria, peer-reviewed}
}
```

### Archivo 11_publicaciones.tex

```latex
\sectionTitle{Publicaciones}{\faBook}
\begin{publications}
  \nocite{*}
  \printbibliography[heading=subbibliography,title={Artículos de Revistas},type=article]
\end{publications}
```

### Archivo cv.tex (preámbulo)

```latex
\addbibresource{my_publications.bib}
```

### Compilación

```bash
lualatex cv.tex
biber cv
lualatex cv.tex
lualatex cv.tex
```

---

## 🔗 Recursos Adicionales

### Tutoriales
- [BibLaTeX Documentation](https://ctan.org/pkg/biblatex)
- [JabRef Tutorial](https://docs.jabref.org/)
- [Zotero Getting Started](https://www.zotero.org/support/quick_start_guide)

### Herramientas Online
- [doi2bib.org](https://www.doi2bib.org/) - Generar .bib desde DOI
- [BibTeX Tidy](https://flamingtempura.github.io/bibtex-tidy/) - Limpiar y formatear .bib
- [Citation Machine](https://www.citationmachine.net/) - Generar citas

### Bases de Datos Académicas
- [Google Scholar](https://scholar.google.com/)
- [Scopus](https://www.scopus.com/)
- [Web of Science](https://www.webofscience.com/)
- [SSRN](https://www.ssrn.com/) - Preprints en ciencias sociales
- [arXiv](https://arxiv.org/) - Preprints en economía, matemáticas

---

## ✅ Checklist para Publicaciones

- [ ] Tengo `my_publications.bib` en la carpeta del CV
- [ ] `\addbibresource{my_publications.bib}` está descomentado en cv.tex
- [ ] Cada publicación tiene una clave única
- [ ] Nombres de autores en formato correcto: `Apellido, Nombre`
- [ ] Incluí DOI o URL cuando esté disponible
- [ ] Agregué keywords para filtrar por tema
- [ ] Compilé con el workflow completo (lualatex → biber → lualatex → lualatex)
- [ ] Verifiqué que las publicaciones aparezcan correctamente en el PDF

---

**¡Éxito con tus publicaciones! 📚🎓**

Si tienes dudas, consulta la documentación oficial de BibLaTeX o pregunta en:
- [TeX StackExchange](https://tex.stackexchange.com/)
- [LaTeX Community](https://latex.org/forum/)

---

*Última actualización: Enero 2026*  
*Autor: Edison Achalma*
