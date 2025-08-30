# MARP Slide Build System (new layout)
# Converts markdown slides to PDF, PPT, and HTML formats next to their source files

MARP := marp

# draw.io Desktop CLI 경로 자동 감지 (macOS 기준)
# 참고: https://tomd.xyz/how-i-use-drawio/
# 우선 순위: /Applications/draw.io.app(...) -> PATH 내 drawio
ifneq (,$(wildcard /Applications/draw.io.app/Contents/MacOS/draw.io))
  DRAWIO_BIN := /Applications/draw.io.app/Contents/MacOS/draw.io
else
  DRAWIO_BIN := $(shell command -v drawio 2>/dev/null)
endif

# New layout: decks live under top-level dirs (e.g., devops/devops.md, secuiry/security.md)
DECK_MD := $(wildcard */*.md)
DECK_PDF := $(DECK_MD:%.md=%.pdf)
DECK_PPTX := $(DECK_MD:%.md=%.pptx)
DECK_HTML := $(DECK_MD:%.md=%.html)

# secuiry diagrams (draw.io -> svg in-place)
SECUIRY_DIAGRAMS_DIR := secuiry/diagrams
SECUIRY_DRAWIO := $(wildcard $(SECUIRY_DIAGRAMS_DIR)/*.drawio)
SECUIRY_SVG := $(SECUIRY_DRAWIO:.drawio=.svg)

# Handle positional arg for `make preview <name>`
ifeq (preview,$(firstword $(MAKECMDGOALS)))
  PREVIEW_NAME := $(word 2,$(MAKECMDGOALS))
  ifneq ($(PREVIEW_NAME),)
    $(eval $(PREVIEW_NAME):;@:)
  endif
endif

# Convenience aliases per deck
BASE_NAMES := $(basename $(notdir $(DECK_MD)))

# Define output files (no central output dir)
PDF_FILES := $(DECK_PDF)
PPTX_FILES := $(DECK_PPTX)
HTML_FILES := $(DECK_HTML)

# Per-deck convenience targets: build-<name> and <name>
$(foreach n,$(BASE_NAMES),$(eval build-$(n): $$(firstword $$(wildcard */$(n).pdf)) $$(firstword $$(wildcard */$(n).pptx)) $$(firstword $$(wildcard */$(n).html))))
$(foreach n,$(BASE_NAMES),$(eval $(n): build-$(n)))

# Directory-based targets: build by directory name
DECK_DIRS := $(sort $(dir $(DECK_MD)))
DECK_DIR_NAMES := $(patsubst %/,%,$(DECK_DIRS))

# Create targets for each directory (e.g., make secuiry, make devops)  
$(foreach d,$(DECK_DIR_NAMES),$(eval $(d): $$(patsubst %.md,%.pdf,$$(wildcard $(d)/*.md)) $$(patsubst %.md,%.pptx,$$(wildcard $(d)/*.md)) $$(patsubst %.md,%.html,$$(wildcard $(d)/*.md))))

.PHONY: all pdf pptx html preview diagrams diagrams-security clean help list-files $(BASE_NAMES) $(foreach name,$(BASE_NAMES),build-$(name)) $(DECK_DIR_NAMES)

# Default target
all: pdf pptx html

# PDF generation
pdf: $(PDF_FILES)

%.pdf: %.md
	$(MARP) --pdf --allow-local-files --output $@ $<

# PowerPoint generation
pptx: $(PPTX_FILES)

%.pptx: %.md
	$(MARP) --pptx --allow-local-files --output $@ $<

# HTML generation
html: $(HTML_FILES)

%.html: %.md
	$(MARP) --html --allow-local-files --output $@ $<

# Ensure secuiry deck HTML depends on exported SVG diagrams
secuiry/security.html: $(SECUIRY_SVG)

# Export all diagrams (for all decks if expanded later)
diagrams: diagrams-security

# Export secuiry deck diagrams (drawio -> svg)
diagrams-security: $(SECUIRY_SVG)

# Rule: .drawio -> .svg (in-place)
$(SECUIRY_DIAGRAMS_DIR)/%.svg: $(SECUIRY_DIAGRAMS_DIR)/%.drawio
	@if [ -z "$(DRAWIO_BIN)" ]; then \
		echo "[ERR] draw.io CLI를 찾을 수 없습니다."; \
		echo "macOS: brew install --cask drawio"; \
		exit 1; \
	fi; \
	"$(DRAWIO_BIN)" -x -f svg -o $@ $<

# 편의: draw.io 설치 체크
.PHONY: check-drawio
check-drawio:
	@set -e; \
	if [ -x /Applications/draw.io.app/Contents/MacOS/draw.io ]; then \
		echo "draw.io app found: /Applications/draw.io.app/Contents/MacOS/draw.io"; \
	elif command -v drawio >/dev/null 2>&1; then \
		echo "drawio CLI found in PATH: $$(command -v drawio)"; \
	else \
		echo "draw.io CLI not found."; \
		echo "Install (macOS): brew install --cask drawio"; \
	fi

# Preview a specific slide deck in browser (make preview security|devops|path/to/file.md)
preview:
	@if [ -z "$(PREVIEW_NAME)" ]; then \
		echo "Usage: make preview <security|devops|path/to.md>"; exit 1; \
	fi; \
	FILE=""; \
	if [ "$(PREVIEW_NAME)" = "security" ] || [ "$(PREVIEW_NAME)" = "secuiry" ]; then \
		FILE="secuiry/security.md"; \
	elif [ "$(PREVIEW_NAME)" = "devops" ]; then \
		FILE="devops/devops.md"; \
	elif [ -f "$(PREVIEW_NAME)" ]; then \
		FILE="$(PREVIEW_NAME)"; \
	fi; \
	if [ -z "$$FILE" ] || [ ! -f "$$FILE" ]; then \
		echo "Not found: $(PREVIEW_NAME)"; exit 1; \
	fi; \
	case "$$FILE" in \
	  secuiry/*) $(MAKE) diagrams-security ;; \
	  *) true ;; \
	esac; \
	$(MARP) --preview --allow-local-files "$$FILE"

# List available markdown files
list-files:
	@echo "Available markdown files:"
	@$(foreach name,$(BASE_NAMES),echo "  $(name)";)
	@echo ""
	@echo "Usage examples:"
	@echo "  make devops       - Generate all formats for devops.md"
	@echo "  make devops-pdf   - Generate PDF only for devops.md"
	@echo "  make devops-pptx  - Generate PPTX only for devops.md"
	@echo "  make devops-html  - Generate HTML only for devops.md"

# Clean output directory
clean:
	rm -rf $(OUTPUT_DIR)/*

# Show help
help:
	@echo "Available targets:"; \
	echo "  all           - Generate PDF, PPTX, and HTML files (default)"; \
	echo "  pdf|pptx|html - Generate respective formats for all decks"; \
	echo ""; \
	echo "Directory-based targets:"; \
	$(foreach d,$(DECK_DIR_NAMES),echo "  $(d)          - Build all formats for $(d) directory";) \
	echo ""; \
	echo "Deck-based targets:"; \
	$(foreach n,$(BASE_NAMES),echo "  $(n)          - Build all formats for $(n).md";) \
	echo ""; \
	echo "Other targets:"; \
	echo "  diagrams      - Export all draw.io diagrams to SVG"; \
	echo "  diagrams-security - Export secuiry diagrams"; \
	echo "  preview <deck|path> - Preview deck (auto-exports diagrams for secuiry)"; \
	echo "  list-files    - Show detected decks and diagrams"; \
	echo "  clean         - Remove generated pdf/pptx/html near sources"