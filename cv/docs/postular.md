---
tipo: doc
estado: activo
titulo: "Cómo preparar el CV para una postulación: perfil, ajustes, copia de envío y correo"
---
# Cómo preparar el CV para una postulación

Para el autor, ante una convocatoria concreta. Las órdenes `make` se ejecutan dentro de `cv/`; cómo
editar cada pieza está en [edicion.md](edicion.md).

## 1. Elegir el perfil

| convocatoria | perfil | qué trae |
|---|---|---|
| entidad pública, CAS | `make sector-publico` (perfil por defecto) | redacciones `--sector-publico` y anexos del área |
| docencia universitaria o preuniversitaria | `make docencia` | experiencias con énfasis docente y anexos del área |
| análisis de datos, empresa tecnológica | `make data-science` | experiencias de análisis de datos; los proyectos están comentados en el perfil |
| banca, microfinanzas | `make sector-financiero` | redacciones `--sector-financiero` y anexos del área |
| trayectoria completa (becas, registros de investigadores) | `make economia` | experiencias en versión larga y **todos** los anexos |
| consultoría | `make consultoria` | versión larga, competencias de economía y todos los anexos |

El PDF sale en `cv/build/cv-<perfil>.pdf`. Si la convocatoria pide el CV sin documentos adjuntos (o
estos se presentan aparte), `make <perfil> ANEXOS=0` genera `cv/build/cv-<perfil>-sin-anexos.pdf` sin
pisar la versión completa.

## 2. Ajustar al puesto

1. Lee las bases y anota cinco a siete palabras clave; búscalas en el contenido:
   `grep -ril "palabra" cv/main/sections/`.
2. Declaración: `cv/main/sections/declaraciones/1_declaracion_<área>.tex`.
3. Qué experiencias aparecen y en qué orden: el selector
   `cv/main/sections/experiencias/2_experiencias_<área>.tex` (reordena o comenta líneas
   `\entradaExperiencia{…}`).
4. El texto de una experiencia: su archivo en `cv/main/sections/experiencias/entradas/` (la variante
   del área, si existe).
5. Los anexos: `cv/main/sections/anexos/12_anexos_<área>.tex`.
6. Recompila con `make <perfil>` y revisa el PDF.

Si el CV pasa de las páginas que piden: comenta entradas menos pertinentes en el selector, usa
redacciones `--corta` donde existan o quita anexos del área. Un ajuste que solo sirve para una
convocatoria no se confirma: se descarta después de enviar (git conserva la versión buena).

## 3. Copia de envío

```bash
make docencia && xdg-open build/cv-docencia.pdf
cp build/cv-docencia.pdf "<carpeta de la postulación>/CV_<Apellido>_<Entidad>_<Puesto>.pdf"
```

## 4. Lista de comprobación antes de enviar

- [ ] Declaración adaptada al área y al puesto.
- [ ] Las experiencias más pertinentes, primero.
- [ ] Anexos vigentes y del área (o versión `ANEXOS=0` si se presentan aparte).
- [ ] Sin errores de compilación; el PDF abre y la numeración de páginas es correcta.
- [ ] Contacto al día (`cv/main/config/personal.tex`).
- [ ] Ortografía revisada.
- [ ] Nombre de archivo descriptivo.

## 5. Correos de postulación

Plantillas para adaptar; los corchetes son lo que se rellena.

**Sector público (CAS)**

```text
Asunto: Postulación CAS N.° [número] — [puesto]

Señores de [entidad]:

Me dirijo a ustedes para postular al proceso CAS N.° [número] para el cargo de [puesto]. Cuento con
formación en economía y experiencia en [área de los términos de referencia], lo que me permite cumplir
los requisitos de las bases. Adjunto la documentación requerida.

Atentamente,
[nombre completo]
DNI: [número]
```

**Docencia**

```text
Asunto: Postulación docente — [curso]

Estimados:

Les escribo para expresar mi interés en la plaza de docente de [curso] publicada en [fuente]. Soy
economista con experiencia en docencia y en metodología de la investigación, y considero que puedo
aportar a la formación de estudiantes en [área]. Adjunto mi CV.

Quedo atento a sus comentarios.
[nombre] · [teléfono] · [correo]
```

**Análisis de datos (en inglés)**

```text
Subject: Data Analyst position — [name]

Dear Hiring Manager,

I am writing to express my interest in the Data Analyst position at [company]. As an economist focused
on quantitative analysis, I work with R, Python, SQL and data visualization; a recent example is
[project], where I [measurable result]. Please find my resume attached.

Best regards,
[name]
```
