MMARK=mmark
XML2RFC=xml2rfc
SOURCES=Receiver_Guidance.md
XML=$(SOURCES:.md=.xml)
HTML=$(SOURCES:.md=.html)
TXT=$(SOURCES:.md=.txt)

all: $(XML) $(HTML) $(TXT)

%.xml : %.md
	$(MMARK) -xml2 -page $< > $@

%.html : %.xml
	$(XML2RFC) $< --html $@

%.txt : %.xml
	$(XML2RFC) $< --text $@

clean:
	rm $(HTML)
	rm $(TXT)
	rm $(XML)
