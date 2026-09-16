---
tipo: doc
titulo: "🎯 Guía Práctica de Uso — Sistema de CV Multi-Perfil"
estado: activo
---
# 🎯 Guía Práctica de Uso — Sistema de CV Multi-Perfil

## 📖 ¿Qué es esto?

Un sistema donde **un solo repositorio de contenido** genera seis CVs
adaptados a áreas profesionales distintas. No se copian archivos ni se
comentan líneas en el documento principal: el perfil se elige al compilar
(`make <perfil>`) y cada perfil es un archivo en `main/profiles/` que
selecciona secciones y redacciones.

## 🚀 Casos de Uso Reales

### Caso 1: Postulación a Universidad (Docente)

```bash
make docencia
xdg-open build/cv-docencia.pdf
```

Si quieres afinar antes de enviar:

1. **Declaración** → `main/sections/declaraciones/1_declaracion_docencia.tex`
2. **Qué experiencias aparecen y en qué orden** →
   `main/sections/experiencias/2_experiencias_docencia.tex` (reordena o
   comenta las líneas `\entradaExperiencia{...}`)
3. **El texto de una experiencia** → su archivo en
   `main/sections/experiencias/entradas/` (la variante `--docencia` si existe)
4. Recompila: `make docencia`

### Caso 2: Postulación a Startup Tech (Data Analyst)

```bash
make data-science
```

Consejos para este perfil: activa la sección de proyectos descomentando
`\input{sections/otros/8_proyectos}` en `main/profiles/data-science.tex`,
y revisa que el selector de experiencias muestre primero el trabajo freelance
de análisis de datos.

### Caso 3: Postulación a Ministerio (Analista Económico)

```bash
make sector-publico
```

Este perfil incluye la redacción de experiencias con énfasis en gestión
pública (variantes `--sector-publico`) y los anexos del área
(`main/sections/anexos/12_anexos_sector_publico.tex`).

### Caso 4: Proceso que pide trayectoria completa (becas, CTI Vitae)

```bash
make economia      # usa la versión LARGA de experiencias y TODOS los anexos
```

## 🛠️ Comandos Útiles

```bash
make               # perfil por defecto (sector-publico)
make all           # los 6 perfiles de una vez
make clean         # limpiar build/

# Buscar en qué entradas aparece una palabra clave del puesto:
grep -ril "econometría\|python\|siaf" main/sections/

# Auditar que ningún anexo referencie un PDF inexistente:
cd main && grep -h includepdf sections/anexos/catalogo.tex | \
  grep -oP '\{\K[^}]+' | while read f; do [ -f "$f" ] || echo "FALTA: $f"; done
```

## 📝 Tips para Personalización Rápida

### 1. Usa búsqueda de palabras clave

Cuando leas la descripción del puesto, identifica 5-7 palabras clave y busca
en el contenido: `grep -i "palabra" main/sections/**/*.tex`.

### 2. Matriz de relevancia

Para cada postulación, haz una tabla mental:

| Elemento | ¿Relevante? | Acción |
|----------|-------------|---------|
| Experiencia docente | ✅ Alta | Activarla y ponerla primera en el selector |
| Experiencia Python | ⚠️ Media | Activar si hay espacio |
| Proyecto chatbot | ❌ Baja | Dejar comentada |

### 3. Regla 70-20-10

- **70%** — Contenido directamente relevante al puesto
- **20%** — Contenido que muestra versatilidad
- **10%** — Contenido "extra" que te diferencia

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
2. [ ] Identificar perfil principal (1 min)
3. [ ] Compilar: make <perfil> (2 min)
4. [ ] Ajustar declaración si hace falta (5 min)
5. [ ] Reordenar/activar experiencias en el selector del área (5 min)
6. [ ] Revisar anexos incluidos (2 min)
7. [ ] Recompilar y revisar PDF (3 min)
8. [ ] Renombrar: CV_Edison_Empresa_Fecha.pdf y ¡enviar!

Total: ~25 minutos por postulación
```

## 🔧 Solución de Problemas Comunes

### "Mi CV tiene demasiadas páginas"

- Comenta líneas `\entradaExperiencia{...}` menos relevantes en el selector
- Usa las variantes `--corta` de las entradas (o crea una)
- Reduce los anexos incluidos en `12_anexos_<perfil>.tex`

### "No tengo experiencia en X área"

- Enfatiza habilidades transferibles
- Usa proyectos académicos (`sections/otros/8_proyectos.tex`)
- Menciona cursos relevantes y capacidad de aprendizaje rápido

### "La compilación falla"

- Compila el perfil afectado y revisa `build/cv-<perfil>.log`
- Si el error es `Cannot find file ...assets/anexos/...`, un anexo del
  catálogo referencia un PDF renombrado/eliminado: corrige
  `sections/anexos/catalogo.tex`
- Si el error es `Misplaced \omit` en experiencias, usa
  `\entradaExperiencia{...}` (nunca `\input`) dentro de `\begin{experiences}`

## 📊 Métricas de Éxito

Después de cada postulación, registra:

| Puesto | Perfil usado | Ajustes principales | ¿Respuesta? |
|--------|--------------|---------------------|-------------|
| Data Analyst - Startup | data-science | +Proyectos GitHub | ✅ Sí |
| Docente - Universidad | docencia | +Certificados pedagógicos | ✅ Sí |
| Analista - Ministerio | sector-publico | +SIAF/SIGA | ❌ No |

Esto te ayuda a identificar qué versiones funcionan mejor y qué valoran
diferentes empleadores.

## 🎓 Filosofía Final

> "No es tener 100 versiones de CV.
> Es tener UN sistema que genera el CV perfecto para CADA oportunidad."

---

**¿Preguntas?** Revisa el README.md de la raíz o el índice en
`docs/INDICE.md`.

**¡Éxito en tus postulaciones! 🚀**
