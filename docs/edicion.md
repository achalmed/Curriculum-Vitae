---
tipo: doc
estado: activo
titulo: "Cómo editar el contenido del CV: datos, experiencias, anexos, secciones y perfiles"
---
# Cómo editar el contenido del CV

Para quien mantiene el CV. Cada receta dice qué archivo tocar y qué perfiles compilar después. Las
rutas se dan desde la raíz del repo; las órdenes `make` se ejecutan dentro de `cv/` (o desde la raíz
con `make -C cv …`). Las macros que aparecen se describen en [referencia-yaac.md](referencia-yaac.md).

**Regla de oro:** los perfiles (`cv/main/profiles/`) y los selectores solo eligen y ordenan; el
contenido vive una sola vez en `cv/main/sections/`. Si el mismo texto aparece en dos archivos, hay un
lugar mejor para él.

## 1. Datos personales o de contacto

Todo está en `cv/main/config/personal.tex` y llega a los seis perfiles: `\name`, `\tagline`,
`\photo`, el bloque `\socialinfo{…}` y `\authorFullName` (el nombre del pie). Después: `make all`.

## 2. Texto o fechas de una experiencia

Cada empleo tiene un archivo **base** en `cv/main/sections/experiencias/entradas/` y, cuando la
redacción cambia por área, **variantes** `--<perfil>` (`--sector-publico`, `--docencia`, `--corta`…).

1. Localiza todos los archivos del empleo: `ls cv/main/sections/experiencias/entradas/ | grep <empleo>`.
2. Mira qué variante carga cada perfil: `grep -n <empleo> cv/main/sections/experiencias/2_experiencias_*.tex`.
3. Edita. Las **fechas están repetidas** en la base y en todas sus variantes, y a veces también en el
   pie «Período: …»: una fecha se cambia en todos los archivos del paso 1.
4. Compila los perfiles afectados (`make all` si tocaste la base).

## 3. Experiencia nueva

1. Crea `cv/main/sections/experiencias/entradas/AAAA-MM_slug.tex` (fecha de **inicio**, para que el
   listado quede cronológico) con la estructura de `\experience`; lo más simple es copiar una entrada
   parecida.
2. Regístrala en los selectores de las áreas donde deba aparecer, en la posición deseada:

   ```latex
   \entradaExperiencia{AAAA-MM_slug}
   \emptySeparator
   ```

   Sin la extensión y **nunca con `\input`** (ver «Si la compilación falla»).
3. Si un área necesita otra redacción, crea la variante `AAAA-MM_slug--<perfil>.tex` y apunta a ella el
   selector de esa área.
4. Compila los perfiles afectados.

Los archivos `_banco-*.tex` de `entradas/` son plantillas con empleadores genéricos, no experiencia
real: no se activan.

## 4. Certificado nuevo (anexo)

1. Guarda el PDF en `cv/assets/anexos/` como `AAAAMMDD descripcion en minusculas.pdf` (fecha de
   emisión primero: así se ordena solo).
2. Define su macro **una sola vez** en `cv/main/sections/anexos/catalogo.tex`, en orden cronológico
   descendente:

   ```latex
   % Constancia de ejemplo — Institución (DD/MM/AAAA)
   \providecommand{\anexoEjemplo}{%
   	\includepdf[pages=-]{../assets/anexos/AAAAMMDD constancia de ejemplo.pdf}}
   ```

   Un documento apaisado lleva `\includepdf[pages=-, landscape]{…}`.
3. Llama a la macro en los `cv/main/sections/anexos/12_anexos_*.tex` de las áreas que la necesiten.
4. Añade la línea correspondiente en `cv/main/sections/otros/4_certificados.tex` (la lista textual que
   ven todos los perfiles).

## 5. Reemplazar un certificado

1. Guarda el PDF nuevo en `cv/assets/anexos/` con su propio nombre `AAAAMMDD …pdf`.
2. En `catalogo.tex`, cambia la ruta **dentro de la macro existente** (y la fecha del comentario); no
   dupliques la macro.
