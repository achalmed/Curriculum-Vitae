# =============================================================================
# Makefile — Sistema de compilación del CV multi-perfil
# =============================================================================
# Uso:
#   make                    → compila el perfil por defecto (sector-publico)
#   make docencia           → compila un perfil concreto
#   make all                → compila los 6 perfiles
#   make docencia ANEXOS=0  → versión sin anexos (solo descriptivo, sin
#                             constancias/certificados adjuntos)
#   make economia BIBER=1   → incluye pasada de biber (sección publicaciones)
#   make clean              → elimina la carpeta build/
#
# Salida: build/cv-<perfil>.pdf  (con ANEXOS=0: build/cv-<perfil>-sin-anexos.pdf)
#
# Requiere: LuaLaTeX (obligatorio — la clase usa fontspec/OpenType) y biber
# solo si se activa la sección de publicaciones. Las fuentes van incluidas
# en main/fonts/.
# =============================================================================

PROFILES := sector-publico docencia data-science sector-financiero economia consultoria
BUILDDIR := build
BIBER    ?= 0
ANEXOS   ?= 1

ENGINE := lualatex --interaction=nonstopmode --halt-on-error

# Con ANEXOS=0 se define \CVsinAnexos (cv.tex omite los anexos) y el PDF
# lleva sufijo -sin-anexos para no sobrescribir la versión completa.
ifeq ($(ANEXOS),0)
SUFIJO  := -sin-anexos
TEXDEFS  = \def\CVsinAnexos{1}\def\CVprofile{$@}
else
SUFIJO  :=
TEXDEFS  = \def\CVprofile{$@}
endif

.DEFAULT_GOAL := sector-publico

all: $(PROFILES)

# Dos pasadas de LuaLaTeX para resolver referencias y numeración total de
# páginas; biber entre ambas solo si se pide (BIBER=1).
$(PROFILES):
	@mkdir -p $(BUILDDIR)
	cd main && $(ENGINE) --output-directory=../$(BUILDDIR) --jobname=cv-$@$(SUFIJO) '$(TEXDEFS)\input{cv.tex}'
ifneq ($(BIBER),0)
	biber $(BUILDDIR)/cv-$@$(SUFIJO)
endif
	cd main && $(ENGINE) --output-directory=../$(BUILDDIR) --jobname=cv-$@$(SUFIJO) '$(TEXDEFS)\input{cv.tex}'

clean:
	rm -rf $(BUILDDIR)

.PHONY: all clean $(PROFILES)
