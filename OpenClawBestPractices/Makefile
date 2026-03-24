MARP := marp --no-stdin --html --allow-local-files

MD   := $(wildcard *.md)
HTML := $(MD:.md=.html)
PDF  := $(MD:.md=.pdf)

.PHONY: all html pdf clean preview

all: html

html: $(HTML)

pdf: $(PDF)

%.html: %.md
	$(MARP) --output $@ $<

%.pdf: %.md
	$(MARP) --pdf --output $@ $<

preview:
	@echo "Usage: make preview FILE=OpenClawBestPractices.md"
	@test -n "$(FILE)" && $(MARP) --preview $(FILE) || true

clean:
	rm -f $(HTML) $(PDF)
