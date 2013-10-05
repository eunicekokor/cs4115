TARFILES = Makefile wordcount.mll

OBJS = wordcount.cmo

wordcount : $(OBJS)
	ocamlc -o wordcount $(OBJS)

wordcount.ml : wordcount.mll
	ocamllex wordcount.mll

%.cmo : %.ml
	ocamlc -c $<

%.cmi : %.mli
	ocamlc -c $<

.PHONY : clean
clean :
	rm -f wordcount wordcount.ml *.cmo *.cmi
