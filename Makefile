# =============================================================================
# Makefile — Sistema de compilación del CV multi-perfil
# =============================================================================
# Uso:
#   make                    → compila el perfil por defecto (sector-publico)
#   make docencia           → compila un perfil concreto
#   make all                → compila los 6 perfiles
#   make economia BIBER=1   → incluye pasada de biber (sección publicaciones)
#   make clean              → elimina la carpeta build/
#
# Salida: build/cv-<perfil>.pdf
#
# Requiere: LuaLaTeX (obligatorio — la clase usa fontspec/OpenType) y biber
# solo si se activa la sección de publicaciones. Las fuentes van incluidas
# en main/fonts/.
# =============================================================================

PROFILES := sector-publico docencia data-science sector-financiero economia consultoria
BUILDDIR := build
BIBER    ?= 0

ENGINE := lualatex --interaction=nonstopmode --halt-on-error

.DEFAULT_GOAL := sector-publico

all: $(PROFILES)

# Dos pasadas de LuaLaTeX para resolver referencias y numeración total de
# páginas; biber entre ambas solo si se pide (BIBER=1).
$(PROFILES):
	@mkdir -p $(BUILDDIR)
	cd main && $(ENGINE) --output-directory=../$(BUILDDIR) --jobname=cv-$@ '\def\CVprofile{$@}\input{cv.tex}'
ifneq ($(BIBER),0)
	biber $(BUILDDIR)/cv-$@
endif
	cd main && $(ENGINE) --output-directory=../$(BUILDDIR) --jobname=cv-$@ '\def\CVprofile{$@}\input{cv.tex}'

clean:
	rm -rf $(BUILDDIR)

.PHONY: all clean $(PROFILES)
