# MARP Slide Build System
# Converts markdown slides to PDF, PPT, and HTML formats

SOURCE_DIR := source
OUTPUT_DIR := output
MARP := marp

# Find all markdown files in source directory
MD_FILES := $(wildcard $(SOURCE_DIR)/*.md)
BASE_NAMES := $(basename $(notdir $(MD_FILES)))

# Define output files
PDF_FILES := $(addprefix $(OUTPUT_DIR)/, $(addsuffix .pdf, $(BASE_NAMES)))
PPTX_FILES := $(addprefix $(OUTPUT_DIR)/, $(addsuffix .pptx, $(BASE_NAMES)))
HTML_FILES := $(addprefix $(OUTPUT_DIR)/, $(addsuffix .html, $(BASE_NAMES)))

# Individual file targets for specific formats
define file_targets
$(foreach name,$(BASE_NAMES),$(eval $(name)-pdf: $(OUTPUT_DIR)/$(name).pdf))
$(foreach name,$(BASE_NAMES),$(eval $(name)-pptx: $(OUTPUT_DIR)/$(name).pptx))
$(foreach name,$(BASE_NAMES),$(eval $(name)-html: $(OUTPUT_DIR)/$(name).html))
$(foreach name,$(BASE_NAMES),$(eval $(name): $(OUTPUT_DIR)/$(name).pdf $(OUTPUT_DIR)/$(name).pptx $(OUTPUT_DIR)/$(name).html))
endef
$(eval $(call file_targets))

.PHONY: all pdf pptx html clean help list-files $(BASE_NAMES) $(foreach name,$(BASE_NAMES),$(name)-pdf $(name)-pptx $(name)-html)

# Default target
all: pdf pptx html

# Create output directory if it doesn't exist
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

# PDF generation
pdf: $(PDF_FILES)

$(OUTPUT_DIR)/%.pdf: $(SOURCE_DIR)/%.md | $(OUTPUT_DIR)
	$(MARP) --pdf --allow-local-files --output $@ $<

# PowerPoint generation
pptx: $(PPTX_FILES)

$(OUTPUT_DIR)/%.pptx: $(SOURCE_DIR)/%.md | $(OUTPUT_DIR)
	$(MARP) --pptx --allow-local-files --output $@ $<

# HTML generation
html: $(HTML_FILES)

$(OUTPUT_DIR)/%.html: $(SOURCE_DIR)/%.md | $(OUTPUT_DIR)
	$(MARP) --html --allow-local-files --output $@ $<

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
	@echo "Available targets:"
	@echo "  all           - Generate PDF, PPTX, and HTML files (default)"
	@echo "  pdf           - Generate PDF files only"
	@echo "  pptx          - Generate PowerPoint files only"
	@echo "  html          - Generate HTML files only"
	@echo "  list-files    - Show available markdown files and usage examples"
	@echo "  clean         - Remove all generated files"
	@echo "  help          - Show this help message"
	@echo ""
	@echo "File-specific targets:"
	@echo "  <filename>       - Generate all formats for specific file"
	@echo "  <filename>-pdf   - Generate PDF only for specific file"
	@echo "  <filename>-pptx  - Generate PPTX only for specific file"
	@echo "  <filename>-html  - Generate HTML only for specific file"
	@echo ""
	@echo "Source files: $(MD_FILES)"
	@echo "Output directory: $(OUTPUT_DIR)"