FILES = chapter1.adoc chapter2.adoc chapter3.adoc chapter4.adoc
NEWFILE = book_asciidoc.adoc

default: program

program: $(NEWFILE)
	asciidoctor-pdf $(NEWFILE) -o $(NEWFILE:.adoc=.pdf)
	asciidoctor $(NEWFILE) -o $(NEWFILE:.adoc=.html)

$(NEWFILE): $(FILES)
	cat $(FILES) > $(NEWFILE)

clean:
	rm -f $(NEWFILE) $(NEWFILE:.adoc=.html) $(NEWFILE:.adoc=.pdf)
