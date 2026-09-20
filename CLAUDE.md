# CLAUDE.md — 09 trabajo

Carpeta de **trabajo** de Edison Achalma (expedientes laborales, encargos, postulaciones) que
desde 2026-09-06 aloja también el repositorio del **CV** (`Curriculum-Vitae` en GitHub).
`AGENTS.md` es un enlace a este archivo.

- `cv/` — el CV multi-perfil en LaTeX. **Única parte versionada** en este repo. Guía completa
  en `cv/CLAUDE.md`; compilar con `make -C cv <perfil>` (o `cd cv && make …`).
- El resto de carpetas de primer nivel son expedientes de trabajo (INEI, ONPE, prácticas,
  postulaciones, proveedores) y el **despacho parlamentario** (`congreso de la republica -
  despacho-diputado/`): **no se versionan aquí** (`.gitignore` en lista blanca) y contienen datos
  sensibles: no copiar ni publicar fuera de esta máquina.
- El despacho es, desde 2026-09-15, un repo git propio y privado (sin remoto) de registros y perfil:
  cliente de los repos `sgdp` (con `marco_documental/` dentro), `identidad_visual` y `openproject_despacho`
  (en `05 tasks/`) de `~/Documents/`. Su `CLAUDE.md` manda allí; `despacho.yml` es el manifiesto y `./doctor.sh` la salud.
  Ya no hay repos anidados dentro (`meta/diagnosticos/DIAGNOSTICO_DESPACHO_2026-09.md`, fases D0 a D8).
- Notas de pensamiento sobre estos encargos: vault (`01 notes/30-trabajo-y-negocios/`).
  Papeleo personal del cargo: `08 personal/03_trabajo/`.
