CC = g++
SRCS = src
HDRS = include
ODIR = obj
PROG = main
CXXFLAG = -std=c++11

$(PROG) : $(ODIR) $(ODIR)/main.o
	$(CC) $(ODIR)/main.o $(ODIR)/Matrix.o -o $(PROG)

$(ODIR)/Matrix.o : $(SRCS)/Matrix.cpp $(HDRS)/Matrix.h
	$(CC) -c $< -o $@ $(CXXFLAG)

$(ODIR)/main.o : $(SRCS)/main.cpp $(ODIR)/Matrix.o
	$(CC) -c $< -o $@ $(CXXFLAG)

$(ODIR) :
	if [ ! -d $(ODIR) ]; then mkdir $(ODIR); fi

.PHONY : clean
clean :
	if [ -d $(ODIR) ]; then rm $(ODIR) -r; fi
	if [ -f $(PROG) ]; then rm $(PROG); fi
