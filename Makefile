MMARK=/usr/bin/mmark
#XML2RFC=xml2rfc
XML2RFC=/usr/bin/xml2rfc
SOURCES=Guidance.md
XML=$(SOURCES:.md=.xml)
HTML=$(SOURCES:.md=.html)
TXT=$(SOURCES:.md=.txt)

all: build/$(XML) build/$(TXT)

build/%.xml : %.md
	$(MMARK) $< > $@

build/%.html : build/%.xml
	$(XML2RFC) $< --html $@

build/%.txt : build/%.xml
	$(XML2RFC) $< 

clean:
	rm build/*