3. Si el PDF antiguo ya no lo usa ninguna macro, puede borrarse.
4. Audita las rutas: una ruta inexistente rompe `\includepdf` al compilar.

   ```bash
   cd cv/main && grep -h includepdf sections/anexos/catalogo.tex | grep -oP '\{\K[^}]+' \
     | while read f; do [ -f "$f" ] || echo "FALTA: $f"; done
   ```

   Salen siempre dos `FALTA: ...` con puntos suspensivos literales: son los ejemplos del encabezado
   del catálogo y se ignoran. Cualquier otra línea es una ruta rota.

## 6. Formación, idiomas, logros, proyectos, voluntariado, referencias

Son secciones compartidas por todos los perfiles, en `cv/main/sections/otros/`:
`3_formacion_academica.tex`, `4_certificados.tex`, `5_idiomas_habilidades.tex`, `6_logros.tex`,
`8_proyectos.tex`, `9_voluntariado.tex`, `10_referencias.tex` y `11_publicaciones.tex`. Tras editarlas:
`make all`. La sección de proyectos está comentada en los seis perfiles; se activa descomentando su
`\input` en el perfil.

## 7. Declaración o competencias de un área

Un archivo por área en `cv/main/sections/declaraciones/` (el párrafo inicial) y en
`cv/main/sections/competencias/`. Solo afectan a su perfil: basta `make <perfil>`.

## 8. Perfil nuevo

1. Copia el perfil más parecido: `cp cv/main/profiles/docencia.tex cv/main/profiles/<nuevo>.tex`.
2. Ajusta sus líneas `\input` (declaración, selector de experiencias, competencias) y
   `\inputAnexos{…}` (los anexos). Un perfil **solo** contiene esas líneas.
3. Añade el nombre a `PROFILES` en `cv/Makefile`.
4. `make <nuevo>`. La CI no se toca: ejecuta `make all`, que lee `PROFILES`.

## 9. Publicaciones

La sección existe (`cv/main/sections/otros/11_publicaciones.tex`, comentada en todos los perfiles) pero
**hoy no se puede activar**:

- `cv/bibliography/my_publications.bib` solo contiene **entradas de ejemplo** atribuidas al autor; si
  se activa tal cual, el CV las imprime. Antes hay que sustituirlas por publicaciones reales.
- `make <perfil> BIBER=1` falla («Cannot find … .bcf»): el Makefile ejecuta `biber`, y la clase carga
  biblatex con `backend = bibtex`.

Los dos arreglos están en los pendientes de [decisiones.md](decisiones.md). Cuando estén hechos, la
sección se activa descomentando `\input{sections/otros/11_publicaciones}` en el perfil y compilando con
`BIBER=1`.

## Antes de confirmar un cambio

1. Compila lo afectado: `make <perfil>`, o `make all` si tocaste `config/`, `otros/`, el catálogo o
   una entrada base.
2. Revisa el PDF en `cv/build/` (fechas, saltos de página, anexos al final).
3. Si tocaste anexos, corre la auditoría de la receta 5.
4. No confirmes artefactos: `cv/build/`, `cv/output/` y los PDF de `cv/main/` están ignorados; los PDF
   se distribuyen por Releases ([publicar.md](publicar.md)).
5. Un cambio estructural (perfil o sección nueva, reorganización) se anota en `cv/CHANGELOG.md`.

## Si la compilación falla

El registro está en `cv/build/cv-<perfil>.log`.

| síntoma | causa | solución |
|---|---|---|
| `Misplaced \omit` | un `\input` dentro de `experiences` | usa `\entradaExperiencia{…}` (receta 3) |
| `File '../assets/anexos/….pdf' not found` | una macro del catálogo apunta a un PDF renombrado o borrado | corrige la ruta en `catalogo.tex` y audita (receta 5) |
| `fontspec` falla o las fuentes salen rotas | se compiló con pdfLaTeX | compila con LuaLaTeX (`make`) |
| editaste una entrada y el PDF no cambia | el perfil carga otra variante del empleo | `grep` en el selector (receta 2, paso 2) |
| una fecha vieja aparece en otro perfil | fechas repetidas entre base y variantes | corrige todas las variantes (receta 2) |
| `Cannot find '….bcf'` | `BIBER=1` con la clase en `backend = bibtex` | no uses `BIBER=1` hasta el arreglo (receta 9) |
