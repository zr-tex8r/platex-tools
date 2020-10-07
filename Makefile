TEXMF = $(shell kpsewhich -var-value=TEXMFHOME)

KANJI = -kanji=utf8
#FONTMAP = -f ipaex.map -f ptex-ipaex.map
FONTMAP = -f haranoaji.map -f ptex-haranoaji.map
LTX = platex $(KANJI)
DPX = dvipdfmx $(FONTMAP)

all: plarray.pdf plextarray.pdf plextdelarray.pdf \
	pxatbegshi.pdf \
	pxftnright.pdf \
	pxmulticol.pdf \
	pxxspace.pdf \
	pxeverysel.pdf \
	pxeveryshi.pdf

.SUFFIXES: .tex .dvi .pdf
.tex.dvi:
	$(LTX) $(KANJI) $<
	$(LTX) $(KANJI) $<
	rm *.aux *.log
.dvi.pdf:
	$(DPX) $(FONTMAP) $<

.PHONY: install clean
install:
	mkdir -p ${TEXMF}/doc/platex/platex-tools
	cp ./LICENSE ${TEXMF}/doc/platex/platex-tools/
	cp ./README.md ${TEXMF}/doc/platex/platex-tools/
	cp ./*.pdf ${TEXMF}/doc/platex/platex-tools/
	cp ./*.tex ${TEXMF}/doc/platex/platex-tools/
	mkdir -p ${TEXMF}/tex/platex/platex-tools
	cp ./*.sty ${TEXMF}/tex/platex/platex-tools/
clean:
	rm -f *.dvi *.pdf
