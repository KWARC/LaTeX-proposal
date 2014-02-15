PREFIX = ../lib
PACKAGE = dfg
TDSCOLL = proposal
DTX.cls.base = dfgproposal
TDS.tex = dfgreporting.cls dfgpdata.sty
CTAN = $(TDS.tex)
EXDIRS = examples

all: package doc
	@for d in $(EXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@); done;

include $(PREFIX)/Makefile.vars
TEXINPUTS = .:
include $(PREFIX)/Makefile.in



