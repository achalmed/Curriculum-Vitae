#!/usr/bin/env bash
# scripts/construir-pdf.sh — genera el derivado cv.pdf de un perfil (make + LuaLaTeX) con marca de generado; simula por defecto
#
# Es el generador que invocan los consumidores del PDF (el hub, `04 index/resources/cv.pdf`):
# el consumidor llama a esta orden en vez de copiar un PDF a mano. Sin --aplicar no compila ni copia.
set -euo pipefail

uso() {
  cat <<'USO'
uso: scripts/construir-pdf.sh [--perfil <perfil>] [--sin-anexos] [--salida <ruta.pdf>] [--aplicar]

  --perfil P     perfil del Makefile (por defecto: sector-publico)
  --sin-anexos   compila sin los certificados adjuntos (ANEXOS=0)
  --salida R     copia el PDF compilado a R (el derivado del consumidor)
  --aplicar      compila y copia; sin esta opción solo muestra lo que haría
  -h, --help     esta ayuda

El PDF lleva en sus metadatos (Subject) la marca «GENERADO por cv/scripts/construir-pdf.sh …».
Salida: 0 bien · 1 compilación fallida · 2 uso incorrecto.
USO
}

PERFIL=sector-publico; SALIDA=""; APLICAR=0; ANEXOS=1
while [ $# -gt 0 ]; do
  case "$1" in
    --perfil) [ $# -ge 2 ] || { uso >&2; exit 2; }; PERFIL="$2"; shift 2 ;;
    --salida) [ $# -ge 2 ] || { uso >&2; exit 2; }; SALIDA="$2"; shift 2 ;;
    --sin-anexos) ANEXOS=0; shift ;;
    --aplicar) APLICAR=1; shift ;;
    -h|--help) uso; exit 0 ;;
    *) echo "opción desconocida: $1" >&2; uso >&2; exit 2 ;;
  esac
done

RAIZ="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
PERFILES="$(sed -n 's/^PROFILES *:= *//p' "$RAIZ/Makefile")"
case " $PERFILES " in *" $PERFIL "*) ;; *) echo "perfil desconocido: $PERFIL (perfiles: $PERFILES)" >&2; exit 2 ;; esac

SUFIJO=""; [ "$ANEXOS" = 0 ] && SUFIJO="-sin-anexos"
PDF="$RAIZ/build/cv-$PERFIL$SUFIJO.pdf"
COMMIT="$(git -C "$RAIZ" rev-parse --short HEAD 2>/dev/null || echo sin-git)"
# Sin «--» en la marca: TeX lo convertiría en una raya en los metadatos.
MARCA="GENERADO por cv/scripts/construir-pdf.sh (perfil $PERFIL$SUFIJO, commit $COMMIT, $(date +%F)); no editar: se regenera con scripts/construir-pdf.sh"

if [ "$APLICAR" = 0 ]; then
  echo "[simulación] make -C \"$RAIZ\" $PERFIL ANEXOS=$ANEXOS MARCA=\"$MARCA\""
  echo "[simulación] producto: $PDF"
  [ -n "$SALIDA" ] && echo "[simulación] copia: $PDF → $SALIDA"
  echo "[simulación] nada se compiló ni se copió; repite con --aplicar"
  exit 0
fi

make -C "$RAIZ" "$PERFIL" ANEXOS="$ANEXOS" MARCA="$MARCA" >/dev/null || { echo "falló la compilación: $RAIZ/build/cv-$PERFIL$SUFIJO.log" >&2; exit 1; }
test -s "$PDF" || { echo "no se produjo $PDF" >&2; exit 1; }
echo "producto: $PDF"
if [ -n "$SALIDA" ]; then
  cp -- "$PDF" "$SALIDA"
  echo "copia: $SALIDA"
fi
