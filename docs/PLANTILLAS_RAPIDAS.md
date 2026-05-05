# 🚀 Plantillas de Generación Rápida

## Scripts de Bash para Generar CVs

### Para Linux/Mac

Guarda estos scripts en `cv_versions/scripts/`

#### `generar_cv_docencia.sh`
```bash
#!/bin/bash
# Script para generar CV enfocado en Docencia

echo "🎓 Generando CV para Docencia..."

cd ..
cp cv_versions/1_declaracion_docencia.tex 1_declaracion_cv.tex
cp cv_versions/2_competencias_docencia.tex 2_competencias.tex
cp cv_versions/3_experiencias_docencia.tex 3_experiencias_corta.tex
cp cv_versions/7_proyectos_completo.tex 7_proyectos.tex
cp cv_versions/9_certificados_completo.tex 9_certificados.tex

echo "✅ Archivos copiados"
echo "📝 Compiling..."

lualatex cv.tex
lualatex cv.tex  # Segunda pasada para referencias

echo "✅ CV generado: cv.pdf"
xdg-open cv.pdf  # Abre el PDF (Linux)
# open cv.pdf  # Descomentar para Mac
```

#### `generar_cv_data_science.sh`
```bash
#!/bin/bash
echo "📊 Generando CV para Data Science..."

cd ..
cp cv_versions/1_declaracion_data_science.tex 1_declaracion_cv.tex
cp cv_versions/2_competencias_data_science.tex 2_competencias.tex
cp cv_versions/3_experiencias_data_science.tex 3_experiencias_corta.tex

lualatex cv.tex
lualatex cv.tex

echo "✅ CV generado: cv.pdf"
xdg-open cv.pdf
```

#### `generar_cv_economia.sh`
```bash
#!/bin/bash
echo "💼 Generando CV para Economía..."

cd ..
cp cv_versions/1_declaracion_economia.tex 1_declaracion_cv.tex
cp cv_versions/2_competencias_economia.tex 2_competencias.tex

lualatex cv.tex
lualatex cv.tex

echo "✅ CV generado: cv.pdf"
```

---

## Comandos One-Liner

Para copiar rápido sin scripts:

```bash
# Docencia
cp cv_versions/{1_declaracion_docencia.tex,2_competencias_docencia.tex,3_experiencias_docencia.tex} . && lualatex cv.tex

# Data Science
cp cv_versions/{1_declaracion_data_science.tex,2_competencias_data_science.tex,3_experiencias_data_science.tex} . && lualatex cv.tex

# Economía
cp cv_versions/{1_declaracion_economia.tex,2_competencias_economia.tex} . && lualatex cv.tex
```

---

## Checklist Pre-Envío

Antes de enviar cada CV, verifica:

```
[ ] Declaración personalizada para el área
[ ] Máximo 3-5 experiencias más relevantes activas
[ ] Proyectos filtrados (solo relevantes)
[ ] Certificados actualizados y relevantes
[ ] Sin errores de compilación LaTeX
[ ] PDF generado correctamente
[ ] Nombre de archivo descriptivo: CV_Edison_Achalma_[EMPRESA]_[PUESTO].pdf
[ ] Tamaño del CV: 1-2 páginas máximo
[ ] Revisión ortográfica final
[ ] Info de contacto actualizada
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

### Configuración Inicial

```bash
cd ~/Documents/cv-sistema/
git init
git add .
git commit -m "Initial CV system setup"
```

### Workflow para cada postulación

```bash
# Crear rama para postulación específica
git checkout -b postulacion-empresa-puesto-fecha

# Hacer cambios específicos
# ... editar archivos ...

# Commit de cambios
git add .
git commit -m "CV personalizado para [Empresa] - [Puesto]"

# Volver a master para siguiente postulación
git checkout master

# Ver historial
git log --oneline --graph --all
```

### Recuperar versión antigua

```bash
# Ver commits anteriores
git log --oneline

# Ver cambios de un commit específico
git show [COMMIT_HASH]

# Recuperar archivo de versión anterior
git checkout [COMMIT_HASH] -- 1_declaracion_cv.tex
```

---

## Automatización con Makefile

Crea un `Makefile` en tu directorio principal:

```makefile
.PHONY: docencia datascience economia publico finanzas consultoria clean

docencia:
	cp cv_versions/1_declaracion_docencia.tex 1_declaracion_cv.tex
	cp cv_versions/2_competencias_docencia.tex 2_competencias.tex
	cp cv_versions/3_experiencias_docencia.tex 3_experiencias_corta.tex
	lualatex cv.tex
	@echo "✅ CV Docencia generado"

datascience:
	cp cv_versions/1_declaracion_data_science.tex 1_declaracion_cv.tex
	cp cv_versions/2_competencias_data_science.tex 2_competencias.tex
	cp cv_versions/3_experiencias_data_science.tex 3_experiencias_corta.tex
	lualatex cv.tex
	@echo "✅ CV Data Science generado"

economia:
	cp cv_versions/1_declaracion_economia.tex 1_declaracion_cv.tex
	cp cv_versions/2_competencias_economia.tex 2_competencias.tex
	lualatex cv.tex
	@echo "✅ CV Economía generado"

clean:
	rm -f *.aux *.log *.out *.toc *.bbl *.blg
	@echo "✅ Archivos temporales eliminados"
```

Uso:
```bash
make docencia      # Genera CV para docencia
make datascience   # Genera CV para data science
make clean         # Limpia archivos temporales
```

---

## Tips de Productividad

### 1. Snippets para VS Code

Crea `.vscode/latex.code-snippets`:

```json
{
  "Nueva Experiencia": {
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
      "\\emptySeparator",
      ""
    ]
  }
}
```

### 2. Alias de Bash

Agrega a tu `~/.bashrc` o `~/.zshrc`:

```bash
alias cv-docencia='cd ~/Documents/cv-sistema && make docencia'
alias cv-data='cd ~/Documents/cv-sistema && make datascience'
alias cv-clean='cd ~/Documents/cv-sistema && make clean'
alias cv-view='xdg-open ~/Documents/cv-sistema/cv.pdf'
```

### 3. Watchdog para Compilación Automática

```bash
# Instalar watchdog
pip install watchdog

# Script watch_cv.py
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
import subprocess
import time

class CVCompiler(FileSystemEventHandler):
    def on_modified(self, event):
        if event.src_path.endswith('.tex'):
            print(f"Compilando {event.src_path}...")
            subprocess.run(['lualatex', 'cv.tex'])

observer = Observer()
observer.schedule(CVCompiler(), path='.', recursive=False)
observer.start()
print("Watching for changes...")
try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    observer.stop()
observer.join()
```

---

**Última actualización:** Enero 2026  
**Autor:** Edison Achalma  
**Contribuciones bienvenidas!**
