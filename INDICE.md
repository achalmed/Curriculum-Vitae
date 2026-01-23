# 📚 Índice General del Sistema Modular de CV

## 🎯 Visión General

Este es tu sistema completo para generar CVs personalizados para cualquier área profesional. Todo está organizado, documentado y listo para usar.

---

## 📂 Estructura de Archivos

```
cv_versions/
│
├── 📄 README.md                          ← Documentación principal
├── 📄 GUIA_PRACTICA.md                   ← Guía con ejemplos de uso paso a paso
├── 📄 PLANTILLAS_RAPIDAS.md              ← Scripts y automatización
├── 📄 INDICE.md                          ← Este archivo
│
├── 🎓 ÁREA: DOCENCIA E INVESTIGACIÓN
│   ├── 1_declaracion_docencia.tex        (5 versiones alternativas)
│   ├── 2_competencias_docencia.tex       (3 versiones alternativas)
│   └── 3_experiencias_docencia.tex       (7 experiencias, algunas comentadas)
│
├── 📊 ÁREA: DATA SCIENCE / ANÁLISIS DE DATOS
│   ├── 1_declaracion_data_science.tex    (5 versiones alternativas)
│   ├── 2_competencias_data_science.tex   (5 versiones alternativas)
│   └── 3_experiencias_data_science.tex   (7 experiencias, algunas comentadas)
│
├── 💼 ÁREA: ECONOMÍA / ANÁLISIS ECONÓMICO
│   ├── 1_declaracion_economia.tex        (5 versiones alternativas)
│   └── 2_competencias_economia.tex       (3 versiones alternativas)
│
├── 🏛️ ÁREA: SECTOR PÚBLICO
│   ├── 1_declaracion_sector_publico.tex  (6 versiones alternativas)
│   └── 2_competencias_sector_publico.tex (3 versiones alternativas)
│
├── 💰 ÁREA: SECTOR FINANCIERO
│   ├── 1_declaracion_sector_financiero.tex  (6 versiones alternativas)
│   └── 2_competencias_sector_financiero.tex (5 versiones alternativas)
│
├── 🔍 ÁREA: CONSULTORÍA / PROYECTOS
│   └── 1_declaracion_consultoria.tex     (6 versiones alternativas)
│
└── 📦 RECURSOS COMPARTIDOS
    ├── 7_proyectos_completo.tex          (15+ proyectos, mayormente comentados)
    └── 9_certificados_completo.tex       (30+ certificaciones organizadas por área)
```

---

## 🚀 Quick Start - 3 Pasos

### 1️⃣ Identifica tu área
- Docencia → 🎓
- Data Science → 📊  
- Economía → 💼
- Sector Público → 🏛️
- Finanzas → 💰
- Consultoría → 🔍

### 2️⃣ Copia archivos base
```bash
# Ejemplo para Data Science
cp cv_versions/1_declaracion_data_science.tex 1_declaracion_cv.tex
cp cv_versions/2_competencias_data_science.tex 2_competencias.tex
cp cv_versions/3_experiencias_data_science.tex 3_experiencias_corta.tex
```

### 3️⃣ Compila y personaliza
```bash
lualatex cv.tex
# Abre el PDF, revisa, ajusta y recompila si es necesario
```

---

## 📖 Guías de Lectura Recomendadas

### Para Nuevos Usuarios
1. **README.md** (5 min) - Entiende el sistema
2. **GUIA_PRACTICA.md** (15 min) - Ve casos reales
3. Genera tu primer CV para un área (30 min)

### Para Usuarios Avanzados
1. **PLANTILLAS_RAPIDAS.md** - Automatización con scripts
2. Configura Git para versiones
3. Crea tus propios alias y atajos

---

## 📊 Contenido por Archivo

### Declaraciones (1_declaracion_*.tex)

Cada archivo contiene:
- **Versión principal** (activa por defecto)
- **4-5 versiones alternativas** (comentadas) para sub-especialidades

| Área | Versiones Disponibles |
|------|----------------------|
| Docencia | General, Investigación, Educación Superior, Coordinación, Tutorías |
| Data Science | General, Business Intelligence, Entry-level, Data Engineer, Research |
| Economía | General, Investigación, Coyuntura, Planificación, Sectorial |
| Sector Público | General, Políticas Públicas, Regional, Información, Social, Modernización |
| Finanzas | General, Risk Management, Banca, Finanzas Corporativas, Microfinanzas, Entry |
| Consultoría | General, Desarrollo, Project Management, Estratégica, Evaluación, Sostenibilidad |

