# 🎯 Guía Práctica de Uso - Sistema Modular de CV

## 📖 ¿Qué es esto?

Es tu arsenal completo de CVs personalizados. En lugar de tener 10 archivos de Word diferentes, tienes UN sistema organizado donde:

- ✅ **Toda tu historia está en un solo lugar**
- ✅ **Comentas/descoméntas según el puesto**
- ✅ **Generas CVs profesionales en minutos**
- ✅ **Nunca pierdes información**

## 🚀 Casos de Uso Reales

### Caso 1: Postulación a Universidad (Docente)

**Paso a paso:**

1. **Copia archivos base:**
```bash
cp 1_declaracion_docencia.tex ../1_declaracion_cv.tex
cp 2_competencias_docencia.tex ../2_competencias.tex
cp 3_experiencias_docencia.tex ../3_experiencias_corta.tex
```

2. **En `1_declaracion_cv.tex`:** Usa la versión principal (ya está descomentada)

3. **En `3_experiencias_corta.tex`:** 
   - ✅ Deja activas las experiencias docentes
   - ❌ Comenta experiencias muy técnicas si las hay

4. **En `9_certificados_completo.tex`:**
   - ✅ Activa: Diplomado en Docencia, cursos de metodología
   - ❌ Comenta: Certificaciones muy técnicas de programación

**Resultado:** CV enfocado en docencia e investigación.

---

### Caso 2: Postulación a Startup Tech (Data Analyst)

**Paso a paso:**

1. **Copia archivos base:**
```bash
cp 1_declaracion_data_science.tex ../1_declaracion_cv.tex
cp 2_competencias_data_science.tex ../2_competencias.tex
cp 3_experiencias_data_science.tex ../3_experiencias_corta.tex
```

2. **En `1_declaracion_cv.tex`:**
   - Si es puesto junior: descomentar versión "Data Analyst entry-level"
   - Si es puesto mid-level: dejar versión principal

3. **En `3_experiencias_corta.tex`:**
   - ✅ Activa proyectos personales de GitHub
   - ✅ Activa experiencias con análisis de datos
   - ❌ Comenta experiencias de docencia (salvo que sean relevantes)

4. **En `7_proyectos.tex`:**
   - ✅ Activa: Dashboard, web scraper, análisis con Python/R
   - ❌ Comenta: Proyectos académicos no técnicos

**Resultado:** CV técnico enfocado en datos.

---

### Caso 3: Postulación a Ministerio (Analista Económico)

**Paso a paso:**

1. **Copia archivos base:**
```bash
cp 1_declaracion_sector_publico.tex ../1_declaracion_cv.tex
cp 2_competencias_economia.tex ../2_competencias.tex  # Mezcla!
cp 3_experiencias_corta.tex ../3_experiencias_corta.tex  # Personalizar
```

2. **En `1_declaracion_cv.tex`:**
   - Usar versión con enfoque en servicio público

3. **En `3_experiencias_corta.tex`:**
   - ✅ Si tienes experiencia en sector público: activarla
   - ✅ Enfatizar análisis económico, políticas públicas
   - ❌ Minimizar experiencias del sector privado

4. **En `9_certificados.tex`:**
   - ✅ Activar: SIAF, SIGA, SEACE, gestión pública
   - ✅ Mantener: Cursos económicos relevantes

**Resultado:** CV de economista para sector público.

---

### Caso 4: Postulación a Consultora (Consultor Junior)

**Paso a paso:**

1. **Archivos base:**
```bash
cp 1_declaracion_consultoria.tex ../1_declaracion_cv.tex
```

2. **Competencias:**
   - Combina: herramientas de economía + algo de data science
   - Enfatiza: versatilidad, Excel, comunicación

3. **Experiencias:**
   - ✅ Muestra diversidad: docencia + análisis + proyectos
   - ✅ Enfatiza adaptabilidad y trabajo bajo presión

4. **Proyectos:**
   - ✅ Estudios de factibilidad
   - ✅ Evaluaciones de impacto
   - ✅ Proyectos con múltiples stakeholders

**Resultado:** CV versátil para consultoría.

---

## 🛠️ Comandos Útiles

### Generar CV rápido para una posición

```bash
# 1. Ir a tu carpeta de CVs
cd ~/cv-sistema/

# 2. Copiar archivos para área específica
cp cv_versions/1_declaracion_[AREA].tex 1_declaracion_cv.tex
cp cv_versions/2_competencias_[AREA].tex 2_competencias.tex
cp cv_versions/3_experiencias_[AREA].tex 3_experiencias_corta.tex

# 3. Compilar
lualatex cv.tex

# 4. Ver resultado
xdg-open cv.pdf  # Linux
open cv.pdf      # Mac
```

### Búsqueda rápida de bloques

```bash
# Buscar todas las experiencias disponibles
grep -n "\\experience" cv_versions/3_*.tex

# Buscar proyectos específicos
grep -n "Dashboard\|Machine Learning\|Web" cv_versions/7_proyectos_completo.tex
```

