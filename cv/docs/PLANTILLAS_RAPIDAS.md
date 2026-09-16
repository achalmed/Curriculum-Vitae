---
tipo: doc
titulo: "🚀 Plantillas de Generación Rápida"
estado: activo
---
# 🚀 Plantillas de Generación Rápida

## Generación de CVs con el Makefile

El repositorio incluye un `Makefile` real en la raíz — ya no hay que copiar
archivos ni mantener scripts auxiliares:

```bash
make sector-publico      # → build/cv-sector-publico.pdf (perfil por defecto)
make docencia            # → build/cv-docencia.pdf
make data-science        # → build/cv-data-science.pdf
make sector-financiero   # → build/cv-sector-financiero.pdf
make economia            # → build/cv-economia.pdf (trayectoria completa)
make consultoria         # → build/cv-consultoria.pdf
make all                 # los 6 perfiles de una vez
make economia BIBER=1    # con bibliografía (sección publicaciones activa)
make clean               # eliminar build/
```

### One-liners útiles

```bash
# Compilar y abrir
make docencia && xdg-open build/cv-docencia.pdf

# Copia con nombre de envío
make docencia && cp build/cv-docencia.pdf ~/CV_Edison_Achalma_EMPRESA_PUESTO.pdf
```

### Publicar una versión (GitHub Releases)

Cada tag `v*` dispara la compilación en GitHub Actions y publica los 6 PDFs
como Release — sin subir PDFs al repositorio:

```bash
git tag v3.1.1
git push origin v3.1.1
# → https://github.com/achalmed/Curriculum-Vitae/releases
```

---

## Checklist Pre-Envío

Antes de enviar cada CV, verifica:

```
[ ] Declaración personalizada para el área
[ ] Máximo 3-5 experiencias más relevantes activas en el selector
[ ] Proyectos filtrados (solo relevantes)
[ ] Certificados actualizados y relevantes
[ ] Sin errores de compilación LaTeX
[ ] PDF generado correctamente
[ ] Nombre de archivo descriptivo: CV_Edison_Achalma_[EMPRESA]_[PUESTO].pdf
[ ] Tamaño del CV: 1-2 páginas máximo (sin contar anexos)
[ ] Revisión ortográfica final
[ ] Info de contacto actualizada (main/config/personal.tex)
```

---

## Plantillas de Emails de Postulación

### Para Docencia

```
Asunto: Postulación Docente [Materia] - Edison Achalma

Estimados,

Me dirijo a ustedes para expresar mi interés en la posición de docente de [MATERIA]
publicada en [FUENTE].

Como economista con experiencia en docencia universitaria y especialización en 
metodología de investigación, considero que puedo aportar significativamente a la 
formación de estudiantes en [ÁREA].

Mi experiencia incluye [X años] de docencia en [MATERIAS], tutoría de tesis y 
desarrollo de material didáctico. Adjunto mi CV para su consideración.

Quedo atento a sus comentarios.

Saludos cordiales,
Edison Achalma
[Teléfono] | [Email]
```

### Para Data Science

```
Asunto: Data Analyst Position - Edison Achalma

Dear Hiring Manager,

I am writing to express my strong interest in the Data Analyst position at [COMPANY].

As an economist with a focus on data science and quantitative analysis, I bring 
expertise in R, Python, SQL, and data visualization. My recent projects include 
[PROYECTO RELEVANTE] where I [LOGRO CUANTIFICABLE].

I am particularly drawn to [COMPANY] because [RAZÓN ESPECÍFICA RELACIONADA AL 
PRODUCTO/CULTURA].

Attached you will find my resume. I look forward to discussing how my analytical 
skills can contribute to your team.

Best regards,
Edison Achalma
```

### Para Sector Público

```
Asunto: Postulación [CAS N°XXX] - Economista

Estimados señores de [ENTIDAD],

Por medio de la presente, expreso mi interés en postular al proceso de selección 
CAS N°[XXX] para el cargo de [PUESTO].

Cuento con formación en economía y experiencia en [ÁREA ESPECÍFICA DEL TDR], lo 
cual me permite cumplir con los requisitos establecidos. Estoy comprometido con el 
servicio público y la mejora de procesos institucionales.

Adjunto documentación requerida según bases.

Atentamente,
Elmer Edison Achalma Mendoza
DNI: [TU DNI]
```

---

## Gestión de Versiones con Git

### Workflow para una postulación con ajustes específicos

```bash
# Crear rama para la postulación
git checkout -b postulacion-empresa-puesto-fecha

# Ajustar selectores/declaración, compilar y verificar
make docencia

# Commit de cambios
git add . && git commit -m "CV personalizado para [Empresa] - [Puesto]"

# Volver a master para la siguiente postulación
git checkout master
```

### Recuperar una versión antigua

```bash
git log --oneline                          # ver commits anteriores
git show [COMMIT_HASH]                     # ver cambios de un commit
git checkout [HASH] -- main/sections/...   # recuperar un archivo puntual
```

---

## Tips de Productividad

### 1. Snippet para VS Code (nueva entrada de experiencia)

Crea `.vscode/latex.code-snippets`:

```json
{
  "Nueva Entrada de Experiencia": {
    "prefix": "exp",
    "body": [
      "\\experience",
      "{${1:Fecha Fin}} {${2:Cargo}}{${3:Institución}}{${4:Ciudad}}",
      "{${5:Fecha Inicio}} {",
      "\t${6:Descripción breve}",
      "\t\\begin{itemize}",
      "\t\t\\item ${7:Logro 1}",
      "\t\t\\item ${8:Logro 2}",
      "\t\\end{itemize}",
      "}",
      "{\\footnotesize{\\emph{${9:Tecnologías:}} ${10:Lista}}}",
      ""
    ]
  }
}
```

Guarda la entrada como archivo propio en
`main/sections/experiencias/entradas/<fecha>_<empleo>.tex` y refiérela con
`\entradaExperiencia{<fecha>_<empleo>}` desde los selectores de área.

### 2. Alias de Bash

Agrega a tu `~/.bashrc` o `~/.zshrc`:

```bash
alias cv='cd ~/Documents/git_cv'
alias cv-docencia='cd ~/Documents/git_cv && make docencia'
alias cv-all='cd ~/Documents/git_cv && make all'
alias cv-view='xdg-open ~/Documents/git_cv/build/*.pdf'
```

### 3. Modo watch (recompilación automática)

Con el script universal local:

```bash
cd main && /home/achalmaedison/Documents/scripts_for_latex/script_compilar_latex/compilar_latex.sh -e lualatex -w index
```

---

**Última actualización:** Julio 2026
**Autor:** Edison Achalma
**Contribuciones bienvenidas!**
