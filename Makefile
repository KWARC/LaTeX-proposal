########################################################################
# This Makefile automates maintenance and CTAN submission of complex
# LaTeX packages. 
########################################################################

MAKEDIRS 	= $(DTXDIRS)
TDSCOLL 	?= $(shell basename $$PWD)
DISTDIRS	= $(DTXDIRS)

# targets for repository maintenance
all clean distclean: 
	@for d in $(MAKEDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@) done
package doc:
	@for d in $(DTXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@) done

########################################################################
# CTAN submission
########################################################################
# Directories that should be copied into top-level directories
# - source (the *.dtx and *.ins files),
# - doc    (package/class documentation), and 
# - tex    (*.sty and *.cls, etc that LaTeX reads)
# of the CTAN and TDS submissions
SRCDIRS 	=
DOCDIRS 	= #eu/examples dfg/examples 
DTXDIRS 	= base dfg eu

# targets for CTAN. 
filedate checksum enablechecksum disablechecksum: 
	@for d in $(DTXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@) done

GITURI = git@github.com:KWARC/LaTeX-proposal.git 
TDS.src = 
TDS.doc = README.md
TDS.src = 
include lib/Makefile.ctan

echo:
	echo $(DISTDIRS)
