debug: main.d deimos/gmp/package.d deimos/gmp/gmp.d deimos/gmp/integer.d deimos/gmp/floating.d deimos/gmp/rational.d deimos/gmp/operators.d
	dmd -lib -w -wi -unittest -debug -allinst -cov -fPIC -g deimos/gmp/*.d -ofgmp.a
	dmd -L-lgmp main.d gmp.a -ofmain

release: main.d deimos/gmp/package.d deimos/gmp/gmp.d deimos/gmp/integer.d deimos/gmp/floating.d deimos/gmp/rational.d deimos/gmp/operators.d
	dmd -lib -w -wi -release -fPIC -O deimos/gmp/*.d -ofgmp.a
	dmd -L-lgmp -O main.d gmp.a -ofmain

clean:
	rm -f main main.o gmp.a *.lst