### Competencias (2_competencias_*.tex)

Stack técnico personalizado por área:
- **Lenguajes/Software** más relevantes en negrita
- **Versiones alternativas** para diferentes niveles (junior, mid, senior)
- **Énfasis flexible** (más técnico vs más aplicado)

### Experiencias (3_experiencias_*.tex)

- **Formato consistente** con bullets de logros
- **Experiencias comentadas** que puedes activar según relevancia
- **Experiencias adicionales** en comentarios para situaciones específicas

### Proyectos (7_proyectos_completo.tex)

Organizado por categorías:
- 📊 Data Science / Análisis
- 🔬 Investigación
- 🌐 Web / Desarrollo
- 💼 Economía Aplicada
- 🎓 Académicos / Educativos
- 💡 Consultoría / Profesionales

**Total:** ~15 proyectos, mayoría comentados para activar según necesidad

### Certificados (9_certificados_completo.tex)

Organizado por áreas:
- Siempre activos (relevantes para todos)
- Data Science (Python, R, ML, SQL)
- Docencia (pedagogía, metodología)
- Economía/Finanzas (econometría, finanzas)
- Sector Público (SIAF, SIGA, gestión pública)
- Consultoría (PM, evaluación)
- Técnicas generales (Git, Power BI)
- Eventos y conferencias

**Total:** ~30 certificaciones organizadas

---

## 🎯 Casos de Uso por Área

### 🎓 Docencia e Investigación
**Ideal para:**
- Docente universitario
- Investigador
- Tutor de tesis
- Coordinador académico

**Archivos clave:**
- `1_declaracion_docencia.tex`
- `2_competencias_docencia.tex`
- `3_experiencias_docencia.tex`

**Enfatiza:**
- Metodología de investigación
- Publicaciones (si las tienes)
- Cursos dictados
- Tesis dirigidas

---

### 📊 Data Science / Análisis de Datos
**Ideal para:**
- Data Analyst
- Data Scientist
- Business Intelligence Analyst
- Data Engineer

**Archivos clave:**
- `1_declaracion_data_science.tex`
- `2_competencias_data_science.tex`
- `3_experiencias_data_science.tex`
- `7_proyectos_completo.tex` (proyectos técnicos)

**Enfatiza:**
- GitHub con proyectos
- Stack técnico (Python, R, SQL)
- Dashboards y visualizaciones
- Machine Learning si aplica

---

### 💼 Economía / Análisis Económico
**Ideal para:**
- Economista de estudios
- Analista de coyuntura
- Investigador económico
- Analista sectorial

**Archivos clave:**
- `1_declaracion_economia.tex`
- `2_competencias_economia.tex`

**Enfatiza:**
- Econometría aplicada
- Análisis de indicadores
- Software: Stata, EViews
- Estudios e informes técnicos

---

### 🏛️ Sector Público
**Ideal para:**
- Analista en ministerios/gobiernos regionales
- Especialista en políticas públicas
- Profesional de planificación
- Técnico en sistemas gubernamentales

**Archivos clave:**
- `1_declaracion_sector_publico.tex`
- `2_competencias_sector_publico.tex`
- `9_certificados_completo.tex` (certificaciones SIAF, SIGA)

**Enfatiza:**
- Compromiso con servicio público
- Conocimiento de sistemas estatales
- Normativa del sector público
- Orientación a resultados

---

### 💰 Sector Financiero
**Ideal para:**
- Analista de riesgos
- Evaluador de créditos
- Analista financiero
- Especialista en productos

**Archivos clave:**
- `1_declaracion_sector_financiero.tex`
- `2_competencias_sector_financiero.tex`

**Enfatiza:**
- Análisis cuantitativo
- Conocimiento de regulación (SBS, Basilea)
- Evaluación crediticia
- Excel financiero avanzado

---

### 🔍 Consultoría / Proyectos
**Ideal para:**
- Consultor económico
- Project Manager
- Especialista en evaluación
- Analista de desarrollo

**Archivos clave:**
- `1_declaracion_consultoria.tex`

**Enfatiza:**
- Versatilidad
- Experiencia en proyectos diversos
- Capacidad de adaptación
- Orientación a resultados

---

## 🔄 Flujo de Trabajo Típico

