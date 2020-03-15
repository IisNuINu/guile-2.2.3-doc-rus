#OBJS specifies which files to compile as part of the project 
#TEXI = api-data.texi preface.texi  scheme-reading.texi \
#       api-regex.texi  history.texi  scheme-ideas.texi tour.texi \
#       api-foreign.texi api-foreign-objects.texi libguile-foreign-objects.texi \
#       api-overview.texi api-deprecated.texi api-scm.texi api-control.texi \
#       api-macros.texi api-io.texi api-lalr.texi \
#       libguile-snarf.texi libguile-autoconf.texi \
#       autoconf-macros.texi \
#       api-init.texi api-snarf.texi api-utility.texi api-binding.texi \
#       api-smobs.texi  api-procedures.texi  \
#       effective-version.texi  indices.texi scheme-indices.texi version.texi \
#       fdl.texi  intro.texi  scheme-intro.texi \
#       guile-invoke.texi  scheme-scripts.texi \
#       scheme-using.texi libguile-concepts.texi libguile-program.texi \
#       libguile-parallel.texi libguile-linking.texi libguile-extensions.texi \
#       vm.texi goops.texi compiler.texi data-rep.texi

TEXI = \
api-binding.texi          api-utility.texi               mod-getopt-long.texi \
api-control.texi          autoconf-macros.texi           new-docstrings.texi  \
api-coverage.texi         compiler.texi                  posix.texi           \
api-data.texi             curried.texi                   preface.texi         \
api-debug.texi            data-rep.texi                  r6rs.texi            \
api-deprecated.texi       effective-version.texi         repl-modules.texi    \
api-evaluation.texi       expect.texi                    scheme.eps           \
api-foreign-objects.texi  fdl.texi                       scheme-ideas.texi    \
api-foreign.texi          gds.eps                        scheme-indices.texi  \
api-i18n.texi             goops.texi                     scheme-intro.texi    \
api-init.texi             goops-tutorial.texi            scheme-reading.texi  \
api-io.texi               guile-invoke.texi              scheme-scripts.texi  \
api-lalr.texi             guile.texi                     scheme-using.texi    \
api-languages.texi        hierarchy.eps                  scsh.texi            \
api-macros.texi           history.texi                   slib.texi            \
api-memory.texi           indices.texi                   srfi-modules.texi    \
api-modules.texi          intro.texi                     statprof.texi        \
api-options.texi          libguile-autoconf.texi         sxml-match.texi      \
api-overview.texi         libguile-concepts.texi         sxml.texi            \
api-peg.texi              libguile-extensions.texi       texinfo.texi         \
api-procedures.texi       libguile-foreign-objects.texi  tools.texi           \
api-regex.texi            libguile-linking.texi          tour.texi            \
api-scheduling.texi       libguile-parallel.texi         version.texi         \
api-scm.texi              libguile-program.texi          vm.texi              \
api-smobs.texi            libguile-snarf.texi            web.texi             \
api-snarf.texi            match.texi          \
api-undocumented.texi     misc-modules.texi   \


%.texi : %.po
	po2txt -i $*.po -o $*.texi


guile.pdf : $(TEXI)
	echo $(TEXI)
	PDFTEX=luatex TEXINDEX=./rutexindex texi2pdf guile.texi


#CC specifies which compiler we're using 
CC = g++ 

#COMPILER_FLAGS specifies the additional compilation options we're using 
# -w suppresses all warnings 
COMPILER_FLAGS = -w `pkg-config --cflags sdl2`

#LINKER_FLAGS specifies the libraries we're linking against 
LINKER_FLAGS = -lSDL2 

#OBJ_NAME specifies the name of our exectuable 
OBJ_NAME = 01_hello_SDL 

#This is the target that compiles our executable 

all : $(OBJS) 
	$(CC) $(OBJS) $(COMPILER_FLAGS) $(LINKER_FLAGS) -o $(OBJ_NAME)

#CC=gcc
#LDLIBS=`gnome-config --libs gnomeui`
#CFLAGS=-Wall -g `gnome-config --cflags gnomeui`
#LDLIBS=`gnome-config --libs gnomeui`
#CFLAGS=-Wall -g -I /usr/include/glib-2.0
#	bash -c "echo 1"

#make 1.o
#bash -c "echo 1.c 1.c 1.o 1"
#1.c 1.c 1.o 1
#1.o: 1.c
#	bash -c "echo $< $? $@ $*"


