OUTNAME = book_generator.exe
SOURCE = book_generator.cpp   
OBJECT = $(SOURCE:.cpp=.o)
CC = g++
FLAGS = -Wall -O2

OSNAME = $(shell uname -s)

ifeq ($(OSNAME), Linux)
	OSMSG = "Compiling for Linux"
	FLAGS += -DLINUX
	OUTNAME = book_generator.exe
else ifeq ($(OSNAME), Darwin)
	OSMSG = "Compiling for Mac"
	FLAGS += -DMAC
	OUTNAME = book_generator.dmg
else
	OSMSG = "Compiling for Windows"
	FLAGS += -DWINDOWS
	OUTNAME = book_generator.exe
endif


default: program run_book

program: $(OBJECT)
	@echo $(OSMSG)
	$(CC) $(FLAGS) -o $(OUTNAME) $(OBJECT)

run_book:
	./$(OUTNAME)              
	$(MAKE) -f makefile.book.mak  

book_generator.o: book_generator.cpp
	$(CC) $(FLAGS) -c book_generator.cpp -o book_generator.o

clean:
	rm -f *.exe *.adoc *.md *.o