```
1. Nueva oportunidad laboral aparece
   ↓
2. Leo descripción → Identifico área principal
   ↓
3. Copio archivos del área correspondiente
   ↓
4. Personalizo declaración (5 min)
   ↓
5. Activo/comento experiencias relevantes (10 min)
   ↓
6. Activo/comento proyectos relevantes (5 min)
   ↓
7. Reviso certificados (3 min)
   ↓
8. Compilo y reviso PDF (5 min)
   ↓
9. Ajusto detalles (5 min)
   ↓
10. Guardo versión: CV_Edison_[EMPRESA]_[FECHA].pdf
   ↓
11. ¡ENVÍO!

Tiempo total: ~30-40 minutos por postulación
```

---

## 💡 Tips Pro

### ✅ Buenas Prácticas
1. **Una historia coherente:** Todo el CV debe contar la misma narrativa
2. **Máximo 2 páginas:** Sé selectivo con lo que activas
3. **Métricas cuando sea posible:** "Incrementé X en 30%" > "Mejoré X"
4. **Palabras clave del anuncio:** Úsalas en tu declaración
5. **Actualiza centralmente:** Cuando agregues experiencia nueva, agrégala a TODOS los archivos relevantes

### ❌ Evita
1. **Mezclar áreas sin coherencia:** No uses declaración de docencia con experiencias solo técnicas
2. **Sobrecargar información:** Más no siempre es mejor
3. **Olvidar compilar dos veces:** LaTeX necesita dos pasadas para referencias
4. **CV genérico:** Siempre personaliza aunque sea mínimamente
5. **Mentir o exagerar:** Sé honesto con tu nivel de habilidades

---

## 🆘 Solución de Problemas

### Problema: No compila LaTeX
**Solución:**
```bash
# Verifica errores en el log
cat cv.log | grep -i error

# Verifica que todos los \begin tengan su \end
grep "\\begin{" *.tex | wc -l
grep "\\end{" *.tex | wc -l
# Deberían dar el mismo número
```

### Problema: CV muy largo (3+ páginas)
**Solución:**
- Comenta experiencias antiguas o menos relevantes
- Reduce bullets de 5 a 3 por experiencia
- Comenta proyectos de hace 4+ años
- Usa formato más compacto en listas

### Problema: ¿Qué versión de declaración usar?
**Solución:**
Lee el anuncio y detecta:
- Palabras clave más frecuentes
- Responsabilidades principales
- Habilidades requeridas vs deseables
- Cultura de la empresa (LinkedIn)
→ Elige la versión que mejor calce con eso

---

## 📈 Métricas de Éxito

Lleva registro de tus postulaciones:

```
| Fecha | Empresa | Área usada | Personalización | Respuesta | Entrevista | Oferta |
|-------|---------|------------|-----------------|-----------|------------|--------|
| 23/01 | Startup | Data Sci   | +GitHub         | ✅        | ✅         | ⏳     |
| 20/01 | UNSCH   | Docencia   | +Certificados   | ✅        | ✅         | ✅     |
```

Esto te ayuda a:
- Identificar qué funciona
- Mejorar el sistema con el tiempo
- Motivarte con el progreso

---

## 🎓 Filosofía del Sistema

> **"Un sistema, infinitas posibilidades"**

Principios:
1. **DRY (Don't Repeat Yourself):** Escribes una vez, reutilizas múltiples veces
2. **Modularidad:** Cada componente es independiente y combinable
3. **Versionamiento:** Git mantiene tu historia
4. **Evolución continua:** El sistema mejora con cada postulación
5. **Honestidad:** Tu verdad bien presentada > exageraciones

---

## 📞 Contacto y Soporte

**Edison Achalma**
- 📧 Email: elmer.achalma.09@unsch.edu.pe
- 💼 LinkedIn: [linkedin.com/in/achalmaedison](https://linkedin.com/in/achalmaedison)
- 🐙 GitHub: [github.com/achalmed](https://github.com/achalmed)
- 🌐 Web: [achalmaedison.netlify.app](https://achalmaedison.netlify.app)

---

## 📜 Licencia

**CC BY-SA 4.0** - Puedes usar, modificar y compartir libremente dando crédito.

---

## 🚀 Próximos Pasos Sugeridos

1. ✅ Lee este índice (ya lo hiciste!)
2. ✅ Lee README.md (10 min)
3. ✅ Lee GUIA_PRACTICA.md con casos reales (20 min)
4. ✅ Genera tu primer CV siguiendo un caso de uso (40 min)
5. ⏭️ Explora PLANTILLAS_RAPIDAS.md para automatización
6. ⏭️ Configura Git para gestión de versiones
7. ⏭️ Personaliza el sistema a tus necesidades específicas

---

**¡Éxito en tu búsqueda laboral! 🎯**

*Última actualización: Enero 2026*  
*Versión: 1.0*
