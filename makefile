EXE = book_generator.exe
SRC = book_generator.cpp
OBJ = $(SRC:.cpp=.o)
COMPILER = g++
CFLAGS = -Wall -O2

SYS = $(shell uname)

ifeq ($(SYS), Linux)
	CFLAGS += -DLINUX
	MESSAGE = "building for Linux"
	EXE = book_generator.exe
else ifeq ($(SYS), Darwin)
	CFLAGS += -DMAC
	MESSAGE = "building for mac"
	EXE = book_generator.dmg
else
	CFLAGS += -DWINDOWS
	MESSAGE = "building for Windows"
	EXE = book_generator.exe
endif

all: build run_book

build: $(OBJ)
	@echo $(MESSAGE)
	$(COMPILER) $(CFLAGS) -o $(EXE) $(OBJ)

run_book:
	./$(EXE)
	$(MAKE) -f makefile.book.mak

$(OBJ): $(SRC)
	$(COMPILER) $(CFLAGS) -c $(SRC) -o $(OBJ)

clean:
	rm -f *.adoc *.md *.exe *.o
