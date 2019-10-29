.SUFFIXES:
.SUFFIXES: .svg  

subdirs := $(wildcard p*/)
asvg = $(patsubst %.svg,%.pdf,$(wildcard *.svg))

.PHONY: 

.PHONY: todo $(subdirs) clean

todo:  $(subdirs) $(asvg) libro

libro:
	latexmk -pdf sdr-digital.tex


$(subdirs):
	$(MAKE) -C $@



clean:
	for dir in $(subdirs); do \
	$(MAKE) -C $$dir -f Makefile $@; \
	done	
	latexmk -c
