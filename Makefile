MMARK=/usr/local/bin/mmark
#XML2RFC=xml2rfc
XML2RFC=/usr/bin/xml2rfc
SOURCES=Guidance.md
XML=$(SOURCES:.md=.xml)
HTML=$(SOURCES:.md=.html)
TXT=$(SOURCES:.md=.txt)

all: $(XML) $(TXT)

%.xml : %.md
	$(MMARK) $< > $@

%.html : %.xml
	$(XML2RFC) $< --html $@

%.txt : %.xml
	$(XML2RFC) $< --text $@

clean:
	rm $(TXT)
	rm $(XML)
