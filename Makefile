.SUFFIXES: .f90 .c .o

EXECS = vaspout2positionf90 # lmpdum2posf90 crtfil4trasietbf90 crt4run_shf90 sumldosf90 crtfil4tbtf90 getiv2datf90 testf90 crtfil4trasief90 
all: $(EXECS)

FC=ifort
FC:=ifort
cc=icc
cc:=icc

LDLIBS= -lreadline

test_obj= test.o jsu_readline.o FCreadline.o
getiv2dat_obj= getiv2dat.o
crt4run_sh_obj= crt4run_sh.o jsu_readline.o FCreadline.o strainget.o
crtfil4tbt_obj= crtfil4tbt.o jsu_readline.o FCreadline.o
lmpdum2pos_obj= lmpdum2pos.o jsu_readline.o FCreadline.o manual.o Lammps2fdf.o changeatnum.o
crtfil4trasie_obj= crtfil4trasie.o jsu_readline.o FCreadline.o manual.o
crtfil4trasietb_obj= crtfil4trasietb.o jsu_readline.o FCreadline.o manual.o
vaspout2positionf90_obj= vaspout2position.o jsu_readline.o FCreadline.o strainget.o
sumldosf90_obj= sumldos.o jsu_readline.o FCreadline.o

sumldosf90: $(sumldosf90_obj)
	$(FC) -o $@ $^ $(LDLIBS)
testf90: $(test_obj)
	$(FC) -o $@ $^ $(LDLIBS)
vaspout2positionf90: $(vaspout2positionf90_obj)
	$(FC) -o $@ $^ $(LDLIBS)
crtfil4trasief90: $(crtfil4trasie_obj)
	$(FC) -o $@ $^ $(LDLIBS)
crtfil4trasietbf90: $(crtfil4trasietb_obj)
	$(FC) -o $@ $^ $(LDLIBS)
crt4run_shf90: $(crt4run_sh_obj)
	$(FC) -o $@ $^ $(LDLIBS)
crtfil4tbtf90: $(crtfil4tbt_obj)
	$(FC) -o $@ $^ $(LDLIBS)
lmpdum2posf90: $(lmpdum2pos_obj)
	$(FC) -o $@ $^ $(LDLIBS)
getiv2datf90: $(getiv2dat_obj)
	$(FC) -o $@ $^
.f90.o:
	$(FC) -c $<
.c.o:
	$(cc) -c $<

sumldos.o: jsu_readline.o
test.o: jsu_readline.o
jsu_readline.o: FCreadline.o
vaspout2position.o: jsu_readline.o strainget.o
crtfil4trasie.o: jsu_readline.o manual.o
crtfil4trasietb.o: jsu_readline.o manual.o
crt4run_sh.o: jsu_readline.o strainget.o
crtfil4tbt.o: jsu_readline.o
lmpdum2pos.o: jsu_readline.o manual.o Lammps2fdf.o changeatnum.o

clean:
	@echo "cleaning up..."
	rm -f $(EXECS) *.o *.mod