## 📝 Tips para Personalización Rápida

### 1. Usa búsqueda de palabras clave

Cuando leas la descripción del puesto, identifica 5-7 palabras clave y busca en tus archivos:

```bash
grep -i "machine learning\|python\|sql" cv_versions/*.tex
```

### 2. Matriz de relevancia

Para cada postulación, haz una tabla mental:

| Elemento | ¿Relevante? | Acción |
|----------|-------------|---------|
| Experiencia docente | ✅ Alta | Descomentar, ponerla primera |
| Experiencia Python | ⚠️ Media | Descomentar si hay espacio |
| Proyecto chatbot | ❌ Baja | Dejar comentado |

### 3. Regla 70-20-10

- **70%** - Contenido directamente relevante al puesto
- **20%** - Contenido que muestra versatilidad
- **10%** - Contenido "extra" que te diferencia

### 4. Coherencia narrativa

Todo tu CV debe contar UNA historia:

**❌ Mal ejemplo:**
```
Declaración: "Apasionado por data science..."
Experiencia #1: Docente de metodología
Experiencia #2: Asistente administrativo
```

**✅ Buen ejemplo:**
```
Declaración: "Economista con enfoque en análisis de datos..."
Experiencia #1: Analista de datos
Experiencia #2: Docente con componente cuantitativo
Experiencia #3: Proyecto de dashboard económico
```

## ⚙️ Flujo de Trabajo Recomendado

### Para cada nueva postulación:

```
1. [ ] Leer descripción del puesto (5 min)
2. [ ] Identificar área principal (1 min)
3. [ ] Copiar archivos base (1 min)
4. [ ] Personalizar declaración (5 min)
5. [ ] Activar experiencias relevantes (5 min)
6. [ ] Activar proyectos relevantes (3 min)
7. [ ] Revisar certificados (2 min)
8. [ ] Compilar y revisar PDF (3 min)
9. [ ] Ajustar si es necesario (5 min)
10. [ ] ¡Enviar! 

Total: ~30 minutos por postulación
```

## 🎨 Ejemplos de Personalización Fina

### Ejemplo 1: Cambiar énfasis de declaración

**Original:**
> Economista con sólida formación en análisis macroeconómico...

**Para startup:**
> Economista con fuerte orientación hacia la ciencia de datos...

**Para banco:**
> Economista con sólida formación en finanzas y análisis cuantitativo...

### Ejemplo 2: Reordenar experiencias

**Para docencia (más relevante primero):**
```latex
\experience{...}{Docente Metodología}...
\experience{...}{Docente Gestión Proyectos}...
\experience{...}{Analista de datos}...  % Menos prioridad
```

**Para data science:**
```latex
\experience{...}{Analista de datos}...
\experience{...}{Proyectos personales GitHub}...
\experience{...}{Docente}...  % Menos prioridad pero muestra comunicación
```

## 🔧 Solución de Problemas Comunes

### Problema 1: "Mi CV tiene 3 páginas"

**Solución:**
- Comenta experiencias menos relevantes
- Reduce bullets de 5 a 3 por experiencia
- Comenta proyectos antiguos
- Meta: Máximo 2 páginas

### Problema 2: "No tengo experiencia en X área"

**Solución:**
- Enfatiza habilidades transferibles
- Usa proyectos académicos
- Menciona cursos relevantes
- Destaca capacidad de aprendizaje rápido

### Problema 3: "El formato se ve raro"

**Solución:**
```bash
# Verificar que todos los bloques estén bien cerrados
grep -n "\\begin{" 3_experiencias_corta.tex
grep -n "\\end{" 3_experiencias_corta.tex
# Deben tener mismo número de resultados
```

## 📊 Métricas de Éxito

Después de cada postulación, registra:

| Puesto | Área usada | Ajustes principales | ¿Respuesta? |
|--------|------------|---------------------|-------------|
| Data Analyst - Startup | Data Science | +Proyectos GitHub | ✅ Sí |
| Docente - Universidad | Docencia | +Certificados pedagógicos | ✅ Sí |
| Analista - Ministerio | Sector Público | +SIAF/SIGA | ❌ No |

Esto te ayuda a:
- Identificar qué versiones funcionan mejor
- Ajustar contenido con el tiempo
- Entender qué valoran diferentes empleadores

## 🎓 Filosofía Final

> "No es tener 100 versiones de CV.  
> Es tener UN sistema que genera el CV perfecto para CADA oportunidad."

Este sistema te permite:
- ✅ Mantener toda tu historia profesional
- ✅ Adaptarte rápidamente a cada puesto
- ✅ No perder información valiosa
- ✅ Mejorar continuamente tu presentación

---

**¿Preguntas?** Revisa el README.md principal o contacta a Edison en:
- Email: elmer.achalma.09@unsch.edu.pe
- LinkedIn: linkedin.com/in/achalmaedison

**¡Éxito en tus postulaciones! 🚀**
