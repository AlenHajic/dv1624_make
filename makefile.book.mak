FILES = chapter1.adoc chapter2.adoc chapter3.adoc chapter4.adoc
NEWFILE = combined.adoc

default: program

program: $(NEWFILE)
	asciidoctor $(NEWFILE) -o $(NEWFILE:.adoc=.html)
	asciidoctor-pdf $(NEWFILE) -o $(NEWFILE:.adoc=.pdf)

$(NEWFILE): $(FILES)
	cat $(FILES) > $(NEWFILE)

clean:
	rm -f $(NEWFILE) $(NEWFILE:.adoc=.html) $(NEWFILE:.adoc=.pdf)
